import 'package:earnipay_app/src/models/photo.dart';
import 'package:earnipay_app/src/services/api_service.dart';
import 'package:earnipay_app/src/services/mock_api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiService', () {
    late ApiService apiService;

    setUp(() {
      apiService = MockApiService();
    });

    test('fetchPhotos should return a list of Photo objects', () async {
      final List<Photo> photos = await apiService.fetchPhotos(1, 10);

      expect(photos.length, 10); // Adjust the expected length based on your API response
      expect(photos[0], isInstanceOf<Photo>());
    });

    test('fetchPhotos should throw an exception when API request fails', () async {
      apiService = MockApiService(hasException: true);
      expect(() => apiService.fetchPhotos(1, 10), throwsException);
    });
  });
}
