import 'package:flutter/material.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Service/API/API.dart';
import '../../Service/Controller/BotNavController.dart';
import '../../Service/Controller/SearchController.dart';
import '../../Service/Model/Movie.dart';
import '../../Service/Util/Utils.dart';
import '../Page/Details.dart';
import '../Widgets/Info.dart';
import '../Widgets/SearchBox.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
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
                  'Search',
                  style: TextStyle(
                    color: Color(0xFFEDFF36),
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
                const Tooltip(
                  message: 'Search your wanted movie here!',
                  triggerMode: TooltipTriggerMode.tap,
                  child: Icon(
                    Icons.info_outline,
                    color: Color(0xFFEE2AA9),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SearchBox(
              onSumbit: () {
                String search =
                    Get.find<SearchController>().searchController.text;
                Get.find<SearchController>().searchController.text = '';
                Get.find<SearchController>().search(search);
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(
              height: 34,
            ),
            Obx((() => Get.find<SearchController>().isLoading.value
                ? const CircularProgressIndicator()
                : Get.find<SearchController>().foundedMovies.isEmpty
                    ? SizedBox(
                        width: Get.width / 1.5,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            SvgPicture.asset(
                              'Assets/Image/no.svg',
                              height: 120,
                              width: 120,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'We are sorry, We Can`t found your movie',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFEDFF36),
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                wordSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        itemCount:
                            Get.find<SearchController>().foundedMovies.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 24,
                        ),
                        itemBuilder: (_, index) {
                          Movie movie =
                              Get.find<SearchController>().foundedMovies[index];
                          return GestureDetector(
                            onTap: () => Get.to(DetailsScreen(movie: movie)),
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
                                    errorBuilder: (_, __, ___) {
                                      return const Icon(
                                        Icons.broken_image,
                                        //color: Color(0xffEE2AA9),
                                        size: 120,
                                      );
                                    },
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
                                Infos(movie: movie,)
                              ],
                            ),
                          );
                        },
                      )))
          ],
        ),
      ),
    );
  }
}
