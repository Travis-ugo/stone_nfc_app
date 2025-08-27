import 'package:flutter/gestures.dart';
import 'package:formz/formz.dart';
import 'package:tag_play/core/core.dart';
import 'package:tag_play/features/authentication/login/view/view.dart';
import 'package:tag_play/features/authentication/sign_up/cubit/sign_up_cubit.dart';
import 'package:tag_play/features/authentication/widgets/or_with.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Align(
        // alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleAndSubWidget(
              title: 'Sign Up',
              fontWeight: isTabletGlobal
                  ? FontWeightMade.medium
                  : FontWeightMade.bold,
              fontSize: rSize(FontSize.x3l, FontSize.x4l),
              textColor: Theme.of(context).colorScheme.onBackground,
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: 16.h,
              subWidget: Text(
                'Create your account',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeightMade.regular,
                  fontSize: rSize(FontSize.sm, FontSize.base),
                ),
              ),
            ),
            VSpaceWidget(height: 32.h),
            _EmailInput(),
            VSpaceWidget(height: 24.h),
            _PasswordInput(),
            VSpaceWidget(height: 24.h),
            _ConfirmPasswordInput(),
            VSpaceWidget(height: 24.h),

            _SignUpButton(),
            OrWith(
              padding: isTabletGlobal
                  ? EdgeInsets.symmetric(
                      horizontal: rSize(0, 82.w),
                      vertical: 32.h,
                    )
                  : null,
            ),
            _GoogleSignupButton(),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    color: const Color(0xff333333),
                    fontWeight: FontWeightMade.regular,
                    fontSize: rSize(FontSize.xs, FontSize.base),
                    fontFamily: 'Poppins',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(
                        color: PrimaryColor.primary_500,
                        fontWeight: FontWeightMade.semiBold,
                        decoration: TextDecoration.underline,
                        decorationColor: PrimaryColor.primary_500,
                        fontSize: rSize(FontSize.xs, FontSize.base),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pop();
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicInputField<SignUpCubit, SignUpState>(
      label: 'Email',
      hintText: 'Enter Email',
      key: const Key('signup_email_textfield'),
      errorState: (state) => state.email.displayError != null
          ? 'Must have inputed a wrong email address.'
          : null,
      cubit: context.read<SignUpCubit>(),
      buildWhen: (previous, current) => previous.email != current.email,
      onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicInputField<SignUpCubit, SignUpState>(
      cubit: context.read<SignUpCubit>(),
      key: const Key('signup_password_textfield'),
      buildWhen: (previous, current) => previous.password != current.password,
      errorState: (state) => state.password.isNotValid && !state.password.isPure
          ? 'You’ve entered an invalid password'
          : null,
      hintText: '************',
      label: 'Password',
      onChanged: (password) =>
          context.read<SignUpCubit>().passwordChanged(password),
      isPassword: true,
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicInputField<SignUpCubit, SignUpState>(
      cubit: context.read<SignUpCubit>(),
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      errorState: (state) => state.confirmedPassword.displayError != null
          ? 'Passwords do not match.'
          : null,
      hintText: '************',
      label: 'Re-enter Password',
      key: const Key('signup_confirmedpassword_textfield'),
      onChanged: (confirmPassword) =>
          context.read<SignUpCubit>().confirmedPasswordChanged(confirmPassword),
      isPassword: true,
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (SignUpCubit cubit) => cubit.state.status.isInProgress,
    );

    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return PrimaryButton(
          buttonTitle: 'Create account',
          fontWeight: FontWeightMade.medium,
          fontSize: FontSize.base,
          key: const Key('signUpForm_continue_raisedButton'),
          isFormValid: !(state.status.isInProgress) && state.isValid,
          childWidget: isInProgress
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      strokeWidth: 0.5,
                      color: GreyColors.grey_100,
                    ),
                  ],
                )
              : null,
          onTap: () {
            if (state.isValid) {
              context.read<SignUpCubit>().signUpFormSubmitted();
            }
          },
        );
      },
    );
  }
}

class _GoogleSignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
                  context.read<SignUpCubit>().signUpWithGoogle();
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
                  color: Theme.of(context).colorScheme.onBackground,
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
