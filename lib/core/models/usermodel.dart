// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  User? user;
  String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  int? id;
  String? uuid;
  String? name;
  String? firstName;
  String? lastName;
  String? nickName;
  String? phone;
  String? countryCode;
  String? countryUnicode;
  String? dialCode;
  String? email;
  String? profilePhoto;
  dynamic address;
  dynamic street;
  dynamic city;
  dynamic state;
  dynamic zip;
  dynamic userOpinions;
  DateTime? phoneVerifiedAt;
  dynamic emailVerifiedAt;
  String? nameAsPerPan;
  String? panNumber;
  String? aadharNumber;
  String? dateOfBirth;
  String? nationality;
  int? userBalance;
  int? tierId;
  int? setInterest;
  int? isNameUpdated;
  int? isRoiViewed;
  List<dynamic>? document;
  bool? isOnline;

  User({
    this.id,
    this.uuid,
    this.name,
    this.firstName,
    this.lastName,
    this.nickName,
    this.phone,
    this.countryCode,
    this.countryUnicode,
    this.dialCode,
    this.email,
    this.profilePhoto,
    this.address,
    this.street,
    this.city,
    this.state,
    this.zip,
    this.userOpinions,
    this.phoneVerifiedAt,
    this.emailVerifiedAt,
    this.nameAsPerPan,
    this.panNumber,
    this.aadharNumber,
    this.dateOfBirth,
    this.nationality,
    this.userBalance,
    this.tierId,
    this.setInterest,
    this.isNameUpdated,
    this.isRoiViewed,
    this.document,
    this.isOnline,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        nickName: json["nick_name"],
        phone: json["phone"],
        countryCode: json["country_code"],
        countryUnicode: json["country_unicode"],
        dialCode: json["dial_code"],
        email: json["email"],
        profilePhoto: json["profile_photo"],
        address: json["address"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        userOpinions: json["user_opinions"],
        phoneVerifiedAt: json["phone_verified_at"] == null
            ? null
            : DateTime.parse(json["phone_verified_at"]),
        emailVerifiedAt: json["email_verified_at"],
        nameAsPerPan: json["name_as_per_pan"],
        panNumber: json["pan_number"],
        aadharNumber: json["aadhar_number"],
        dateOfBirth: json["date_of_birth"],
        nationality: json["nationality"],
        userBalance: json["user_balance"],
        tierId: json["tier_id"],
        setInterest: json["set_interest"],
        isNameUpdated: json["is_name_updated"],
        isRoiViewed: json["is_roi_viewed"],
        document: json["document"] == null
            ? []
            : List<dynamic>.from(json["document"]!.map((x) => x)),
        isOnline: json["is_online"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "nick_name": nickName,
        "phone": phone,
        "country_code": countryCode,
        "country_unicode": countryUnicode,
        "dial_code": dialCode,
        "email": email,
        "profile_photo": profilePhoto,
        "address": address,
        "street": street,
        "city": city,
        "state": state,
        "zip": zip,
        "user_opinions": userOpinions,
        "phone_verified_at": phoneVerifiedAt?.toIso8601String(),
        "email_verified_at": emailVerifiedAt,
        "name_as_per_pan": nameAsPerPan,
        "pan_number": panNumber,
        "aadhar_number": aadharNumber,
        "date_of_birth": dateOfBirth,
        "nationality": nationality,
        "user_balance": userBalance,
        "tier_id": tierId,
        "set_interest": setInterest,
        "is_name_updated": isNameUpdated,
        "is_roi_viewed": isRoiViewed,
        "document":
            document == null ? [] : List<dynamic>.from(document!.map((x) => x)),
        "is_online": isOnline,
      };
}
