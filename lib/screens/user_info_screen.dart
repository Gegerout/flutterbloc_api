import 'package:flutter/material.dart';
import 'package:search_user_repository/search_user_repository.dart';
import '../widgets/character_info.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? ''),
      ),
      body: Column(
        children: [
          Hero(
              tag: user.name ?? '',
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(user.image ?? ''))),
              )),
          CharacterInfoWidget(characteristic: "Species", value: user.species,),
          CharacterInfoWidget(characteristic: "Gender", value: user.gender,),
          CharacterInfoWidget(characteristic: "Origin", value: user.origin,),
          CharacterInfoWidget(characteristic: "Status", value: user.status,)
        ],
      ),
    );
  }
}