import 'package:blogging/core/theme/app_pallete.dart';
import 'package:blogging/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blogging/features/auth/presentation/pages/login_page.dart';
import 'package:blogging/features/auth/presentation/widgets/auth_field.dart';
import 'package:blogging/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign up.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthField(
                hintText: 'name',
                controller: nameController,
                isObsureText: false,
              ),
              // const AuthField(controller: nameController,hintText: 'Name'),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                hintText: 'Email',
                controller: emailController,
                isObsureText: false,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                hintText: 'password',
                controller: passwordController,
                isObsureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              AuthGradientButton(
                buttonText: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthSignup(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            name: nameController.text.trim(),
                          ),
                        );
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),

              //Richtext used when same line different type text write and different style.
              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
