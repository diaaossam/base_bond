class SocialModel {
  SocialModel(
      {this.id,
      this.ulid,
      this.name,
      this.publicName,
      this.email,
      this.phone,
      this.uid});

  SocialModel.fromJson(dynamic json) {
    id = json['id'];
    ulid = json['ulid'];
    name = json['name'];
    uid = json['uid'];
    publicName = json['public_name'];
    email = json['email'];
    phone = json['phone'];
  }

  num? id;
  String? ulid;
  String? name;
  dynamic publicName;
  String? email;
  String? uid;
  dynamic phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ulid'] = ulid;
    map['name'] = name;
    map['uid'] = uid;
    map['public_name'] = publicName;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }
}
