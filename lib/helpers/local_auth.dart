import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticale() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticale()) return false;

      return await _auth.authenticate(
        localizedReason: "Authenticating to access Lock It!!",
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }
}
