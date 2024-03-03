class AircraftModel {
  String? id;
  String? name;
  String? metro;
  String? createdAt;
  String? updatedAt;

  AircraftModel({
    this.id,
    this.name,
    this.metro,
    this.createdAt,
    this.updatedAt,
  });
  AircraftModel.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    name = json['name']?.toString();
    metro = json['metro']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['metro'] = metro;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}