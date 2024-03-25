import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meet_space/firebase_options.dart';
import 'package:meet_space/screens/home.dart';
import 'package:meet_space/screens/join_meeting.dart';
import 'package:meet_space/screens/profile.dart';
import 'package:meet_space/screens/schedule_meeting.dart';
import 'package:meet_space/screens/start_meeting.dart';
import 'package:meet_space/screens/welcome.dart';
import 'package:meet_space/widgets/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'meetSpace',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.bgColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppColors.transparentColor,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        ),
      ),
      home: const WelcomeScreen(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/startMeeting': (context) => const StartMeetingScreen(),
        '/joinMeeting': (context) => const JoinMeetingScreen(),
        '/scheduleMeeting': (context) => const ScheduleMeetingScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
