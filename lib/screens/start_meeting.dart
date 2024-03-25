import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meet_space/screens/meeting_room.dart';
import 'package:meet_space/widgets/app_button.dart';
import 'package:meet_space/widgets/app_colors.dart';
import 'package:meet_space/widgets/app_snackbar.dart';
import 'package:meet_space/widgets/app_text.dart';
import 'package:meet_space/widgets/app_textfield.dart';
import 'package:meet_space/widgets/custom_appbar.dart';
import 'package:share_plus/share_plus.dart';

class StartMeetingScreen extends StatefulWidget {
  const StartMeetingScreen({super.key});

  @override
  State<StartMeetingScreen> createState() => _StartMeetingScreenState();
}

class _StartMeetingScreenState extends State<StartMeetingScreen> {
  var logger = Logger();
  late String _meetingRoomId;
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
      _meetingRoomId = generateMeetingID();
    });
    logger.d(_meetingRoomId);
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
                text: 'Start Meeting',
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
                      child: AppText(text: 'Meeting ID : $_meetingRoomId'),
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
                          onPressed: () {
                            if (_userNameController.text.trim().isEmpty ||
                                _meetingTitleController.text.trim().isEmpty) {
                              AppSnackBar().showSnackBar(
                                  context: context,
                                  text: 'All fields are required`',
                                  duration: 2);
                            } else {
                              Share.share(
                                  '${_userNameController.text} is inviting you to join ${_meetingTitleController.text} -- meeting room id : $_meetingRoomId,');
                            }
                          },
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
                onTap: () {
                  if (_meetingTitleController.text.trim().isEmpty ||
                      _meetingTitleController.text.trim().isEmpty) {
                    AppSnackBar().showSnackBar(
                      context: context,
                      text: 'All Fields are required',
                      duration: 2,
                    );
                  } else {
                    try {
                      Navigator.push(
                        context,
                        (MaterialPageRoute(
                          builder: (context) => MeetingRoom(
                            conferenceID: _meetingRoomId,
                            meetingName: _userNameController.text,
                            meetingTitle: _meetingTitleController.text,
                          ),
                        )),
                      );
                    } catch (e) {
                      logger.d(e.toString());
                    }
                  }
                },
                width: screenSize.width,
                child: const AppText(
                  text: 'Start Meeting',
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
