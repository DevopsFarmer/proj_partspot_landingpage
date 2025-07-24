// To parse this JSON data, do
//
//     final planEventRequest = planEventRequestFromJson(jsonString);

import 'dart:convert';

PlanEventRequest planEventRequestFromJson(String str) => PlanEventRequest.fromJson(json.decode(str));

String planEventRequestToJson(PlanEventRequest data) => json.encode(data.toJson());

class PlanEventRequest {
  final Name? name;
  final List<Name>? subType;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? numberOfGuests;
  final List<Name>? venueType;
  final List<Name>? foodPreferences;
  final String? specialRequirements;
  final String? note;

  PlanEventRequest({
    this.name,
    this.subType,
    this.startDate,
    this.endDate,
    this.numberOfGuests,
    this.venueType,
    this.foodPreferences,
    this.specialRequirements,
    this.note
  });

  factory PlanEventRequest.fromJson(Map<String, dynamic> json) => PlanEventRequest(
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    subType: json["subType"] == null ? [] : List<Name>.from(json["subType"]!.map((x) => Name.fromJson(x))),
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    numberOfGuests: json["numberOfGuests"],
    venueType: json["venueType"] == null ? [] : List<Name>.from(json["venueType"]!.map((x) => Name.fromJson(x))),
    foodPreferences: json["foodPreferences"] == null ? [] : List<Name>.from(json["foodPreferences"]!.map((x) => Name.fromJson(x))),
    specialRequirements: json["specialRequirements"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "name": name?.toJson(),
    "subType": subType == null ? [] : List<dynamic>.from(subType!.map((x) => x.toJson())),
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "numberOfGuests": numberOfGuests,
    "venueType": venueType == null ? [] : List<dynamic>.from(venueType!.map((x) => x.toJson())),
    "foodPreferences": foodPreferences == null ? [] : List<dynamic>.from(foodPreferences!.map((x) => x.toJson())),
    "specialRequirements": specialRequirements,
    "note": note,
  };
}

class Name {
  final String? id;
  final String? name;

  Name({
    this.id,
    this.name,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
