part of 'search_bloc.dart';

class SearchState {
  final List<UserModel> users;
  final List<OriginModel> origins;
  final List<EpisodeModel> episodes;

  SearchState({this.users = const [], this.origins = const [], this.episodes = const []});
}
