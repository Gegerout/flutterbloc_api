import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_api/screens/origin_info_screen.dart';
import 'package:flutterbloc_api/screens/user_info_screen.dart';
import '../search_bloc.dart';

class SearchOriginPage extends StatelessWidget {
  const SearchOriginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final origins = context.select((SearchBloc bloc) => bloc.state.origins);
    return Column(
      children: [
        const SizedBox(height: 10),
        const Text('Search'),
        Padding(
          padding: const EdgeInsets.all(14),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'enter origin name',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            onChanged: (value) {
              context.read<SearchBloc>().add(SearchOriginEvent(value));
            },
          ),
        ),
        if (origins.isNotEmpty)
          Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final origin = origins[index];
                  return ListTile(
                    title: Text(origins[index].name ?? ''),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => OriginInfoScreen(
                                origin: origin,
                              )));
                    },
                  );
                },
                itemCount: origins.length,
              ))
      ],
    );
  }
}