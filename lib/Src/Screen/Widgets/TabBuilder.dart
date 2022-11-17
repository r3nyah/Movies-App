import 'package:flutter/material.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:get/get.dart';
import '../../Service/Model/Movie.dart';
import '../Page/Details.dart';

class TabBuilder extends StatelessWidget {
  final Future<List<Movie>?> future;

  const TabBuilder({
    super.key,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        left: 12,
      ),
      child: FutureBuilder<List<Movie>?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.6,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Get.to(DetailsScreen(movie: snapshot.data![index])),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}',
                  height: 300,
                  width: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.broken_image,
                    size: 180,
                  ),
                  loadingBuilder: (_, __, ___) {
                    if (___ == null) return __;
                    return const FadeShimmer(
                      width: 180,
                      height: 250,
                      highlightColor: Color(0xffEE2AA9),
                      baseColor: Color(0xffEE2AA9),
                    );
                  },
                ),
              ),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
