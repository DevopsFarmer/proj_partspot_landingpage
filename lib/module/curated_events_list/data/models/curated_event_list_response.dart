// To parse this JSON data, do
//
//     final curatedEventList = curatedEventListFromJson(jsonString);

import 'dart:convert';

List<CuratedEventList> curatedEventListFromJson(String str) => List<CuratedEventList>.from(json.decode(str).map((x) => CuratedEventList.fromJson(x)));

String curatedEventListToJson(List<CuratedEventList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CuratedEventList {
  final String? id;
  final Name? name;
  final List<dynamic>? subType;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? numberOfGuests;
  final List<dynamic>? venueType;
  final List<dynamic>? foodPreferences;
  final String? title;
  final int? price;
  final String? location;
  final List<String>? tags;
  final List<String>? whatsIncluded;
  final List<EntryRequirement>? entryRequirements;
  final EdBy? hostedBy;
  final EdBy? partneredBy;
  final int? v;

  CuratedEventList({
    this.id,
    this.name,
    this.subType,
    this.startDate,
    this.endDate,
    this.numberOfGuests,
    this.venueType,
    this.foodPreferences,
    this.title,
    this.price,
    this.location,
    this.tags,
    this.whatsIncluded,
    this.entryRequirements,
    this.hostedBy,
    this.partneredBy,
    this.v,
  });

  factory CuratedEventList.fromJson(Map<String, dynamic> json) => CuratedEventList(
    id: json["_id"],
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    subType: json["subType"] == null ? [] : List<dynamic>.from(json["subType"]!.map((x) => x)),
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    numberOfGuests: json["numberOfGuests"],
    venueType: json["venueType"] == null ? [] : List<dynamic>.from(json["venueType"]!.map((x) => x)),
    foodPreferences: json["foodPreferences"] == null ? [] : List<dynamic>.from(json["foodPreferences"]!.map((x) => x)),
    title: json["title"],
    price: json["price"],
    location: json["location"],
    tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
    whatsIncluded: json["whatsIncluded"] == null ? [] : List<String>.from(json["whatsIncluded"]!.map((x) => x)),
    entryRequirements: json["entryRequirements"] == null ? [] : List<EntryRequirement>.from(json["entryRequirements"]!.map((x) => EntryRequirement.fromJson(x))),
    hostedBy: json["hostedBy"] == null ? null : EdBy.fromJson(json["hostedBy"]),
    partneredBy: json["partneredBy"] == null ? null : EdBy.fromJson(json["partneredBy"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name?.toJson(),
    "subType": subType == null ? [] : List<dynamic>.from(subType!.map((x) => x)),
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "numberOfGuests": numberOfGuests,
    "venueType": venueType == null ? [] : List<dynamic>.from(venueType!.map((x) => x)),
    "foodPreferences": foodPreferences == null ? [] : List<dynamic>.from(foodPreferences!.map((x) => x)),
    "title": title,
    "price": price,
    "location": location,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "whatsIncluded": whatsIncluded == null ? [] : List<dynamic>.from(whatsIncluded!.map((x) => x)),
    "entryRequirements": entryRequirements == null ? [] : List<dynamic>.from(entryRequirements!.map((x) => x.toJson())),
    "hostedBy": hostedBy?.toJson(),
    "partneredBy": partneredBy?.toJson(),
    "__v": v,
  };
}

class EntryRequirement {
  final String? title;
  final List<String?>? list;
  final String? id;

  EntryRequirement({
    this.title,
    this.list,
    this.id,
  });

  factory EntryRequirement.fromJson(Map<String, dynamic> json) => EntryRequirement(
    title: json["title"],
    list: json["list"] == null ? [] : List<String?>.from(json["list"]?.map((x) => x)),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x)),
    "_id": id,
  };
}

class EdBy {
  final String? image;
  final String? name;
  final String? location;
  final String? description;
  final String? id;

  EdBy({
    this.image,
    this.name,
    this.location,
    this.description,
    this.id,
  });

  factory EdBy.fromJson(Map<String, dynamic> json) => EdBy(
    image: json["image"],
    name: json["name"],
    location: json["location"],
    description: json["description"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
    "location": location,
    "description": description,
    "_id": id,
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
