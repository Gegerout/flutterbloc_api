import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_api/screens/search_origin_page.dart';
import 'package:flutterbloc_api/search_bloc.dart';
import 'package:search_user_repository/search_user_repository.dart';

class RepositoryWidget extends StatelessWidget {
  const RepositoryWidget({Key? key, required this.page}) : super(key: key);

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SearchUserRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SearchBloc(
                  searchUserRepository:
                  RepositoryProvider.of<SearchUserRepository>(context)))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: const TextTheme(
                  bodyText2: TextStyle(fontSize: 33),
                  subtitle1: TextStyle(fontSize: 22))),
          home: Scaffold(
            body: SafeArea(
              child: page,
            ),
          ),
        ),
      ),
    );
  }
}
