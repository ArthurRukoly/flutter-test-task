import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GifService {
  final Dio _dio = Dio();
  final String _baseUrl = "http://api.giphy.com/v1/gifs/search";

  Future<List<dynamic>> searchGifs(String query, {int page = 0}) async {
  final apiKey = dotenv.env['GIPHY_API_KEY']; // Get API key
      try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          "api_key": apiKey,
          "q": query,
          "limit": 15,
          "offset": page * 2
        },
      );

      return response.data["data"];
    } catch (e) {
      // throw Exception("Failed to fetch GIFs");
      throw Exception(e);
    }
  }
}