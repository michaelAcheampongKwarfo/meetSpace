import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_space/services/auth_services.dart';
import 'package:meet_space/widgets/app_colors.dart';
import 'package:meet_space/widgets/app_text.dart';
import 'package:meet_space/widgets/schedule_meeting_card.dart';
import 'package:meet_space/widgets/start_meeting_card.dart';
import 'package:meet_space/widgets/join_schedule_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenSize.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Hi, ${_authService.user?.displayName} 👋",
                      fontSize: screenSize.width * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Container(
                        padding: EdgeInsets.all(screenSize.width * 0.01),
                        decoration: const BoxDecoration(
                          color: AppColors.greyColor,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          child: Image.network(
                            (_authService.user?.photoURL).toString(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // start meeting
              StartMeetingCard(
                onTap: () => Navigator.pushNamed(context, '/startMeeting'),
                title: 'New Conference',
                subTitle: 'Create conference URL',
                buttonText: 'Start meeting',
                startColor: AppColors.greyColor,
                endColor: AppColors.primaryColor,
              ),
              // Join or schedule meeting
              SizedBox(
                height: screenSize.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JoinScheduleButton(
                    screenSize: screenSize,
                    icon: CupertinoIcons.videocam_fill,
                    text: 'Join meeting',
                    onTap: () => Navigator.pushNamed(context, '/joinMeeting'),
                  ),
                  JoinScheduleButton(
                    screenSize: screenSize,
                    icon: CupertinoIcons.calendar,
                    text: 'Schedule meeting',
                    onTap: () =>
                        Navigator.pushNamed(context, '/scheduleMeeting'),
                  ),
                ],
              ),

              // notification
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Notification',
                    fontSize: screenSize.width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  const ScheduleMeetingCard(
                    title: 'Team Meeting',
                    subTitle: 'Feb 27, 2024',
                    buttonText: 'Start',
                    startColor: AppColors.primaryColor,
                    endColor: AppColors.greyColor,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  const ScheduleMeetingCard(
                    title: 'Dev Meeting',
                    subTitle: 'Feb 28, 2024',
                    buttonText: 'Start',
                    startColor: AppColors.primaryColor,
                    endColor: AppColors.greyColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
