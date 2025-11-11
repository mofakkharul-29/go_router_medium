import 'package:flutter/material.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getButton('assets/images/g.png'),
          const SizedBox(width: 30),
          getButton('assets/images/p.jpg'),
          const SizedBox(width: 30),
          getButton('assets/images/f.png'),
        ],
      ),
    );
  }

  Widget getButton(String path) {
    return IconButton(
      onPressed: () {},
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      icon: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(path),
      ),
    );
  }
}
