class OriginModel {
  final String? name;
  final String? residents;
  final String? type;
  final String? dimension;

  OriginModel({this.name, this.residents, this.type, this.dimension});

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(
        name: json['name'],
        residents: json['residents'],
        type: json['type'],
        dimension: json['dimension'],
    );
  }
}