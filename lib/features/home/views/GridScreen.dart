import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/features/home/view_models/GalleryViewModel.dart';
import 'package:test_app/features/home/components/GalleryGridItem.dart';

class GridScreen extends ConsumerWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryVM = ref.watch(galleryViewModelProvider);
    final columnCount = galleryVM.columnCount;
    final imagesAsync = galleryVM.images;

    final vmAccessor = ref.read(galleryViewModelProvider.notifier);
    final onErrorCallback = vmAccessor.recoverImage;

    return imagesAsync.when(
      data: (images) {
        return GridView.builder(
          itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnCount.value,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 1,
          ),
          itemBuilder: (BuildContext context, int index) => GalleryGridItem(
            image: images[index],
            onImageError: onErrorCallback,
          ),
        );
      },
      error: (error, data) {
        return Center(child: Text("there is error"));
      },
      loading: () {
        return CircularProgressIndicator();
      },
    );
  }
}
