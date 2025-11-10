import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/features/profile/presentation/bloc/profile_bloc.dart';

class FirstName extends StatefulWidget {
  const FirstName({super.key});

  @override
  State<FirstName> createState() => _FirstNameState();
}

class _FirstNameState extends State<FirstName> {
  late final TextEditingController _controller;
  final _focusNode = FocusNode();

  @override
  void initState() {
    _controller = TextEditingController(
      text: context.read<ProfileBloc>().state.profile?.firstName ?? '',
    );
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: const InputDecoration(
        labelText: 'First Name',
      ),
      autofillHints: const [AutofillHints.givenName],
      textInputAction: TextInputAction.next,
      onChanged: (value) =>
          context.read<ProfileBloc>().add(UpdateFirstName(value)),
    );
  }
}
