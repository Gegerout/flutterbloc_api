import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_api/internet_cubit.dart';
import 'package:flutterbloc_api/screens/search_origin_page.dart';
import 'package:flutterbloc_api/search_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                  RepositoryProvider.of<SearchUserRepository>(context))),
          BlocProvider<InternetCubit>(
            create: (_) => InternetCubit(connectivity: Connectivity())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: const TextTheme(
                  bodyText2: TextStyle(fontSize: 33),
                  subtitle1: TextStyle(fontSize: 22))),
          home: Scaffold(
            body: BlocListener<InternetCubit, ConnectivityResult>(
              listener: (context, state) {
                if(state == ConnectivityResult.none) {
                  Fluttertoast.showToast(msg: "no internet connection");
                }
                if(state == ConnectivityResult.wifi) {
                  Fluttertoast.showToast(msg: "wifi connected");
                }
                if(state == ConnectivityResult.ethernet) {
                  Fluttertoast.showToast(msg: "ethernet connected");
                }
              },
              child: page,
            ),
          ),
          ),
        ),
      );
  }
}
