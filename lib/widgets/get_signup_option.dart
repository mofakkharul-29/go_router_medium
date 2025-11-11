import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GetSignupOption extends StatelessWidget {
  final String? focusedField;
  const GetSignupOption({super.key, required this.focusedField});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: 460,
      top: focusedField != null ? 260 : 415,
      // left: 240,
      left: 195,
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have account?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: ' SignUp',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('sign up clicked!');
                },
            ),
          ],
        ),
      ),
    );
  }
}
