// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  bool? status;
  String? message;
  List<Datum>? data;
  Pagination? pagination;

  QuestionModel({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Datum {
  int? id;
  String? statement;
  String? description;
  DateTime? startOn;
  DateTime? endOn;
  DateTime? publishOn;
  dynamic resultPublishedOn;
  String? bannerImage;
  String? thumbnailImage;
  List<Prediction>? predictions;
  List<CategoryQuestion>? categoryQuestions;
  List<EventQuestion>? eventQuestions;
  bool? isSponsored;
  List<dynamic>? sponsoredQuestions;
  String? sourceOfTruth;
  String? sourceOfTruthLink;
  int? poolSize;
  List<Option>? options;

  Datum({
    this.id,
    this.statement,
    this.description,
    this.startOn,
    this.endOn,
    this.publishOn,
    this.resultPublishedOn,
    this.bannerImage,
    this.thumbnailImage,
    this.predictions,
    this.categoryQuestions,
    this.eventQuestions,
    this.isSponsored,
    this.sponsoredQuestions,
    this.sourceOfTruth,
    this.sourceOfTruthLink,
    this.poolSize,
    this.options,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        statement: json["statement"],
        description: json["description"],
        startOn:
            json["start_on"] == null ? null : DateTime.parse(json["start_on"]),
        endOn: json["end_on"] == null ? null : DateTime.parse(json["end_on"]),
        publishOn: json["publish_on"] == null
            ? null
            : DateTime.parse(json["publish_on"]),
        resultPublishedOn: json["result_published_on"],
        bannerImage: json["banner_image"],
        thumbnailImage: json["thumbnail_image"],
        predictions: json["predictions"] == null
            ? []
            : List<Prediction>.from(
                json["predictions"]!.map((x) => Prediction.fromJson(x))),
        categoryQuestions: json["category_questions"] == null
            ? []
            : List<CategoryQuestion>.from(json["category_questions"]!
                .map((x) => CategoryQuestion.fromJson(x))),
        eventQuestions: json["event_questions"] == null
            ? []
            : List<EventQuestion>.from(
                json["event_questions"]!.map((x) => EventQuestion.fromJson(x))),
        isSponsored: json["is_sponsored"],
        sponsoredQuestions: json["sponsored_questions"] == null
            ? []
            : List<dynamic>.from(json["sponsored_questions"]!.map((x) => x)),
        sourceOfTruth: json["source_of_truth"],
        sourceOfTruthLink: json["source_of_truth_link"],
        poolSize: json["pool_size"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "statement": statement,
        "description": description,
        "start_on": startOn?.toIso8601String(),
        "end_on": endOn?.toIso8601String(),
        "publish_on": publishOn?.toIso8601String(),
        "result_published_on": resultPublishedOn,
        "banner_image": bannerImage,
        "thumbnail_image": thumbnailImage,
        "predictions": predictions == null
            ? []
            : List<dynamic>.from(predictions!.map((x) => x.toJson())),
        "category_questions": categoryQuestions == null
            ? []
            : List<dynamic>.from(categoryQuestions!.map((x) => x.toJson())),
        "event_questions": eventQuestions == null
            ? []
            : List<dynamic>.from(eventQuestions!.map((x) => x.toJson())),
        "is_sponsored": isSponsored,
        "sponsored_questions": sponsoredQuestions == null
            ? []
            : List<dynamic>.from(sponsoredQuestions!.map((x) => x)),
        "source_of_truth": sourceOfTruth,
        "source_of_truth_link": sourceOfTruthLink,
        "pool_size": poolSize,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class CategoryQuestion {
  int? id;
  int? categoryId;
  int? questionId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? visibility;

  CategoryQuestion({
    this.id,
    this.categoryId,
    this.questionId,
    this.createdAt,
    this.updatedAt,
    this.visibility,
  });

  factory CategoryQuestion.fromJson(Map<String, dynamic> json) =>
      CategoryQuestion(
        id: json["id"],
        categoryId: json["category_id"],
        questionId: json["question_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        visibility: json["visibility"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "question_id": questionId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "visibility": visibility,
      };
}

class EventQuestion {
  int? id;
  int? eventId;
  int? questionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  EventQuestion({
    this.id,
    this.eventId,
    this.questionId,
    this.createdAt,
    this.updatedAt,
  });

  factory EventQuestion.fromJson(Map<String, dynamic> json) => EventQuestion(
        id: json["id"],
        eventId: json["event_id"],
        questionId: json["question_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "question_id": questionId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Option {
  int? id;
  String? title;
  int? priority;
  int? investment;
  int? questionId;

  Option({
    this.id,
    this.title,
    this.priority,
    this.investment,
    this.questionId,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        title: json["title"],
        priority: json["priority"],
        investment: json["investment"],
        questionId: json["question_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "priority": priority,
        "investment": investment,
        "question_id": questionId,
      };
}

class Prediction {
  int? id;
  int? userId;
  int? questionId;
  String? optionId;
  int? amount;
  DateTime? dateTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic isWin;
  int? walletTransactionId;
  int? poolWalletId;

  Prediction({
    this.id,
    this.userId,
    this.questionId,
    this.optionId,
    this.amount,
    this.dateTime,
    this.createdAt,
    this.updatedAt,
    this.isWin,
    this.walletTransactionId,
    this.poolWalletId,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        id: json["id"],
        userId: json["user_id"],
        questionId: json["question_id"],
        optionId: json["option_id"],
        amount: json["amount"],
        dateTime: json["date_time"] == null
            ? null
            : DateTime.parse(json["date_time"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isWin: json["is_win"],
        walletTransactionId: json["wallet_transaction_id"],
        poolWalletId: json["pool_wallet_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "question_id": questionId,
        "option_id": optionId,
        "amount": amount,
        "date_time": dateTime?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_win": isWin,
        "wallet_transaction_id": walletTransactionId,
        "pool_wallet_id": poolWalletId,
      };
}

class Pagination {
  int? total;
  int? perPage;
  int? currentPage;
  String? nextUrl;

  Pagination({
    this.total,
    this.perPage,
    this.currentPage,
    this.nextUrl,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        nextUrl: json["next_url"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "current_page": currentPage,
        "next_url": nextUrl,
      };
}
