import 'dart:convert';

RevenueAccountModel revenueAccountModelFromJson(String str) =>
    RevenueAccountModel.fromJson(json.decode(str));

String revenueAccountModelToJson(RevenueAccountModel data) =>
    json.encode(data.toJson());

class RevenueAccountModel {
  String title;
  int amount;

  RevenueAccountModel({
    required this.title,
    required this.amount,
  });

  factory RevenueAccountModel.fromJson(Map<String, dynamic> json) =>
      RevenueAccountModel(
        title: json["title"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "amount": amount,
      };
}
