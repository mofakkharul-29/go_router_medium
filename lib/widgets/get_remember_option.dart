import 'package:flutter/material.dart';

class GetRememberOption extends StatelessWidget {
  final String? focusedField;
  final bool isChecked;
  final void Function(bool?)? onChanged;
  const GetRememberOption({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.focusedField,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 15,
      top: focusedField != null ? 245 : 400,
      child: Row(
        children: [
          Checkbox(
            checkColor: Color.fromRGBO(0, 38, 77, 1.0),
            value: isChecked,
            onChanged: onChanged,
          ),
          const Text(
            'Remember me',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
