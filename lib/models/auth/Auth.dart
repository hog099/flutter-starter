import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
class Auth {
  final bool signed;

  const Auth({required this.signed});

  static initial() {}
}
