import 'dart:convert';
import 'package:aplikasi_cek_resi/model/response.dart';
import 'package:aplikasi_cek_resi/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  // Ganti URL ini dengan endpoint Firebase Authentication Anda
  static String localUrl = 'YOUR_FIREBASE_AUTH_ENDPOINT';

  Future<ResponseModel> login({
    required String username,
    required String password,
  }) async {
    // Implementasi login ke Firebase Authentication
    // ...

    // Contoh penggunaan Firestore
    var userRef = FirebaseFirestore.instance.collection('users').doc('USER_ID');
    var userData = await userRef.get();
    var user = User.fromJson(userData.data()!);

    return ResponseModel(status: 'success', message: 'Login success', user: user);
  }

  // Implementasi register ke Firebase Authentication
  Future<ResponseModel> register({
    required String fullName,
    required String username,
    required String password,
  }) async {
    // ...

    return ResponseModel(status: 'success', message: 'Registration success');
  }

  registerUser({required String fullName, required String username, required String password}) {}
}
