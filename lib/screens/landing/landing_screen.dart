import 'package:flutter/material.dart';
import 'package:routing/widgets/custom_elevated_button.dart';
import 'package:routing/widgets/custom_page_view.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() =>
      _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentPage = 0;

  void setCurrentPage(int num) {
    setState(() {
      currentPage = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Column(
          children: [
            CustomPageView(onPageChanged: setCurrentPage),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getIndicator(
                  currentPage == 0
                      ? Colors.lightBlueAccent
                      : Colors.grey,
                ),
                const SizedBox(width: 5),
                getIndicator(
                  currentPage == 1
                      ? Colors.lightBlueAccent
                      : Colors.grey,
                ),
                const SizedBox(width: 5),
                getIndicator(
                  currentPage == 2
                      ? Colors.lightBlueAccent
                      : Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 50),
            currentPage == 2
                ? CustomElevatedButton()
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget getIndicator(Color color) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(3),
        color: color,
      ),
    );
  }
}
