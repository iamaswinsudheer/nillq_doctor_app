import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/authentication/otpVerification.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class GetPhoneNumber extends StatefulWidget {
  const GetPhoneNumber({super.key});

  @override
  State<GetPhoneNumber> createState() => _GetPhoneNumberState();
}

class _GetPhoneNumberState extends State<GetPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SafeArea(
          child: Text(
            'Phone Number',
            style: TextStyle(
                color: themeColor, fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.05,
            horizontal: screenSize.width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your phone number',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenSize.height * 0.015,
            ),
            Text(
              'Enter your 10 digit mobile number to continue logging in to the app.',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
            ),
            SizedBox(
              height: screenSize.height * 0.07,
            ),
            TextFormField(
              cursorColor: themeColor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter phone number here',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: themeColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: themeColor, width: 2.0)),
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
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OtpVerification()));
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: themeColor,
                  minimumSize: const Size.fromHeight(50)),
            ),
          ],
        ),
      )),
    );
  }
}
