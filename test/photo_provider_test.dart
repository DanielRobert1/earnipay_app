import 'package:earnipay_app/src/providers/photos_provider.dart';
import 'package:earnipay_app/src/services/api_service.dart';
import 'package:earnipay_app/src/services/mock_api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PhotoProvider', () {
    late PhotoProvider photoProvider;
    late ApiService mockApiService;

    setUp(() {
      mockApiService = MockApiService();
      photoProvider = PhotoProvider(apiService: mockApiService);
    });

    test('fetchPhotos should update the photos list', () async {
      await photoProvider.fetchPhotos();

      expect(photoProvider.photos.length, 10); // Adjust the expected length based on your mock response
    });
  });
}
