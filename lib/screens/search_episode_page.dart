import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_api/screens/episode_info_screen.dart';
import 'package:flutterbloc_api/screens/user_info_screen.dart';
import '../search_bloc.dart';

class SearchEpisodePage extends StatelessWidget {
  const SearchEpisodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final episodes = context.select((SearchBloc bloc) => bloc.state.episodes);
    return Column(
      children: [
        const SizedBox(height: 10),
        const Text('Search', style: TextStyle(fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.all(14),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'enter episode name',
                prefixIcon: const Icon(Icons.search),
                hoverColor: Colors.blue[800],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            onChanged: (value) {
              context.read<SearchBloc>().add(SearchEpisodeEvent(value));
            },
          ),
        ),
        if (episodes.isNotEmpty)
          Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final episode = episodes[index];
                  return ListTile(
                    title: Text(episodes[index].name ?? ''),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EpisodeInfoScreen(
                                episode: episode,
                              )));
                    },
                  );
                },
                itemCount: episodes.length,
              ))
      ],
    );
  }
}