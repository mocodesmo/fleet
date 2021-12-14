import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:fleet/api/user.dart';
import 'package:fleet/cubit/state.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthGateway {
  Future sendOTP({
    required String number,
    required Function onSent,
    required Function(String) onError,
  });

  Future<String> phoneLogin({
    required String phone,
    required String code,
  });

  Future<String> refreshUser();

  Future signOutt();
}

class FirebaseAPIS implements IAuthGateway {
  FirebaseAPIS() {
    init();
  }

  FirebaseAuth? _auth;
  String _verificationId = '';
  ConfirmationResult? confirmationResult;

  Future init() async {
    if (!kIsWeb) {
      await Firebase.initializeApp();
    }
    _auth = FirebaseAuth.instance;
    FirebaseAnalytics.instance;
    FirebaseCrashlytics.instance.crash();
    FirebasePerformance.instance;
  }

  @override
  Future sendOTP({
    required String number,
    required Function onSent,
    required Function(String) onError,
  }) async {
    if (_auth == null) throw 'No Firebase Auth';

    _verificationId = '';
    if (!kIsWeb)
      await _auth!.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) {
          print(':::verificationCompleted ' + credential.smsCode!);
          // onSent();
        },
        verificationFailed: (FirebaseAuthException e) {
          print('failed::' + e.toString());
          UserAPI().postIssue(issue: e.toString());
          logger.addEvent(
            'Firebase.verificationFailed:: ' + e.toString(),
          );

          onError(e.message ?? 'Error Occured.');
          // throw 'verificationFailed';
          // print(':::verificationFailed ' + e.message!);
        },
        codeSent: (String verificationId, int? resendToken) {
          print('veri1::' + verificationId);
          _verificationId = verificationId;
          onSent();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('veri2::' + verificationId);

          _verificationId = verificationId;
          // onSent();
        },
      );
    else {
      confirmationResult = await _auth!.signInWithPhoneNumber(number);

      onSent();
    }
  }

  @override
  Future<String> phoneLogin({
    required String phone,
    required String code,
  }) async {
    if (_auth == null) throw 'No Firebase Auth';

    //ConfirmationResult confirmationResult = await _auth!.signInWithPhoneNumber(
    //phone,
    //RecaptchaVerifier(
    //  container: 'recaptcha',
    //  size: RecaptchaVerifierSize.compact,
    //  theme: RecaptchaVerifierTheme.dark,
    //  onSuccess: () {
    //    print('onSuccess');
    //  },
    //  onError: (exception) {
    //    print('onError');
    //  },
    //  onExpired: () {
    //    print('onExpired');
    //  },
    //),
    //);
    //UserCredential userCred = await confirmationResult.confirm(code);
    if (!kIsWeb) {
      final cred = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: code,
      );
      final user = await _auth!.signInWithCredential(cred);
      if (user.user == null) throw 'User Error';
      final token = await user.user!.getIdToken();
      return token;
    } else {
      final cred = PhoneAuthProvider.credential(
        verificationId: confirmationResult!.verificationId,
        smsCode: code,
      );
      final user = await _auth!.signInWithCredential(cred);

      // final UserCredential user = await confirmationResult!.confirm('123456');
      if (user.user == null) throw 'User Error';
      final token = await user.user!.getIdToken();
      return token;
    }
  }

  @override
  Future<String> refreshUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (_auth == null) throw 'No Firebase Auth';

    final user = _auth!.currentUser;
    if (user == null) //throw 'no user';
      return '';
    final token = await user.getIdToken(true);
    return token;
  }

  @override
  Future signOutt() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (_auth == null) throw 'No Firebase Auth';

    _auth = FirebaseAuth.instance;
    await _auth!.signOut();
  }
}

class DummyAuthGateway implements IAuthGateway {
  @override
  Future<String> phoneLogin({
    required String phone,
    required String code,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    return 'abc';
  }

  @override
  Future<String> refreshUser() async {
    await Future.delayed(const Duration(seconds: 3));

    return 'abcdef';
  }

  @override
  Future sendOTP({
    required String number,
    required Function onSent,
    required Function(String) onError,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future signOutt() async {}
}
