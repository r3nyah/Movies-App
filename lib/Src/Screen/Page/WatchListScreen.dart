import 'package:flutter/material.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:get/get.dart';
import 'package:ukl_moviesapp/Src/Screen/Page/Main.dart';
import '../../Service/API/API.dart';
import '../../Service/Controller/BotNavController.dart';
import '../../Service/Controller/MoviesController.dart';
import '../Page/Details.dart';
import '../Widgets/Info.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(34),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      tooltip: 'Back to home',
                      onPressed: () =>
                          Get.find<BottomNavigatorController>().setIndex(0),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFFEE2AA9),
                      ),
                    ),
                    const Text(
                      'Watch List',
                      style: TextStyle(
                        color: Color(0xFFEDFF36),
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 33,
                      height: 33,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (Get.find<MovieController>().watchListMovies.isNotEmpty)
                  ...Get.find<MovieController>()
                      .watchListMovies
                      .map((movie) => Column(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(
                                  DetailsScreen(movie: movie),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        Api.imageBaseUrl + movie.posterPath,
                                        height: 180,
                                        width: 120,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                          const Icon(
                                          Icons.broken_image,
                                          size: 120,
                                        ),
                                        loadingBuilder: (_, __, ___) {
                                          if (___ == null) return __;
                                          return const FadeShimmer(
                                            width: 120,
                                            height: 180,
                                            highlightColor: Color(0xffEE2AA9),
                                            baseColor: Color(0xffEE2AA9),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Infos(movie: movie)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,)
                            ],
                          )),
                if(Get.find<MovieController>().watchListMovies.isEmpty)
                  Center(
                    child: Image.asset(
                      'Assets/Image/HelpWatchList.png',
                      width: 500,
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}
