import 'package:aplikasi_cek_resi/model/user.dart';

class ResponseModel {
  final String status;
  final String message;
  final User? user;

  ResponseModel({
    required this.status,
    required this.message,
    this.user,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      status: json['status'],
      message: json['message'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}
