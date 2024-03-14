import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class TimeSlots extends StatefulWidget {
  const TimeSlots({super.key});

  @override
  State<TimeSlots> createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlots> {
  int timePickerCount = 1;
  List<Map<String, String>> timeslots = [];

  Map<String, String> addTimesToJson(
      String formattedStartTime, String formattedEndTime) {
    return {'start_time': formattedStartTime, 'end_time': formattedEndTime};
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(
          'Choose time slots',
          style: appbarStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        actions: [
          timePickerCount == 0
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      timePickerCount += 1;
                    });
                  },
                  icon: Padding(
                    padding: EdgeInsets.only(right: screenSize.width * 0.02),
                    child: Icon(
                      Icons.add,
                      size: 30.0,
                      color: themeColor,
                    ),
                  ))
              : Container()
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.02,
            vertical: screenSize.height * 0.01),
        child: Column(children: [
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 0.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: timeslots.length,
                itemBuilder: (context, index) {
                  return CustomTileForSelectedTimeSlots(
                      onTap: () {
                        setState(() {
                          timeslots.removeAt(index);
                        });
                      },
                      startTime: timeslots[index]['start_time']!,
                      endTime: timeslots[index]['end_time']!);
                }),
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: timePickerCount,
                itemBuilder: (context, index) {
                  return CustomContainerForTimePicker(
                    onTap: (formattedStartTime, formattedEndTime) {
                      setState(() {
                        timeslots.add(addTimesToJson(
                            formattedStartTime, formattedEndTime));
                        timePickerCount -= 1;
                      });
                    },
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
