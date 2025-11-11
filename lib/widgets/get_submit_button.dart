import 'package:flutter/material.dart';

class GetSubmitButton extends StatelessWidget {
  final String userEmail;
  final String userPassword;
  final void Function(String email, String password)
  onSubmit;
  const GetSubmitButton({
    super.key,
    required this.userEmail,
    required this.userPassword,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4),
        ),
        minimumSize: Size(230, 50),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        onSubmit(userEmail, userPassword);
      },
      child: const Text('LOGIN'),
    );
  }
}
