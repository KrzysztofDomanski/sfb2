import 'package:flutter/material.dart';
import 'package:sfb/core/locale/app_locale_extension.dart';

/// A text field widget for entering an email address.
/// It supports callbacks for text changes and submission events.
/// The [submitEnabled] flag determines the action button on the keyboard.
/// When true, the action button is "done"; otherwise, it's "next".
class EmailTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool submitEnabled;

  const EmailTextField({
    required this.onChanged,
    required this.onSubmitted,
    required this.submitEnabled,
    super.key,
  });

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      keyboardType: TextInputType.emailAddress,
      textInputAction: widget.submitEnabled
          ? TextInputAction.done
          : TextInputAction.next,
      decoration: InputDecoration(labelText: context.loc.email),
    );
  }
}
