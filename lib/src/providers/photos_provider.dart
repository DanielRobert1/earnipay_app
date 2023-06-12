import 'package:earnipay_app/src/models/photo.dart';
import 'package:earnipay_app/src/services/api_service.dart';
import 'package:flutter/material.dart';

class PhotoProvider extends ChangeNotifier {
  PhotoProvider({required this.apiService});
  final ApiService apiService;
  final List<Photo> _photos = [];
  int _currentPage = 1;
  final int _perPage = 20;

  List<Photo> get photos => _photos;

  Future<void> fetchPhotos() async {
    try {
      final List<Photo> fetchedPhotos = await apiService.fetchPhotos(_currentPage, _perPage);
      _photos.addAll(fetchedPhotos);
      _currentPage++;
      notifyListeners();
    } catch (e) {}
  }
}
