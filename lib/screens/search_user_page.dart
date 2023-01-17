import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_api/screens/user_info_screen.dart';
import '../search_bloc.dart';

class SearchUserPage extends StatelessWidget {
  const SearchUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = context.select((SearchBloc bloc) => bloc.state.users);
    return Column(
      children: [
        const SizedBox(height: 10),
        const Text('Search'),
        Padding(
          padding: const EdgeInsets.all(14),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'enter username',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            onChanged: (value) {
              context.read<SearchBloc>().add(SearchUserEvent(value));
            },
          ),
        ),
        if (users.isNotEmpty)
          Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(users[index].name ?? ''),
                    leading: Hero(
                      tag: user.name ?? '',
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.image ?? ''),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => UserInfoScreen(
                                user: user,
                              )));
                    },
                  );
                },
                itemCount: users.length,
              ))
      ],
    );
  }
}