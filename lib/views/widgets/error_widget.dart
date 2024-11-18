
import 'package:flutter/material.dart';
import 'package:tragon_machine_test/views/widgets/custom_button.dart';


class ErrorWidgetView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ErrorWidgetView({
    super.key,
    required this.title, required this.onPressed,
  });



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: onPressed,
            title:  'Retry',
          ),
        ],
      ),
    );
  }
}