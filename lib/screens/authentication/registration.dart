import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/home.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool fileChoosed = false;
  String fileName = '';
  bool openedPickerNullFile = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        title: SafeArea(
            child: Text('Register to App',
                style: TextStyle(
                    color: themeColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.05,
              horizontal: screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Fill in the following details to complete Registration.',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'First Name',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: themeColor),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Enter first name',
                              hintStyle: TextStyle(color: Colors.grey[500]))),
                    ],
                  )),
                  SizedBox(
                    width: screenSize.width * 0.02,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Last Name',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: themeColor),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Enter last name',
                              hintStyle: TextStyle(color: Colors.grey[500]))),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Medical Id',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your Medical Id',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Certificate Upload',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              DottedBorder(
                  dashPattern: [6, 6, 6, 6],
                  child: InkWell(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                      if (result != null) {
                        File certificate = File(result.files.single.path!);
                        print(certificate);
                        fileName = result.files.single.name;
                        setState(() {
                          fileChoosed = true;
                        });
                      } else {
                        print("No files choosen");
                        setState(() {
                          openedPickerNullFile = true;
                        });
                      }
                    },
                    child: Container(
                      height: 70.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.upload_file,
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Choose file to upload',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(
                child: Text(
                  fileChoosed
                      ? fileName
                      : (openedPickerNullFile ? 'No file choosen' : ''),
                  style:
                      TextStyle(color: fileChoosed ? Colors.green : Colors.red),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (route) => false);
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: themeColor,
                    minimumSize: const Size.fromHeight(50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
