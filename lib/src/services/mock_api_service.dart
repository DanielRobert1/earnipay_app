import 'package:earnipay_app/src/models/photo.dart';
import 'package:earnipay_app/src/services/api_service.dart';

class MockApiService extends ApiService {
  MockApiService({this.hasException = false});
  final bool hasException;
  @override
  Future<List<Photo>> fetchPhotos(int page, int perPage) async {
    if (hasException) {
      throw Exception();
    }
    return List<Photo>.generate(
        10,
        (index) => Photo(
              id: '$index',
              title: 'Photo $index',
              imageUrl: 'https://example.com/image_$index.jpg',
              description: 'Description $index',
              author: 'Author $index',
            ));
  }
}
