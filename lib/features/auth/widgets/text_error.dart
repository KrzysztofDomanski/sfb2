import 'package:flutter/material.dart';
import 'package:sfb/core/theme/theme_extensions.dart';

/// A widget that displays an error message in a styled text.
/// If [errorMessage] is null, it returns an empty widget.
class TextError extends StatelessWidget {
  final String? errorMessage;

  const TextError({
    required this.errorMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (errorMessage == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Text(
        errorMessage!,
        style: TextStyle(color: context.colorScheme.error),
      ),
    );
  }
}
