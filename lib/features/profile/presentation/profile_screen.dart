import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/core/dependency_injector.dart';
import 'package:sfb/core/theme/theme_extensions.dart';
import 'package:sfb/core/widgets/navigation.dart';
import 'package:sfb/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfb/features/profile/presentation/widgets/first_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static String get route => '/profile';

  @override
  Widget build(BuildContext context) {
    return Navigation(
      title: 'Profile',
      selectedIndex: 1,
      child: BlocProvider(
        create: (context) => getIt<ProfileBloc>()..add(const LoadProfile('')),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    children: [
                      Text(
                        'Edit your profile',
                        style: context.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      const FirstName(),
                      const SizedBox(height: 16),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                        ),
                        autofillHints: [AutofillHints.familyName],
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      const ElevatedButton(
                        onPressed: null,
                        child: Text('Save Profile'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
