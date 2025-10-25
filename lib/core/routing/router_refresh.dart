import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sfb/features/auth/bloc/auth_bloc.dart';

/// A ChangeNotifier that listens to AuthBloc state changes and notifies listeners.
class RouterRefresh extends ChangeNotifier {
  late StreamSubscription<AuthState>? userSubscription;

  RouterRefresh(Stream<AuthState> stream) {
    userSubscription = stream.listen((event) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    // ignore: discarded_futures dispose is not async
    userSubscription?.cancel();
    super.dispose();
  }
}
