import 'package:flutter/material.dart';

class GetDivider extends StatelessWidget {
  const GetDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              color: Colors.black,
              thickness: 1.5,
              endIndent: 10,
            ),
          ),

          Text(
            'OR',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.black,
              thickness: 1.5,
              indent: 10,
            ),
          ),
        ],
      ),
    );
  }
}
