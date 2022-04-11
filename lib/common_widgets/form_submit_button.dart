import 'package:flutter/material.dart';
import 'package:time_tracker/common_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({Key? key,
    required String text,
    required VoidCallback? onPressed,
  }) : super(key: key,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          height: 44,
          color: Colors.indigo,
          borderRadius: 4.0,
          onPressed: onPressed,
        );
}
