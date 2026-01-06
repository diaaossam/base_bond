class BranchesModel {
  final int? id;
  final String? name;
  final String? location;
  final double? latitude;
  final double? longitude;

  BranchesModel({
    required this.id,
    required this.name,
    required this.location,
    required this.latitude,
    required this.longitude,
  });
}

final List<BranchesModel> branches = [
  BranchesModel(
    id: 1,
    name: "الإدارة",
    location: "https://goo.gl/maps/DTDc3sJ6LBykGYodA",
    latitude: 30.205061,
    longitude: 31.268318,
  ),
  BranchesModel(
    id: 2,
    name: "المرج 1 - فرع العقباوي",
    location: "https://goo.gl/maps/sqHrw1cjpgw4YKw9A",
    latitude: 30.165175,
    longitude: 31.297498,
  ),
  BranchesModel(
    id: 3,
    name: "المرج 3 - فرع د هشام",
    location: "https://goo.gl/maps/RmGbdpBiqxooyvV56",
    latitude: 30.166298,
    longitude: 31.290716,
  ),
  BranchesModel(
    id: 4,
    name: "المرج 2 - فرع هبة",
    location: "https://goo.gl/maps/ysHmgiabe9khrgvLA",
    latitude: 30.166713,
    longitude: 31.297785,
  ),
  BranchesModel(
    id: 5,
    name: "المرج 4 - فرع أبو طالب",
    location: "https://goo.gl/maps/FaRpqbrYxotaRe9H6",
    latitude: 30.163184,
    longitude: 31.291483,
  ),
  BranchesModel(
    id: 6,
    name: "المرج 5 - فرع مي",
    location: "https://goo.gl/maps/hYPdfzw6GoKvNKHx7",
    latitude: 30.168291,
    longitude: 31.285493,
  ),
  BranchesModel(
    id: 7,
    name: "العشرين",
    location: "https://goo.gl/maps/RkKdxF5ZP1bVWq3A9",
    latitude: 30.158752,
    longitude: 31.285033,
  ),
  BranchesModel(
    id: 8,
    name: "جسر السويس - عبد الله كامل (حديقة بدر)",
    location: "https://maps.app.goo.gl/hcFsumHDmUup18eRA",
    latitude: 30.182157,
    longitude: 31.312696,
  ),
  BranchesModel(
    id: 9,
    name: "فرع أمل بدر",
    location: "https://goo.gl/maps/Pwh6kA3uzgVqj5yR9",
    latitude: 30.180043,
    longitude: 31.315183,
  ),
  BranchesModel(
    id: 10,
    name: "المطرية 1",
    location: "https://goo.gl/maps/XNZVYX7wYXvvCjPb7",
    latitude: 30.210987,
    longitude: 31.261409,
  ),
  BranchesModel(
    id: 11,
    name: "المطرية 2",
    location: "https://goo.gl/maps/Yu2XqW2qTEWTZRQ16",
    latitude: 30.203141,
    longitude: 31.272327,
  ),
  BranchesModel(
    id: 12,
    name: "شبرا 1",
    location: "https://goo.gl/maps/YjrRGWFCDsUSUJvWA",
    latitude: 30.111934,
    longitude: 31.161966,
  ),
  BranchesModel(
    id: 13,
    name: "ولي العهد",
    location: "https://goo.gl/maps/Hfn9VywKG2eaUMQR7",
    latitude: 30.139417,
    longitude: 31.258273,
  ),
  BranchesModel(
    id: 14,
    name: "العبور",
    location: "https://goo.gl/maps/mqcen5ggqQkSJgb99",
    latitude: 30.180443,
    longitude: 31.354118,
  ),
  BranchesModel(
    id: 15,
    name: "شيراتون",
    location: "https://maps.app.goo.gl/dcxgs1Dna46AhHuV8",
    latitude: 30.025707,
    longitude: 31.221233,
  ),
];
/*
[
{"id":1,"name":"الإدارة","lat":30.205061,"lng":31.268318},
{"id":2,"name":"المرج 1 - فرع العقباوي","lat":30.165175,"lng":31.297498},
{"id":3,"name":"المرج 3 - فرع د هشام","lat":30.166298,"lng":31.290716},
{"id":4,"name":"المرج 2 - فرع هبة","lat":30.166713,"lng":31.297785},
{"id":5,"name":"المرج 4 - فرع أبو طالب","lat":30.163184,"lng":31.291483},
{"id":6,"name":"المرج 5 - فرع مي","lat":30.168291,"lng":31.285493},
{"id":7,"name":"العشرين","lat":30.158752,"lng":31.285033},
{"id":8,"name":"جسر السويس - عبد الله كامل (حديقة بدر)","lat":30.182157,"lng":31.312696},
{"id":9,"name":"فرع أمل بدر","lat":30.180043,"lng":31.315183},
{"id":10,"name":"المطرية 1","lat":30.210987,"lng":31.261409},
{"id":11,"name":"المطرية 2","lat":30.203141,"lng":31.272327},
{"id":12,"name":"شبرا 1","lat":30.111934,"lng":31.161966},
{"id":13,"name":"ولي العهد","lat":30.139417,"lng":31.258273},
{"id":14,"name":"العبور","lat":30.180443,"lng":31.354118},
{"id":15,"name":"شيراتون","lat":30.025707,"lng":31.221233}
]
*/
