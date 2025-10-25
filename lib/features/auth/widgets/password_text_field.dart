import 'package:flutter/material.dart';
import 'package:sfb/core/locale/app_locale_extension.dart';

/// A text field widget for entering a password.
/// It obscures the text input for security.
/// It also supports callbacks for text changes and submission events.
/// The [submitEnabled] flag determines the action button on the keyboard.
/// When true, the action button is "done"; otherwise, it's "previous".
class PasswordTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool submitEnabled;

  const PasswordTextField({
    required this.onChanged,
    required this.onSubmitted,
    required this.submitEnabled,
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: _controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.submitEnabled
          ? TextInputAction.done
          : TextInputAction.previous,
      decoration: InputDecoration(
        labelText: context.loc.password,
      ),
    );
  }
}
