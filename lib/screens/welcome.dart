import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:meet_space/services/auth_services.dart';
import 'package:meet_space/widgets/app_button.dart';
import 'package:meet_space/widgets/app_colors.dart';
// import 'package:meet_space/widgets/app_snackbar.dart';
import 'package:meet_space/widgets/app_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // final AuthService _authService = AuthService();
  // bool isLoading = false;

  // login() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     bool result = await _authService.signInWithGoogle(context);
  //     if (result) {
  //       Navigator.pushReplacementNamed(context, '/home');
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       AppSnackBar()
  //           .showSnackBar(context: context, text: e.toString(), duration: 2);
  //     }
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Center(
              child: SizedBox(
                height: screenSize.height * 0.4,
                child: LottieBuilder.asset(
                  'lib/assets/animation.json',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            const AppText(
              text: 'Connect,\nCommunicate,\nCollaborate.',
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.03),
              child: const AppText(
                text:
                    'Let`s explore how you can make the\nmost of meetSpace to enhance your\nremote working experience .',
                color: AppColors.greyColor,
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
            ),
            // isLoading
            //     ? const Align(
            //         alignment: Alignment.bottomCenter,
            //         child: CircularProgressIndicator.adaptive(
            //           backgroundColor: AppColors.greyColor,
            //         ),
            //       )
            //     :
            AppButton(
              onTap: () {
                // login();
                Navigator.pushReplacementNamed(context, '/home');
              },
              width: screenSize.width,
              child: const AppText(
                text: 'Get Started',
                color: AppColors.whiteColor,
                fontSize: 13.0,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
