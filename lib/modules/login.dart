import 'package:flutter/material.dart';
import 'package:iteda_flutter_course/layout/home_page_screen.dart';
import 'package:iteda_flutter_course/shared/components/component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/flutterImg.png",
                    width: 300,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  defaultTextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email',
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock,
                    isPassword: isPasswordShow,
                    suffix: isPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },

                  ),
                  ///////////////////

                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      fixedSize: Size(MediaQuery.of(context).size.width / 1.2,
                          MediaQuery.of(context).size.height / 13),
                    ),
                    onPressed: _login,
                    child: const Text(
                      'Log In',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Forgot Password? No Tap me',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black54,
                        backgroundColor: Colors.grey[300],
                        fixedSize: Size(MediaQuery.of(context).size.width / 1.2,
                            MediaQuery.of(context).size.height / 13)),
                    onPressed: () {},
                    child: const Text('No Account? Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    String email = emailController.text;
    String password = passwordController.text;
    if (password.length>3&&!email.isEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }else if(formKey.currentState!.validate()) {
      print(emailController.text);
      print(passwordController.text);
    }
  }

}
