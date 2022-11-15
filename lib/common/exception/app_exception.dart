import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';

class AppException implements FirebaseAuthException, Exception {
  @override
  final String message;

  AppException({required this.message});

  @override
  String toString() => message;

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  // TODO: implement credential
  AuthCredential? get credential => throw UnimplementedError();

  @override
  // TODO: implement email
  String? get email => throw UnimplementedError();

  @override
  // TODO: implement phoneNumber
  String? get phoneNumber => throw UnimplementedError();

  @override
  // TODO: implement plugin
  String get plugin => throw UnimplementedError();

  @override
  // TODO: implement stackTrace
  StackTrace? get stackTrace => throw UnimplementedError();

  @override
  // TODO: implement tenantId
  String? get tenantId => throw UnimplementedError();
}