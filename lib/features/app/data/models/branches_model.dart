class BranchesModel {
  BranchesModel({
    this.id,
    this.title,
    this.address,
    this.latitude,
    this.longitude,
    this.status,
  });

  BranchesModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    latitude = double.tryParse(json['lat']);
    longitude = double.tryParse(json['lng']);
    status = json['status'];
  }

  num? id;
  String? title;
  String? address;
  double? latitude;
  double? longitude;
  String? status;

  static List<BranchesModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map((item) => BranchesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
