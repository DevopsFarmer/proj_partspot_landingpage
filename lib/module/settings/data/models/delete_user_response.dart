// To parse this JSON data, do
//
//     final deleteUserResponse = deleteUserResponseFromJson(jsonString);

import 'dart:convert';

DeleteUserResponse deleteUserResponseFromJson(String str) => DeleteUserResponse.fromJson(json.decode(str));

String deleteUserResponseToJson(DeleteUserResponse data) => json.encode(data.toJson());

class DeleteUserResponse {
  final int? statusCode;
  final String? message;
  final Data? data;

  DeleteUserResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) => DeleteUserResponse(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final String? id;
  final String? fullName;
  final String? email;
  final int? phone;
  final String? gender;
  final bool? isEmailVerified;
  final bool? isNumberVerified;
  final dynamic profilePictureUrl;
  final bool? isProfileComplete;
  final bool? isDeleted;
  final dynamic otp;
  final String? code;
  final dynamic about;
  final dynamic designation;
  final String? userType;
  final DateTime? dob;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? deviceToken;

  Data({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.gender,
    this.isEmailVerified,
    this.isNumberVerified,
    this.profilePictureUrl,
    this.isProfileComplete,
    this.isDeleted,
    this.otp,
    this.code,
    this.about,
    this.designation,
    this.userType,
    this.dob,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.deviceToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
    isEmailVerified: json["isEmailVerified"],
    isNumberVerified: json["isNumberVerified"],
    profilePictureUrl: json["profilePictureUrl"],
    isProfileComplete: json["isProfileComplete"],
    isDeleted: json["isDeleted"],
    otp: json["otp"],
    code: json["code"],
    about: json["about"],
    designation: json["designation"],
    userType: json["userType"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    deviceToken: json["deviceToken"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "gender": gender,
    "isEmailVerified": isEmailVerified,
    "isNumberVerified": isNumberVerified,
    "profilePictureUrl": profilePictureUrl,
    "isProfileComplete": isProfileComplete,
    "isDeleted": isDeleted,
    "otp": otp,
    "code": code,
    "about": about,
    "designation": designation,
    "userType": userType,
    "dob": dob?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "deviceToken": deviceToken,
  };
}
