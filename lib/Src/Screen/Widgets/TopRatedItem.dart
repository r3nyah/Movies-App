import 'package:flutter/material.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:get/get.dart';
import '../../Service/API/API.dart';
import '../../Service/Model/Movie.dart';
import '../Page/Details.dart';
import '../Widgets/IndexNumber.dart';

class TopRatedItem extends StatelessWidget {
  final Movie movie;
  final int index;

  const TopRatedItem({
    super.key,
    required this.index,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.to(DetailsScreen(movie: movie)),
          child: Container(
            margin: const EdgeInsets.only(left: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(Api.imageBaseUrl + movie.posterPath,
                  fit: BoxFit.cover,
                  height: 250,
                  width: 180,
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
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: IndexNumber(number: index),
        )
      ],
    );
  }
}
