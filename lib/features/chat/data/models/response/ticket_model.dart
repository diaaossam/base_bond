import 'package:bond/features/auth/data/models/response/user_model.dart';

class TicketModel {
  TicketModel({
    this.id,
    this.ticketNumber,
    this.title,
    this.status,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  TicketModel.fromJson(dynamic json) {
    id = json['id'];
    ticketNumber = json['ticket_number'];
    title = json['title'];
    status = json['status'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? ticketNumber;
  String? title;
  String? status;
  UserModel? user;
  String? createdAt;
  String? updatedAt;
}
