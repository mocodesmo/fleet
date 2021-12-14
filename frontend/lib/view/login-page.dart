import 'package:flutter/material.dart';
import 'package:fleet/cubit/login.dart';
import 'package:fleet/cubit/user.dart';
import 'package:fleet/navigation.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/view/common/loading.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({Key? key}) : super(key: key);

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = context.select((PhoneLoginCubit lc) => lc.state);
    if (loginState.phoneNumber != _controller.text)
      _controller.text = loginState.phoneNumber;

    return Column(
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Phone Number',
            errorText: loginState.phoneNumberError.nullIfEmpty(),
          ),
          onChanged: (t) {
            context.read<PhoneLoginCubit>().phoneNumberChanged(t);
          },
        ),
        if (loginState.sendingOtpError != '')
          Text(
            loginState.sendingOtpError,
            style: context.fonts.caption!.copyWith(
              color: context.colours.error,
            ),
          ),
        const SizedBox(height: 32),
        TextButton(
          onPressed: () {
            context.read<PhoneLoginCubit>().sendOtpClicked();
          },
          child: Text('Send Otp'.toUpperCase()),
        )
      ],
    );
  }
}

class OtpField extends StatefulWidget {
  const OtpField({Key? key}) : super(key: key);

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = context.select((PhoneLoginCubit lc) => lc.state);
    if (loginState.otp != _controller.text) _controller.text = loginState.otp;

    return Column(
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'One Time Pin',
            errorText: loginState.otpError.nullIfEmpty(),
          ),
          onChanged: (t) {
            context.read<PhoneLoginCubit>().otpChanged(t);
          },
        ),
        if (loginState.verifyingOtpError != '')
          Text(
            loginState.verifyingOtpError,
            style: context.fonts.caption!.copyWith(
              color: context.colours.error,
            ),
          ),
        const SizedBox(height: 32),
        TextButton(
          onPressed: () {
            context.read<PhoneLoginCubit>().verifyOtpClicked();
          },
          child: Text('Verify OTP'.toUpperCase()),
        ),
        const SizedBox(height: 80),
        TextButton(
          onPressed: () {
            context.read<PhoneLoginCubit>().reset();
          },
          child: Text(
            'Cancel'.toUpperCase(),
            style: context.fonts.button!.copyWith(
              color: context.colours.error,
            ),
          ),
        )
      ],
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginState = context.select((PhoneLoginCubit lc) => lc.state);
    final userState = context.select((UserCubit uc) => uc.state);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (loginState.sendingOtp) const Loading(text: 'Sending OTP'),
                if (loginState.verifyingOtp)
                  const Loading(text: 'Verifying OTP'),
                if (userState.gettingUser) const Loading(text: 'Logging In'),
                SizedBox(height: context.height * 0.5),
                GestureDetector(
                  onLongPress: () {
                    Navigator.pushNamed(context, Routes.logs);
                    //  context.read<>();
                  },
                  child: Text(
                    'WELCOME',
                    style: context.fonts.headline5,
                  ),
                ),
                const SizedBox(height: 32),
                if (!loginState.sendingOtp &&
                    !loginState.verifyingOtp &&
                    !userState.gettingUser &&
                    !userState.authenticated)
                  if (!loginState.otpSent)
                    const PhoneField()
                  else
                    const OtpField()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
