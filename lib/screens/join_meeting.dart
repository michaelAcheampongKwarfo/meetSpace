import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meet_space/screens/meeting_room.dart';
import 'package:meet_space/widgets/app_button.dart';
import 'package:meet_space/widgets/app_colors.dart';
import 'package:meet_space/widgets/app_snackbar.dart';
import 'package:meet_space/widgets/app_text.dart';
import 'package:meet_space/widgets/app_textfield.dart';
import 'package:meet_space/widgets/custom_appbar.dart';

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  late TextEditingController _userNameController;
  late TextEditingController _meetingRoomIDController;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _meetingRoomIDController = TextEditingController();
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
                  text: 'Join Meeting',
                  onTap: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                height: screenSize.height * 0.05,
              ),

              // input for userName, meetingTitle
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
              const AppText(text: 'Meeting room ID'),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              AppTextField(
                width: screenSize.width,
                controller: _meetingRoomIDController,
                hintText: 'Room ID',
              ),
              SizedBox(
                height: screenSize.height * 0.1,
              ),
              AppButton(
                onTap: () {
                  if (_meetingRoomIDController.text.trim().isEmpty ||
                      _userNameController.text.trim().isEmpty) {
                    AppSnackBar().showSnackBar(
                        context: context,
                        text: 'All fields are required',
                        duration: 2);
                  } else {
                    try {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MeetingRoom(
                            conferenceID: _meetingRoomIDController.text.trim(),
                            meetingName: _userNameController.text.trim(),
                          ),
                        ),
                      );
                    } catch (e) {
                      logger.d(e.toString());
                    }
                  }
                },
                width: screenSize.width,
                child: const AppText(
                  text: 'Join Meeting',
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
