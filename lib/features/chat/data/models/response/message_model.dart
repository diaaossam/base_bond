class MessageModel {
  MessageModel({
      this.id, 
      this.message, 
      this.user, 
      this.admin, 
      this.isAdmin, 
      this.createdAt,});

  MessageModel.fromJson(dynamic json) {
    id = json['id'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    admin = json['admin'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
  }
  num? id;
  String? message;
  User? user;
  dynamic admin;
  bool? isAdmin;
  String? createdAt;
MessageModel copyWith({  num? id,
  String? message,
  User? user,
  dynamic admin,
  bool? isAdmin,
  String? createdAt,
}) => MessageModel(  id: id ?? this.id,
  message: message ?? this.message,
  user: user ?? this.user,
  admin: admin ?? this.admin,
  isAdmin: isAdmin ?? this.isAdmin,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['admin'] = admin;
    map['is_admin'] = isAdmin;
    map['created_at'] = createdAt;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.name,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
User copyWith({  num? id,
  String? name,
}) => User(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}