import 'package:earnipay_app/src/models/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://api.unsplash.com';
  final String apiKey = 'UNSPLASH_ACCESS_KEY';

  Future<List<Photo>> fetchPhotos(int page, int perPage) async {
    final response = await http.get(
      Uri.parse('$baseUrl/photos?page=$page&per_page=$perPage&client_id=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Photo.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
