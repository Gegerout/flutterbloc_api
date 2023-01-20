import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search_user_repository/search_user_repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'search_event.dart';
part 'search_state.dart';

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required SearchUserRepository searchUserRepository})
      : _searchUserRepository = searchUserRepository,
        super(SearchState()) {
    on<SearchUserEvent>(_onUserSearch,
        transformer: debounceDroppable(const Duration(microseconds: 500)));
    on<SearchOriginEvent>(_onOriginSearch,
        transformer: debounceDroppable(const Duration(microseconds: 500)));
    on<SearchEpisodeEvent>(_onEpisodeSearch,
        transformer: debounceDroppable(const Duration(microseconds: 500)));
  }

  late final SearchUserRepository _searchUserRepository;

  _onUserSearch(SearchUserEvent event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) return emit(SearchState(users: [], origins: [], episodes: []));
    if (event.query.length < 2) return;

    final users = await _searchUserRepository.onUserSearch(event.query);

    emit(SearchState(users: users));
  }

  _onOriginSearch(SearchOriginEvent event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) return emit(SearchState(users: [], origins: [], episodes: []));
    if (event.query.length < 2) return;

    final origins = await _searchUserRepository.onOriginSearch(event.query);

    emit(SearchState(origins: origins));
  }

  _onEpisodeSearch(SearchEpisodeEvent event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) return emit(SearchState(users: [], origins: [], episodes: []));
    if (event.query.length < 2) return;

    final episodes = await _searchUserRepository.onEpisodeSearch(event.query);

    emit(SearchState(episodes: episodes));
  }
}
