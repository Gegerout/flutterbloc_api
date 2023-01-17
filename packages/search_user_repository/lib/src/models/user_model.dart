class UserModel {
  final String? name;
  final String? image;
  final String? status;
  final String? species;
  final String? gender;
  final String? origin;

  UserModel({this.name, this.image, this.status, this.species, this.gender, this.origin});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        image: json['image'],
        status: json['status'],
        species: json['species'],
        gender: json['gender'],
        origin: json['origin']?['name']
    );
  }
}