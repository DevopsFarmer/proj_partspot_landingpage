// To parse this JSON data, do
//
//     final eventsMetaDataResponse = eventsMetaDataResponseFromJson(jsonString);

import 'dart:convert';

EventsMetaDataResponse eventsMetaDataResponseFromJson(String str) => EventsMetaDataResponse.fromJson(json.decode(str));

String eventsMetaDataResponseToJson(EventsMetaDataResponse data) => json.encode(data.toJson());

class EventsMetaDataResponse {
  final List<Venue>? venues;
  final List<FoodPref>? foodPrefs;
  final List<EventType>? eventType;
  final List<EventSubType>? eventSubType;
  final List<PartyTheme>? theme;

  EventsMetaDataResponse({
    this.venues,
    this.foodPrefs,
    this.eventType,
    this.eventSubType,
    this.theme,
  });

  factory EventsMetaDataResponse.fromJson(Map<String, dynamic> json) => EventsMetaDataResponse(
    venues: json["venues"] == null ? [] : List<Venue>.from(json["venues"]!.map((x) => Venue.fromJson(x))),
    foodPrefs: json["foodPrefs"] == null ? [] : List<FoodPref>.from(json["foodPrefs"]!.map((x) => FoodPref.fromJson(x))),
    eventType: json["eventType"] == null ? [] : List<EventType>.from(json["eventType"]!.map((x) => EventType.fromJson(x))),
    eventSubType: json["eventSubType"] == null ? [] : List<EventSubType>.from(json["eventSubType"]!.map((x) => EventSubType.fromJson(x))),
    theme: json["theme"] == null ? [] : List<PartyTheme>.from(json["theme"]!.map((x) => PartyTheme.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "venues": venues == null ? [] : List<dynamic>.from(venues!.map((x) => x.toJson())),
    "foodPrefs": foodPrefs == null ? [] : List<dynamic>.from(foodPrefs!.map((x) => x.toJson())),
    "eventType": eventType == null ? [] : List<dynamic>.from(eventType!.map((x) => x.toJson())),
    "eventSubType": eventSubType == null ? [] : List<dynamic>.from(eventSubType!.map((x) => x.toJson())),
    "theme": theme == null ? [] : List<dynamic>.from(theme!.map((x) => x.toJson())),
  };
}

class EventSubType {
  final String? id;
  final String? parent;
  final String? name;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  EventSubType({
    this.id,
    this.parent,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory EventSubType.fromJson(Map<String, dynamic> json) => EventSubType(
    id: json["_id"],
    parent: json["parent"],
    name: json["name"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "parent": parent,
    "name": name,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class EventType {
  final String? id;
  final String? name;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  EventType({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory EventType.fromJson(Map<String, dynamic> json) => EventType(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
class PartyTheme {
  final String? id;
  final String? name;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  PartyTheme({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PartyTheme.fromJson(Map<String, dynamic> json) => PartyTheme(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class FoodPref {
  final String? id;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  FoodPref({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory FoodPref.fromJson(Map<String, dynamic> json) => FoodPref(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Venue {
  final String? id;
  final String? name;
  final String? pincode;
  final String? state;
  final String? city;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Venue({
    this.id,
    this.name,
    this.pincode,
    this.state,
    this.city,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["_id"],
    name: json["name"],
    pincode: json["pincode"],
    state: json["state"],
    city: json["city"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "pincode": pincode,
    "state": state,
    "city": city,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
