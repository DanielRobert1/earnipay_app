import 'package:cached_network_image/cached_network_image.dart';
import 'package:earnipay_app/src/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoDetailsScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailsScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: CachedNetworkImage(
              imageUrl: photo.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title: ${photo.title}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text('Description: ${photo.description}'),
                const SizedBox(height: 10),
                Text('Author: ${photo.author}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
