// To parse this JSON data, do
//
//     final curatedBookedResponse = curatedBookedResponseFromJson(jsonString);

import 'dart:convert';

CuratedBookedResponse curatedBookedResponseFromJson(String str) => CuratedBookedResponse.fromJson(json.decode(str));

String curatedBookedResponseToJson(CuratedBookedResponse data) => json.encode(data.toJson());

class CuratedBookedResponse {
  final String? message;
  final Booking? booking;

  CuratedBookedResponse({
    this.message,
    this.booking,
  });

  factory CuratedBookedResponse.fromJson(Map<String, dynamic> json) => CuratedBookedResponse(
    message: json["message"],
    booking: json["booking"] == null ? null : Booking.fromJson(json["booking"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "booking": booking?.toJson(),
  };
}

class Booking {
  final String? eventId;
  final String? userId;
  final int? guests;
  final String? id;
  final AssignedAgent? assignedAgent;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Booking({
    this.eventId,
    this.userId,
    this.guests,
    this.id,
    this.assignedAgent,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    eventId: json["eventId"],
    userId: json["userId"],
    guests: json["guests"],
    id: json["_id"],
    assignedAgent: json["assignedAgent"] == null ? null : AssignedAgent.fromJson(json["assignedAgent"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "eventId": eventId,
    "userId": userId,
    "guests": guests,
    "_id": id,
    "assignedAgent": assignedAgent?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class AssignedAgent {
  final String? id;
  final int? phone;
  final String? gender;
  final bool? isEmailVerified;
  final bool? isNumberVerified;
  final bool? isProfileComplete;
  final bool? isDeleted;
  final dynamic otp;
  final String? code;
  final String? userType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? deviceToken;
  final String? about;
  final String? designation;
  final DateTime? dob;
  final String? email;
  final String? fullName;
  final String? profilePictureUrl;

  AssignedAgent({
    this.id,
    this.phone,
    this.gender,
    this.isEmailVerified,
    this.isNumberVerified,
    this.isProfileComplete,
    this.isDeleted,
    this.otp,
    this.code,
    this.userType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.deviceToken,
    this.about,
    this.designation,
    this.dob,
    this.email,
    this.fullName,
    this.profilePictureUrl,
  });

  factory AssignedAgent.fromJson(Map<String, dynamic> json) => AssignedAgent(
    id: json["_id"],
    phone: json["phone"],
    gender: json["gender"],
    isEmailVerified: json["isEmailVerified"],
    isNumberVerified: json["isNumberVerified"],
    isProfileComplete: json["isProfileComplete"],
    isDeleted: json["isDeleted"],
    otp: json["otp"],
    code: json["code"],
    userType: json["userType"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    deviceToken: json["deviceToken"],
    about: json["about"],
    designation: json["designation"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    email: json["email"],
    fullName: json["full_name"],
    profilePictureUrl: json["profilePictureUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phone": phone,
    "gender": gender,
    "isEmailVerified": isEmailVerified,
    "isNumberVerified": isNumberVerified,
    "isProfileComplete": isProfileComplete,
    "isDeleted": isDeleted,
    "otp": otp,
    "code": code,
    "userType": userType,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "deviceToken": deviceToken,
    "about": about,
    "designation": designation,
    "dob": dob?.toIso8601String(),
    "email": email,
    "full_name": fullName,
    "profilePictureUrl": profilePictureUrl,
  };
}
