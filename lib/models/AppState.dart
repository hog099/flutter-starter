import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'auth/Auth.dart';

@immutable
class AppState {
  final Auth auth;

  const AppState({
    required this.auth,
  });

  factory AppState.initial() {
    return AppState(
      auth: Auth.initial(),
    );
  }
}
