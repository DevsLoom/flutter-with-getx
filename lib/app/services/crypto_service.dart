// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:encrypt/encrypt.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:crypto/crypto.dart'; // for sha256

// class CryptoService {
//   static Encrypter _getEncrypter() {
//     final secret = dotenv.env['ENCRYPTION_KEY'];
//     if (secret == null || secret.isEmpty) {
//       throw Exception('ENCRYPTION_KEY is not set in .env file');
//     }

//     // Generate 32-byte AES-256 key from secret using SHA-256
//     final sha256Digest = sha256.convert(utf8.encode(secret));
//     final key = Key(Uint8List.fromList(sha256Digest.bytes));

//     return Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
//   }

//   /// Encrypts a JSON-encodable object and returns IV:EncryptedToken
//   static String encrypt(Map<String, dynamic> jsonData) {
//     final iv = IV.fromSecureRandom(16); // 16 bytes for AES-CBC
//     final encrypter = _getEncrypter();
//     final jsonString = json.encode(jsonData);
//     final encrypted = encrypter.encrypt(jsonString, iv: iv);
//     return '${iv.base64}:${encrypted.base64}';
//   }

//   /// Decrypts a token in IV:EncryptedText format and returns parsed JSON
//   static Map<String, dynamic> decrypt(String token) {
//     try {
//       final parts = token.split(':');
//       if (parts.length != 2) throw Exception('Invalid token format');

//       final ivBase64 = parts[0];
//       String encryptedBase64 = parts[1];

//       // Pad base64 if needed
//       while (encryptedBase64.length % 4 != 0) {
//         encryptedBase64 += '=';
//       }

//       final base64Key = dotenv.env['ENCRYPTION_KEY'];
//       if (base64Key == null || base64Key.isEmpty) {
//         throw Exception('ENCRYPTION_KEY is not set');
//       }

//       // Derive 32-byte AES-256 key using SHA-256
//       final keyBytes = sha256.convert(utf8.encode(base64Key)).bytes;
//       final key = Key(Uint8List.fromList(keyBytes));

//       // Decode and validate IV
//       final ivBytes = base64.decode(ivBase64);
//       if (ivBytes.length != 16) {
//         throw Exception(
//           'Invalid IV length: ${ivBytes.length}. Expected 16 bytes.',
//         );
//       }
//       final iv = IV(ivBytes);

//       final encrypter = Encrypter(
//         AES(key, mode: AESMode.cbc, padding: 'PKCS7'),
//       );
//       final decrypted = encrypter.decrypt64(encryptedBase64, iv: iv);

//       final result = json.decode(decrypted);
//       if (result is Map<String, dynamic>) {
//         return result;
//       } else {
//         throw Exception('Decrypted data is not a JSON object');
//       }
//     } catch (e, st) {
//       print('❌ Decryption failed: $e');
//       print('📌 Stacktrace: $st');
//       throw Exception('Decryption failed: $e');
//     }
//   }
// }

import 'dart:convert';
//import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CryptoService {
  // CryptoService(this.secret);

  /// Derives a 32-byte AES key from the secret using SHA-256
  Uint8List _getEncryptionKey() {
    final secretBytes = utf8.encode(dotenv.env['ENCRYPTION_KEY'] ?? '');
    final digest = sha256.convert(secretBytes);
    return Uint8List.fromList(digest.bytes);
  }

  /// Decrypts the base64 `iv:encrypted` string back into a Dart object
  Map<String, dynamic> decryptData(String token) {
    final parts = token.split(':');
    if (parts.length != 2) {
      throw ArgumentError('Invalid token format');
    }

    final iv = encrypt.IV.fromBase64(parts[0]);
    final encryptedData = parts[1];

    final key = encrypt.Key(_getEncryptionKey());
    final encrypter = encrypt.Encrypter(
      encrypt.AES(key, mode: encrypt.AESMode.cbc),
    );
    final decrypted = encrypter.decrypt64(encryptedData, iv: iv);

    final result = jsonDecode(decrypted);
    final type = result is List ? 'array' : result.runtimeType.toString();

    return {'type': type, 'result': result};
  }
}
