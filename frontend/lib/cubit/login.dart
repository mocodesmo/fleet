import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fleet/cubit/logger.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/pkg/firebase.dart';
import 'package:fleet/pkg/storage.dart';
import 'package:fleet/pkg/validation.dart';

part 'login.freezed.dart';

@freezed
class PhoneLoginState with _$PhoneLoginState {
  const factory PhoneLoginState({
    @Default([]) List<CountryCode> countries,
    @Default('+91') String countryCode,
    @Default('') String phoneNumber,
    @Default('') String phoneNumberError,
    @Default(false) bool sendingOtp,
    @Default(false) bool otpSent,
    @Default('') String sendingOtpError,
    @Default('') String otp,
    @Default('') String otpError,
    @Default(false) bool verifyingOtp,
    @Default('') String verifyingOtpError,
    @Default(false) bool loggedIn,
  }) = _PhoneLoginState;
}

class CountryCode {
  const CountryCode(this.name, this.code);

  final String name;
  final String code;
}

class PhoneLoginCubit extends Cubit<PhoneLoginState> {
  PhoneLoginCubit(
    this._authGateway,
    this._storage,
    this._logger,
  ) : super(const PhoneLoginState()) {
    loadCountries();
  }

  final IAuthGateway _authGateway;
  final IStorage _storage;
  final Logger _logger;

  void loadCountries() async {
    //_logger.addEvent('PhoneLoginCubit.countryCodeChanged');

    try {
      // final response = await rootBundle.loadString('assets/countries.json');
      // final data = await jsonDecode(response)['countries'];
      // //final countries = data['countries'];
      // final List<CountryCode> codes = [];
      // for (final c in data)
      //   codes.add(CountryCode(c['name'] as String, c['code'] as String));

      // emit(state.copyWith(countries: codes, countryCode: '+91'));
    } catch (e, s) {
      _logger.addExpectionToLog(
        e,
        'PhoneLoginCubit.loadCountries',
        s,
      );
    }
  }

  void countryCodeChanged(String code) {
    emit(state.copyWith(countryCode: code));
  }

  void phoneNumberChanged(String phone) {
    emit(state.copyWith(phoneNumber: phone, phoneNumberError: ''));
  }

  void sendOtpClicked() async {
    try {
      if (!Validation.isPhoneNumber(
        // state.countryCode + ' ' +
        '+91 ' + state.phoneNumber,
      )) {
        emit(
          state.copyWith(
            phoneNumberError: 'Enter a valid phone number',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          sendingOtp: true,
          phoneNumberError: '',
          sendingOtpError: '',
        ),
      );

      String phone = '+91 ';
      phone += state.phoneNumber.substring(0, 4) + ' ';
      phone += state.phoneNumber.substring(4, 7) + ' ';
      phone += state.phoneNumber.substring(7, state.phoneNumber.length) + ' ';

      await _authGateway.sendOTP(
        number: phone,
        onSent: otpSent,
        onError: otpError,
      );

      emit(state.copyWith(sendingOtp: false, otpSent: true));
    } catch (e, s) {
      _logger.addExpectionToLog(
        e,
        'PhoneLoginCubit.sendOtpClicked',
        s,
      );

      emit(
        state.copyWith(
          sendingOtp: false,
          sendingOtpError: 'Error Occured. Please try again.',
        ),
      );
    }
  }

  void otpError(String error) {
    emit(
      state.copyWith(
        sendingOtp: false,
        sendingOtpError: error,
        //'Error Occured. Please try again.',
      ),
    );
  }

  void otpSent() {
    emit(state.copyWith(sendingOtp: false, otpSent: true));
  }

  void otpChanged(String text) {
    emit(state.copyWith(otp: text, otpError: ''));
  }

  void verifyOtpClicked() async {
    try {
      if (!Validation.isNumeric(state.otp) || state.otp.length != 6) {
        emit(state.copyWith(otpError: 'Enter a valid otp', otp: ''));
        return;
      }

      emit(
        state.copyWith(
          verifyingOtp: true,
          otpError: '',
          verifyingOtpError: '',
        ),
      );

      final token = await _authGateway.phoneLogin(
        phone: '+91 ' + state.phoneNumber,
        code: state.otp,
      );

      if (token == '') throw '';

      await _storage.saveOrUpdateOne(StoreKeys.token.name, token);
      await _storage.saveOrUpdateOne(
        StoreKeys.phone.name,
        // state.countryCode + 
        '+91 ' + state.phoneNumber,
      );

      emit(state.copyWith(verifyingOtp: false, loggedIn: true));
    } catch (e, s) {
      _logger.addExpectionToLog(
        e,
        'PhoneLoginCubit.verifyOtpClicked',
        s,
      );

      if (e is FirebaseAuthException && e.code == 'invalid-verification-code')
        emit(
          state.copyWith(
            verifyingOtp: false,
            verifyingOtpError: 'Invalid OTP',
          ),
        );
      else
        emit(
          state.copyWith(
            verifyingOtp: false,
            verifyingOtpError: 'Error Occured. Please try again.',
          ),
        );
    }
  }

  void reset() {
    //final countries = state.countries;
    emit(const PhoneLoginState());
    // loadCountries();
  }
}
