import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/authentication/phoneNumber.dart';
import 'package:nillq_doctor_app/screens/home/home.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late String loginId;
  late String password;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.08,
              horizontal: screenSize.width * 0.1),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/medical-app.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              height: screenSize.height * 0.01,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Empower your practice.',
                                style: TextStyle(
                                    color: themeColor, fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.05,
                    ),
                    Text(
                      'Login id',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.005,
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Login id required';
                        } else {
                          loginId = value;
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom * 1.2),
                      decoration: textInputDecorationWithTheme.copyWith(
                          hintText: 'Enter your login id',
                          hintStyle: TextStyle(color: Colors.grey[500])),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.005,
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password required';
                        } else {
                          password = value;
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom * 1.2),
                      decoration: textInputDecorationWithTheme.copyWith(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.grey[500])),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('login id: $loginId, password: $password');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
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
                        )),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetPhoneNumber()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/icons/phone-call.png',
                              width: 15.0,
                              height: 15.0,
                            ),
                            SizedBox(
                              width: screenSize.width * 0.02,
                            ),
                            Text(
                              'Sign in with phone number',
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
