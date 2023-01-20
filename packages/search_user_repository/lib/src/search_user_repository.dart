import 'package:dio/dio.dart';
import 'package:search_user_repository/search_user_repository.dart';
import 'package:search_user_repository/src/models/episode_model.dart';
import 'package:search_user_repository/src/models/origin_model.dart';

class SearchUserRepository {
  final _httpClient = Dio();

  Future<List<UserModel>> onUserSearch(String query) async {
    final apiUrl = 'https://rickandmortyapi.com/api/character';
    try {
      final user = await _httpClient.get(apiUrl, queryParameters: {
        'name': query,
      });

      return (user.data['results'] as List).map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      print('ERROR $e');
      return [];
    }
  }

  Future<List<OriginModel>> onOriginSearch(String query) async {
    final apiUrl = 'https://rickandmortyapi.com/api/location';
    try {
      final origin = await _httpClient.get(apiUrl, queryParameters: {
        'name': query,
      });

      return (origin.data['results'] as List).map((json) => OriginModel.fromJson(json)).toList();
    } catch (e) {
      print('ERROR $e');
      return [];
    }
  }

  Future<List<EpisodeModel>> onEpisodeSearch(String query) async {
    final apiUrl = 'https://rickandmortyapi.com/api/episode';
    try {
      final episode = await _httpClient.get(apiUrl, queryParameters: {
        'name': query,
      });

      return (episode.data['results'] as List).map((json) => EpisodeModel.fromJson(json)).toList();
    } catch (e) {
      print('ERROR $e');
      return [];
    }
  }
}