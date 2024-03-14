import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/scheduleAppointments.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.date_range,
                color: Colors.grey[800],
              ),
              title: Text(
                'Schedule appointments',
                style: TextStyle(color: Colors.grey[800]),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleAppointments()));
              },
            )
          ],
        ),
      ),
    );
  }
}
