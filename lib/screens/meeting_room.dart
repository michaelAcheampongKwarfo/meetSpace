import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meet_space/services/app_const.dart';
import 'package:meet_space/services/auth_services.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class MeetingRoom extends StatefulWidget {
  final String conferenceID;
  final String meetingName;
  final String? meetingTitle;

  const MeetingRoom({
    super.key,
    required this.conferenceID,
    required this.meetingName,
    this.meetingTitle,
  });

  @override
  State<MeetingRoom> createState() => _MeetingRoomState();
}

class _MeetingRoomState extends State<MeetingRoom> {
  final AuthService _authService = AuthService();
  late int uniqueUserID;
  var logger = Logger();
  int generateUniqueUserID() {
    final random = Random();
    return random.nextInt(1000) + 1;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      uniqueUserID = generateUniqueUserID();
    });
    logger.d("unique id : $uniqueUserID");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: appID,
        appSign: appSign,
        userID: _authService.user!.uid,
        userName: widget.meetingName,
        conferenceID: widget.conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          topMenuBarConfig: ZegoTopMenuBarConfig(
            title: widget.meetingTitle ?? '',
          ),
        ),
      ),
    );
  }
}
