import 'package:event_radar2/authentication/login_screen.dart';
import 'package:flutter/material.dart';

import '../components/auth/auth_textfield.dart';
import '../components/auth/sign_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool? isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.asset(
                    'asset/img/auth/app_logo.png',
                    height: 59,
                    width: 59,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome Back,",
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "sign in to continue",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      //email field
                      AuthTextField(
                        hintText: 'Email',
                        obscureText: false,
                        prefixIcon:
                            Image.asset('asset/img/auth/email_icon.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      //password field
                      AuthTextField(
                        hintText: 'Password',
                        obscureText: false,
                        prefixIcon: Image.asset('asset/img/auth/key_icon.png'),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Confirm Password",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      //confirm password field
                      AuthTextField(
                        hintText: 'Re-enter Password',
                        obscureText: false,
                        prefixIcon: Image.asset('asset/img/auth/key_icon.png'),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isAgree,
                        activeColor: Colors.blue,
                        tristate: false,
                        onChanged: (newBool) {
                          setState(() {
                            isAgree = newBool;
                          });
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "By checking the box, you agree to our ",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Terms & Conditions.",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                MyButton(
                  onTap: () {},
                  text: 'Sign Up',
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        ' Sign In',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
