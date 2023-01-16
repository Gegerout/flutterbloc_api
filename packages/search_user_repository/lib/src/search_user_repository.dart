import 'package:dio/dio.dart';
import 'package:search_user_repository/search_user_repository.dart';
import 'package:search_user_repository/src/models/episode_model.dart';
import 'package:search_user_repository/src/models/origin_model.dart';

class SearchUserRepository {
  final apiUrl = 'https://rickandmortyapi.com/api/character';
  final _httpClient = Dio();

  Future<List<UserModel>> onUserSearch(String query) async {
    try {
      final user = await _httpClient.get(apiUrl, queryParameters: {
        'name': query,
      });

      final userOut = (user.data['results'] as List).map((json) => UserModel.fromJson(json)).toList();

      return userOut;
    } catch (e) {
      print('ERROR $e');
      return [];
    }
  }

  Future<List<OriginModel>> onOriginSearch(String query) async {
    try {
      final origin = await _httpClient.get(apiUrl, queryParameters: {
        'name': query,
      });

      final originOut = (origin.data['results'] as List).map((json) => OriginModel.fromJson(json)).toList();

      return originOut;
    } catch (e) {
      print('ERROR $e');
      return [];
    }
  }

  Future<List<EpisodeModel>> onEpisodeSearch(String query) async {
    try {
      final episode = await _httpClient.get(apiUrl, queryParameters: {
        'name': query,
      });

      final episodeOut = (episode.data['results'] as List).map((json) => EpisodeModel.fromJson(json)).toList();

      return episodeOut;
    } catch (e) {
      print('ERROR $e');
      return [];
    }
  }
}