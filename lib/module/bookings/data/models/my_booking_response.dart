// To parse this JSON data, do
//
//     final myBookingResponse = myBookingResponseFromJson(jsonString);

import 'dart:convert';

MyBookingResponse myBookingResponseFromJson(String str) => MyBookingResponse.fromJson(json.decode(str));

String myBookingResponseToJson(MyBookingResponse data) => json.encode(data.toJson());

class MyBookingResponse {
  final int? statusCode;
  final String? message;
  final List<Datum>? data;

  MyBookingResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory MyBookingResponse.fromJson(Map<String, dynamic> json) => MyBookingResponse(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? id;
  final int? guests;
  final DateTime? createdAt;
  final User? user;
  final Agent? agent;
  final Event? event;

  Datum({
    this.id,
    this.guests,
    this.createdAt,
    this.user,
    this.agent,
    this.event,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    guests: json["guests"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    agent: json["agent"] == null ? null : Agent.fromJson(json["agent"]),
    event: json["event"] == null ? null : Event.fromJson(json["event"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "guests": guests,
    "createdAt": createdAt?.toIso8601String(),
    "user": user?.toJson(),
    "agent": agent?.toJson(),
    "event": event?.toJson(),
  };
}

class Agent {
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

  Agent({
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

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
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

class Event {
  final String? id;
  final Name? name;
  final List<Name>? subType;
  final DateTime? startDate;
  final dynamic endDate;
  final int? numberOfGuests;
  final List<Name>? venueType;
  final List<Name>? foodPreferences;
  final String? specialRequirements;
  final dynamic price;
  final dynamic location;
  final dynamic tags;
  final dynamic whatsIncluded;
  final List<dynamic>? entryRequirements;
  final int? v;

  Event({
    this.id,
    this.name,
    this.subType,
    this.startDate,
    this.endDate,
    this.numberOfGuests,
    this.venueType,
    this.foodPreferences,
    this.specialRequirements,
    this.price,
    this.location,
    this.tags,
    this.whatsIncluded,
    this.entryRequirements,
    this.v,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["_id"],
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    subType: json["subType"] == null ? [] : List<Name>.from(json["subType"]!.map((x) => Name.fromJson(x))),
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"],
    numberOfGuests: json["numberOfGuests"],
    venueType: json["venueType"] == null ? [] : List<Name>.from(json["venueType"]!.map((x) => Name.fromJson(x))),
    foodPreferences: json["foodPreferences"] == null ? [] : List<Name>.from(json["foodPreferences"]!.map((x) => Name.fromJson(x))),
    specialRequirements: json["specialRequirements"],
    price: json["price"],
    location: json["location"],
    tags: json["tags"],
    whatsIncluded: json["whatsIncluded"],
    entryRequirements: json["entryRequirements"] == null ? [] : List<dynamic>.from(json["entryRequirements"]!.map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name?.toJson(),
    "subType": subType == null ? [] : List<dynamic>.from(subType!.map((x) => x.toJson())),
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate,
    "numberOfGuests": numberOfGuests,
    "venueType": venueType == null ? [] : List<dynamic>.from(venueType!.map((x) => x.toJson())),
    "foodPreferences": foodPreferences == null ? [] : List<dynamic>.from(foodPreferences!.map((x) => x.toJson())),
    "specialRequirements": specialRequirements,
    "price": price,
    "location": location,
    "tags": tags,
    "whatsIncluded": whatsIncluded,
    "entryRequirements": entryRequirements == null ? [] : List<dynamic>.from(entryRequirements!.map((x) => x)),
    "__v": v,
  };
}

class Name {
  final String? nameId;
  final String? name;
  final String? id;

  Name({
    this.nameId,
    this.name,
    this.id,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    nameId: json["id"],
    name: json["name"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": nameId,
    "name": name,
    "_id": id,
  };
}

class User {
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

  User({
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
  };
}
