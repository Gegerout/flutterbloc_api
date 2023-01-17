import 'package:flutter/material.dart';
import 'package:search_user_repository/search_user_repository.dart';
import '../widgets/character_info.dart';

class OriginInfoScreen extends StatelessWidget {
  const OriginInfoScreen({Key? key, required this.origin}) : super(key: key);

  final OriginModel origin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(origin.name ?? ''),
      ),
      body: Column(
        children: [
          CharacterInfoWidget(characteristic: "Type", value: origin.type,),
          CharacterInfoWidget(characteristic: "Dimension", value: origin.dimension,),
        ],
      ),
    );
  }
}