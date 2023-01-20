class OriginModel {
  final String? name;
  final String? type;
  final String? dimension;

  OriginModel({this.name, this.type, this.dimension});

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(
        name: json['name'],
        type: json['type'],
        dimension: json['dimension'],
    );
  }
}