import 'package:flutter/gestures.dart';
import 'package:formz/formz.dart';
import 'package:tag_play/core/core.dart';
import 'package:tag_play/features/authentication/login/cubit/login_cubit.dart';
import 'package:tag_play/features/authentication/sign_up/view/sign_up_page.dart'; 
import 'package:tag_play/features/authentication/widgets/or_with.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status.isFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage ?? 'Authentication Failure',
                    ),
                  ),
                );
            }
          },
          child: Align(
            // alignment: const Alignment(0, -1 / 3),
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      TitleAndSubWidget(
                        title: 'Login',
                        fontWeight: isTabletGlobal
                            ? FontWeightMade.medium
                            : FontWeightMade.bold,
                        fontSize: rSize(FontSize.x3l, FontSize.x4l),
                        textColor: BlackColors.black_500,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        gap: 16.h,
                        subWidget: Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: GreyColors.grey_700,
                            fontWeight: FontWeightMade.regular,
                            fontSize: rSize(FontSize.sm, FontSize.base),
                          ),
                        ),
                      ),
                      VSpaceWidget(height: 32.h),
                      const SizedBox(height: 16),
                      _EmailInput(),
                      VSpaceWidget(height: 24.h),
                      _PasswordInput(),

                      VSpaceWidget(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: PrimaryColor.primary_500,
                              fontSize: FontSize.sm,
                              fontWeight: FontWeightMade.semiBold,
                            ),
                          ),
                        ),
                      ),

                      VSpaceWidget(height: 16.h),
                      _LoginButton(),

                      OrWith(
                        padding: isTabletGlobal
                            ? EdgeInsets.symmetric(
                                horizontal: rSize(0, 82.w),
                                vertical: 32.h,
                              )
                            : null,
                      ),
                      _GoogleLoginButton(),
                      const SizedBox(height: 24),
                      _SignUpButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicInputField<LoginCubit, LoginState>(
      label: 'Email',
      hintText: 'Enter Email',
      key: const Key('login_email_textfield'),
      errorState: (state) => state.email.displayError != null
          ? 'Must have inputed a wrong email address.'
          : null,
      cubit: context.read<LoginCubit>(),
      buildWhen: (previous, current) => previous.email != current.email,
      onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicInputField<LoginCubit, LoginState>(
      cubit: context.read<LoginCubit>(),
      key: const Key('loginForm_passwordInput_textField'),
      buildWhen: (previous, current) => previous.password != current.password,
      errorState: (state) => state.password.isNotValid && !state.password.isPure
          ? 'You’ve entered an invalid password'
          : null,
      hintText: '************',
      label: 'Password',
      onChanged: (password) =>
          context.read<LoginCubit>().passwordChanged(password),
      isPassword: true,
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginCubit cubit) => cubit.state.status.isInProgress,
    );

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return PrimaryButton(
          buttonTitle: 'Login',
          fontWeight: FontWeightMade.medium,
          fontSize: FontSize.base,
          key: const Key('loginForm_continue_raisedButton'),
          isFormValid: state.status.isInProgress ? false : state.isValid,
          childWidget: isInProgress
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const CircularProgressIndicator()],
                )
              : null,
          onTap: state.isValid && !state.status.isInProgress
              ? () {
                  context.read<LoginCubit>().logInWithCredentials();
                }
              : () {},
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: 'Don’t have an account? ',
          style: TextStyle(
            color: const Color(0xff333333),
            fontWeight: FontWeightMade.regular,
            fontSize: rSize(FontSize.xs, FontSize.base),
            fontFamily: 'Poppins',
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Create Account',
              style: TextStyle(
                color: PrimaryColor.primary_500,
                fontWeight: FontWeightMade.semiBold,
                decoration: TextDecoration.underline,
                decorationColor: PrimaryColor.primary_500,
                fontSize: rSize(FontSize.xs, FontSize.base),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).push<void>(SignUpPage.route());
                },
            ),
          ],
        ),
      ),
    );
  }
}

bool get isTabletGlobal {
  double screenWidth = ScreenUtil().screenWidth;
  return screenWidth >= 600;
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return PrimaryButton(
          isFilled: false,
          borderColor: GreyColors.grey_400,
          fontWeight: FontWeightMade.medium,
          fontSize: FontSize.base,
          borderRadius: 16.r,
          buttonHeight: isTabletGlobal ? 52.h : null,
          onTap: state.status.isInProgress
              ? () {}
              : () {
                  context.read<LoginCubit>().logInWithGoogle();
                },
          key: const Key('loginForm_googleLogin_raisedButton'),
          childWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/google.svg', height: 20.h),
              HSpaceWidget(width: 9.w),
              Text(
                'Continue with Google',
                style: TextStyle(
                  color: BlackColors.black_500,
                  fontSize: FontSize.sm,
                  fontWeight: FontWeightMade.regular,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
