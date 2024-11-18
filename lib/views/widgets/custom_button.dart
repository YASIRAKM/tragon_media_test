
import 'package:flutter/material.dart';
import 'package:tragon_machine_test/utils/colors.dart';
import 'package:tragon_machine_test/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomButton({
    super.key, required this.onPressed, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed:onPressed,
      style: FilledButton.styleFrom(backgroundColor: blackColor,
        // primary: Colors.blueAccent,
        padding:
          const   EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child:  Text(
        title,
        style: titleStyleSmall(12),
      ),
    );
  }
}
