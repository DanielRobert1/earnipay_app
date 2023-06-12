import 'package:cached_network_image/cached_network_image.dart';
import 'package:earnipay_app/src/models/photo.dart';
import 'package:earnipay_app/src/providers/photos_provider.dart';
import 'package:earnipay_app/src/screens/photo_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void loadMorePhotos() {
    final photoProvider = Provider.of<PhotoProvider>(context, listen: false);
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll >= maxScroll) {
      photoProvider.fetchPhotos();
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final photoProvider = Provider.of<PhotoProvider>(context, listen: false);
      photoProvider.fetchPhotos();
    });
    _scrollController.addListener(loadMorePhotos);
  }

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);
    final List<Photo> photos = photoProvider.photos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unsplash Photos'),
      ),
      body: GridView.builder(
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: photos.length,
        itemBuilder: (ctx, index) {
          final photo = photos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetailsScreen(photo: photo),
                ),
              );
            },
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(photo.title),
              ),
              child: CachedNetworkImage(
                imageUrl: photo.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                cacheManager: DefaultCacheManager(),
              ),
            ),
          );
        },
      ),
    );
  }
}
