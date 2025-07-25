// To parse this JSON data, do
//
//     final curatedPartyListResponse = curatedPartyListResponseFromJson(jsonString);

import 'dart:convert';

CuratedPartyListResponse curatedPartyListResponseFromJson(String str) => CuratedPartyListResponse.fromJson(json.decode(str));

String curatedPartyListResponseToJson(CuratedPartyListResponse data) => json.encode(data.toJson());

class CuratedPartyListResponse {
  final List<Datum>? data;
  final int? total;
  final int? page;
  final int? limit;
  final int? totalPages;

  CuratedPartyListResponse({
    this.data,
    this.total,
    this.page,
    this.limit,
    this.totalPages,
  });

  factory CuratedPartyListResponse.fromJson(Map<String, dynamic> json) => CuratedPartyListResponse(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    total: json["total"],
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "total": total,
    "page": page,
    "limit": limit,
    "totalPages": totalPages,
  };
}

class Datum {
  final String? id;
  final Name? name;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? numberOfGuests;
  final String? title;
  final int? price;
  final String? location;
  final List<String>? tags;
  final List<String>? whatsIncluded;
  final List<EntryRequirement>? entryRequirements;
  final EdBy? hostedBy;
  final EdBy? partneredBy;
  final List<dynamic>? subType;
  final List<dynamic>? venueType;
  final List<dynamic>? foodPreferences;
  final int? v;
  final String? notes;
  final List<ThemeId>? themeIds;
  final String? image;

  Datum({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.numberOfGuests,
    this.title,
    this.price,
    this.location,
    this.tags,
    this.whatsIncluded,
    this.entryRequirements,
    this.hostedBy,
    this.partneredBy,
    this.subType,
    this.venueType,
    this.foodPreferences,
    this.v,
    this.notes,
    this.themeIds,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    numberOfGuests: json["numberOfGuests"],
    title: json["title"],
    price: json["price"],
    location: json["location"],
    tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
    whatsIncluded: json["whatsIncluded"] == null ? [] : List<String>.from(json["whatsIncluded"]!.map((x) => x)),
    entryRequirements: json["entryRequirements"] == null ? [] : List<EntryRequirement>.from(json["entryRequirements"]!.map((x) => EntryRequirement.fromJson(x))),
    hostedBy: json["hostedBy"] == null ? null : EdBy.fromJson(json["hostedBy"]),
    partneredBy: json["partneredBy"] == null ? null : EdBy.fromJson(json["partneredBy"]),
    subType: json["subType"] == null ? [] : List<dynamic>.from(json["subType"]!.map((x) => x)),
    venueType: json["venueType"] == null ? [] : List<dynamic>.from(json["venueType"]!.map((x) => x)),
    foodPreferences: json["foodPreferences"] == null ? [] : List<dynamic>.from(json["foodPreferences"]!.map((x) => x)),
    v: json["__v"],
    notes: json["notes"],
    themeIds: json["themeIds"] == null ? [] : List<ThemeId>.from(json["themeIds"]!.map((x) => ThemeId.fromJson(x))),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name?.toJson(),
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "numberOfGuests": numberOfGuests,
    "title": title,
    "price": price,
    "location": location,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "whatsIncluded": whatsIncluded == null ? [] : List<dynamic>.from(whatsIncluded!.map((x) => x)),
    "entryRequirements": entryRequirements == null ? [] : List<dynamic>.from(entryRequirements!.map((x) => x.toJson())),
    "hostedBy": hostedBy?.toJson(),
    "partneredBy": partneredBy?.toJson(),
    "subType": subType == null ? [] : List<dynamic>.from(subType!.map((x) => x)),
    "venueType": venueType == null ? [] : List<dynamic>.from(venueType!.map((x) => x)),
    "foodPreferences": foodPreferences == null ? [] : List<dynamic>.from(foodPreferences!.map((x) => x)),
    "__v": v,
    "notes": notes,
    "themeIds": themeIds == null ? [] : List<dynamic>.from(themeIds!.map((x) => x.toJson())),
    "image": image,
  };
}

class EntryRequirement {
  final String? title;
  final List<String>? list;
  final String? id;
  final String? type;
  final String? description;

  EntryRequirement({
    this.title,
    this.list,
    this.id,
    this.type,
    this.description,
  });

  factory EntryRequirement.fromJson(Map<String, dynamic> json) => EntryRequirement(
    title: json["title"],
    list: json["list"] == null ? [] : List<String>.from(json["list"]!.map((x) => x)),
    id: json["_id"],
    type: json["type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x)),
    "_id": id,
    "type": type,
    "description": description,
  };
}

class EdBy {
  final String? image;
  final String? name;
  final String? location;
  final String? id;

  EdBy({
    this.image,
    this.name,
    this.location,
    this.id,
  });

  factory EdBy.fromJson(Map<String, dynamic> json) => EdBy(
    image: json["image"],
    name: json["name"],
    location: json["location"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
    "location": location,
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

class ThemeId {
  final String? id;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  ThemeId({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ThemeId.fromJson(Map<String, dynamic> json) => ThemeId(
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
