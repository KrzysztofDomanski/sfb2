import 'package:flutter/material.dart';
import 'package:sfb/core/widgets/form_elevated_button.dart';

/// A custom elevated button that shows a progress indicator when submitting.
/// It takes in parameters to control its enabled state, submission state,
/// the callback for when it's pressed, and the button text.
class ElevatedButtonWithProgress extends StatelessWidget {
  final bool isEnabled;
  final bool isSubmitting;
  final VoidCallback onPressed;
  final String buttonText;

  const ElevatedButtonWithProgress({
    required this.isEnabled,
    required this.isSubmitting,
    required this.onPressed,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      child: isSubmitting
          ? CircularProgressIndicator(
              padding: const EdgeInsets.all(2),
              strokeWidth: 2,
              color: Theme.of(context).colorScheme.onPrimary,
            )
          : Text(buttonText),
    );
  }
}
