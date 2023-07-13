import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_mobril_test/data/photo_dto.dart';
import 'package:web_mobril_test/presentation/screens/bottom_bar_screens/photo_item.dart';
import 'package:web_mobril_test/presentation/screens/bottom_bar_screens/photos_state_holder.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';
import 'package:web_mobril_test/ui_state.dart';

class PhotoGridScreen extends StatefulWidget {
  const PhotoGridScreen({super.key});

  @override
  State<PhotoGridScreen> createState() => _PhotoGridScreenState();
}

class _PhotoGridScreenState extends State<PhotoGridScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<PhotosStateHolder>();
      state.loadPhotos();
      state.addListener(() {
        final loadPhotoState = state.loadPhotoState;
        if (loadPhotoState is Failure) {
          final failure = loadPhotoState as Failure;
          final snackBar = SnackBar(content: Text(failure.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PhotosStateHolder>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Photos",
          style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
      ),
      body: switch (state.loadPhotoState) {
        Success success => _buildGridView(success.data),
        Failure failure => _buildErrorMessage(failure.errorMessage),
        Loading _ => _buildLoadingAnimation()
      },
    );
  }

  Widget _buildGridView(List<PhotoDto> photos) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RefreshIndicator(
        onRefresh: () {
          final state = context.read<PhotosStateHolder>();
          return state.loadPhotos();
        },
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2),
          itemBuilder: (context, index) => PhotoItem(photoDto: photos[index]),
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String errorMessage) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(fontSize: 40),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLoadingAnimation() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
