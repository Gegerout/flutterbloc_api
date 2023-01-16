part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchUserEvent extends SearchEvent {
  final String query;

  SearchUserEvent(this.query);
}

class SearchOriginEvent extends SearchEvent {
  final String query;

  SearchOriginEvent(this.query);
}

class SearchEpisodeEvent extends SearchEvent {
  final String query;

  SearchEpisodeEvent(this.query);
}
