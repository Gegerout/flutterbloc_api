import 'package:flutter/material.dart';
import 'package:search_user_repository/search_user_repository.dart';
import '../widgets/character_info.dart';

class EpisodeInfoScreen extends StatelessWidget {
  const EpisodeInfoScreen({Key? key, required this.episode}) : super(key: key);

  final EpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(episode.name ?? ''),
      ),
      body: Column(
        children: [
          CharacterInfoWidget(characteristic: "Air_date", value: episode.airDate,),
          CharacterInfoWidget(characteristic: "Episode", value: episode.episode,),
        ],
      ),
    );
  }
}