import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/authentication/otpVerification.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.1,
              horizontal: screenSize.width * 0.1),
          child: SafeArea(
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/cardiogram.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Text(
                      'NillQ',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: themeColor,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Text(
                      'Hello Doctor!',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: themeColor,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.05,
                    ),
                    Text(
                      'Ready to dive deeper? Sign in for enhanced app functionality.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.05,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign in using phone number',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom * 1.2),
                      decoration: textInputDecorationWithTheme.copyWith(
                          prefixIcon: Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenSize.width * 0.035,
                                screenSize.height * 0.015,
                                screenSize.width * 0.01,
                                screenSize.height * 0.01),
                            child: Text(
                              '+ 91',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          hintText: 'Enter Your Phone Number',
                          hintStyle: TextStyle(color: Colors.grey[500])),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpVerification()));
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          primary: themeColor,
                          minimumSize: const Size.fromHeight(50)),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.05,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        )),
                        SizedBox(
                          width: screenSize.width * 0.03,
                        ),
                        Center(
                          child: Text(
                            'or sign in with',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.03,
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.04,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          //google sign in logic goes here...
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/icons/google_icon.png',
                              width: 15.0,
                              height: 15.0,
                            ),
                            SizedBox(
                              width: screenSize.width * 0.02,
                            ),
                            Text(
                              'Sign in with google',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
