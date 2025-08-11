import 'package:authentication_repository/authentication_repository.dart';
import 'package:tag_play/core/core.dart';
import 'package:tag_play/features/authentication/login/cubit/login_cubit.dart';
import 'package:tag_play/features/authentication/login/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
