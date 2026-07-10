import 'package:flutter/material.dart';
import 'package:myapp/auth/services/auth_service.dart';
import 'package:myapp/auth/views/sign_up.dart';
import 'package:myapp/auth/widgets/custom_button.dart';
import 'package:myapp/auth/widgets/custom_textform_field.dart';
import 'package:myapp/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //

  final key = GlobalKey<FormState>();

  //

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              Center(
                child: Text(
                  "Welcome Login to Continue",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),

              //
              SizedBox(height: 50),

              CustomTextformField(
                controller: emailController,
                prefixIcon: Icon(Icons.mail),
                hintText: "Enter Your Mail",
                label: "Email",
              ),

              // PAsswoed Field
              CustomTextformField(
                prefixIcon: Icon(Icons.lock_open),
                hintText: "Enter Your Password",
                label: "Password",
                controller: passwordController,
              ),

              //
              SizedBox(height: 20),

              CustomButton(
                onTap: () async {
                  await authService
                      .login(emailController.text, passwordController.text)
                      .then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        ),
                      );
                },
                label: "Login",
              ),

              SizedBox(height: 20),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
