import 'package:blogging/core/theme/app_pallete.dart';
import 'package:blogging/features/auth/presentation/pages/signup_page.dart';
import 'package:blogging/features/auth/presentation/widgets/auth_field.dart';
import 'package:blogging/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 30,
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
                buttonText: 'Log In',
                onPressed: (){
                  
                },
              ),
              const SizedBox(
                height: 30,
              ),

              //Richtext used when same line different type text write and different style.
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SignupPage.route(),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
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
