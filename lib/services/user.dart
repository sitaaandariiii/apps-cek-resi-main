import 'dart:convert';
import 'package:aplikasi_cek_resi/model/response.dart';
import 'package:aplikasi_cek_resi/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  final String baseUrl = 'YOUR_FIREBASE_DATABASE_URL';

  Future<ResponseModel> registerUser({
    required String fullName,
    required String username,
    required String password,
  }) async {
    // Implementasi simpan data ke Firestore
    var newUser = User(
      id: 'USER_ID',
      username: username,
      password: password,
      email: 'user@example.com',
    );

    await FirebaseFirestore.instance.collection('users').doc(newUser.id).set(newUser.toJson());

    return ResponseModel(status: 'success', message: 'User registration success');
  }
}
