import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meet_space/widgets/app_button.dart';
import 'package:meet_space/widgets/app_colors.dart';
import 'package:meet_space/widgets/app_text.dart';
import 'package:meet_space/widgets/app_textfield.dart';
import 'package:meet_space/widgets/custom_appbar.dart';

class ScheduleMeetingScreen extends StatefulWidget {
  const ScheduleMeetingScreen({super.key});

  @override
  State<ScheduleMeetingScreen> createState() => _ScheduleMeetingScreenState();
}

class _ScheduleMeetingScreenState extends State<ScheduleMeetingScreen> {
  var logger = Logger();
  late String meetingRoomId;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _meetingTitleController = TextEditingController();

  String generateMeetingID() {
    final random = Random();
    int meetingID = random.nextInt(1000000000);
    return meetingID.toString().padLeft(10, '0');
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      meetingRoomId = generateMeetingID();
    });
    logger.d(meetingRoomId);
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _meetingTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenSize.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                text: 'Schedule Meeting',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),

              // random meeting id
              Container(
                width: screenSize.width,
                // padding: EdgeInsets.only(
                //   top: screenSize.width * 0.02,
                //   bottom: screenSize.width * 0.02,
                //   left: screenSize.width * 0.05,
                // ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(screenSize.width * 0.05),
                  color: AppColors.greyColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.width * 0.02,
                        bottom: screenSize.width * 0.02,
                        left: screenSize.width * 0.05,
                      ),
                      child: AppText(text: 'Meeting ID : $meetingRoomId'),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: screenSize.width * 0.02,
                        bottom: screenSize.width * 0.02,
                        left: screenSize.width * 0.05,
                        right: screenSize.width * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(screenSize.width * 0.05),
                          bottomRight: Radius.circular(screenSize.width * 0.05),
                        ),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.share,
                            size: screenSize.width * 0.07,
                          ),
                          tooltip: 'Share meeting ID',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // input for userName, meetingTitle
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              const AppText(text: 'Your name for this meeting'),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              AppTextField(
                width: screenSize.width,
                controller: _userNameController,
                hintText: 'Name',
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              const AppText(text: 'Your title for this meeting'),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              AppTextField(
                width: screenSize.width,
                controller: _meetingTitleController,
                hintText: 'Meeting Title',
              ),
              SizedBox(
                height: screenSize.height * 0.1,
              ),
              AppButton(
                onTap: () {},
                width: screenSize.width,
                child: const AppText(
                  text: 'Schedule Meeting',
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
