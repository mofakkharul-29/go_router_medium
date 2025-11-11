import 'package:flutter/material.dart';

class LogForm extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final IconData icon;
  final String hintText;
  final TextInputType inputType;
  final void Function(String text) onTextFeildTextChange;
  const LogForm({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.icon,
    required this.hintText,
    required this.inputType,
    required this.focusNode,
    required this.onTextFeildTextChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 8,
      ),
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: inputType,
        style: TextStyle(color: Colors.white, fontSize: 18),
        controller: controller,
        maxLines: 1,
        obscureText: obscureText,
        cursorColor: Colors.white,
        cursorWidth: 3,
        cursorRadius: Radius.circular(5),
        decoration: InputDecoration(
          prefixIcon: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 38, 77, 1.0),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          prefixIconColor: Colors.white70,
          // prefixIconConstraints: BoxConstraints(),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white70,
            fontSize: 15,
          ),
          filled: true,
          fillColor: Color.fromRGBO(55, 81, 116, 1.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.grey),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8,
          ),
        ),
        onChanged: (value) {
          onTextFeildTextChange(value);
        },
        onTapOutside: (event) {
          focusNode.unfocus();
        },
      ),
    );
  }
}
