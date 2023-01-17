class EpisodeModel {
  final String? name;
  final String? airDate;
  final String? episode;

  EpisodeModel({this.name, this.airDate, this.episode});

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
        name: json['name'],
        airDate: json['air_date'],
        episode: json['episode'],
    );
  }
}