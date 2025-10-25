import 'package:flutter/material.dart';

/// A custom elevated button that spans the full width with a fixed height.
class FormElevatedButton extends StatelessWidget {
  const FormElevatedButton({required this.child, super.key, this.onPressed});

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
