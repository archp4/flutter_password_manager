import 'dart:convert';

class SafeKeeper {
  static const String _key = "_key";
  static final RegExp _encryptedPattern = RegExp(r'^[A-Za-z0-9+/=]+$');

  // Encrypt the text using a simple XOR cipher
  static String encrypt(String text) {
    if (text.isEmpty) return text;

    // Check if the text is already encrypted
    if (_encryptedPattern.hasMatch(text)) {
      return text;
    }

    List<int> encrypted = [];
    for (int i = 0; i < text.length; i++) {
      final keyChar = _key[i % _key.length];
      final charCode = text.codeUnitAt(i) ^ keyChar.codeUnitAt(0);
      encrypted.add(charCode);
    }

    return base64Encode(encrypted);
  }

  // Decrypt the text using the same XOR cipher
  static String decrypt(String text) {
    if (text.isEmpty) return text;

    // Check if the text is actually encrypted
    if (!_encryptedPattern.hasMatch(text)) {
      return text;
    }

    try {
      List<int> decoded = base64Decode(text);
      List<String> decrypted = [];

      for (int i = 0; i < decoded.length; i++) {
        final keyChar = _key[i % _key.length];
        final charCode = decoded[i] ^ keyChar.codeUnitAt(0);
        decrypted.add(String.fromCharCode(charCode));
      }

      return decrypted.join();
    } catch (e) {
      // If decryption fails, return original text
      return text;
    }
  }
}
