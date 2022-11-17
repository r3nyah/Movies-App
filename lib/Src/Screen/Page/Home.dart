import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Service/API/API.dart';
import '../../Service/API/API_service.dart';
import '../../Service/Controller/BotNavController.dart';
import '../../Service/Controller/MoviesController.dart';
import '../../Service/Controller/SearchController.dart';
import '../Widgets/SearchBox.dart';
import '../Widgets/TabBuilder.dart';
import '../Widgets/TopRatedItem.dart';

class HomeScreen extends StatelessWidget {
  final MovieController controller = Get.put(MovieController());
  final SearchController searchController = Get.put(SearchController());

  HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48,
            ),
            SearchBox(
              onSumbit: () {
                String search = Get.find<SearchController>().searchController.text;
                Get.find<SearchController>().searchController.text = '';
                Get.find<SearchController>().search(search);
                Get.find<BottomNavigatorController>().setIndex(1);
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 34,),
            Obx(
              (()=>controller.isLoading.value
                      ? CircularProgressIndicator()
                      : SizedBox(
                        height: 300,
                        child: ListView.separated(
                          itemCount: controller.mainTopRatedMovies.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_,__)=> const SizedBox(width: 24 ,),
                          itemBuilder: (_,index)=>TopRatedItem(
                            movie: controller.mainTopRatedMovies[index],
                            index: index + 1,
                          ),
                        ),
                      )
              )
            ),
            DefaultTabController(
              length: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TabBar(
                      indicatorWeight: 4,
                      labelColor: Color(0xFFEDFF36),
                      indicatorColor: Color(0xFFEDFF36,),
                      tabs: [
                        Tab(text: 'Now playing'),
                        Tab(text: 'Upcoming'),
                        Tab(text: 'Top rated'),
                        Tab(text: 'Popular'),
                      ]),
                  SizedBox(
                    height: 400,
                    child: TabBarView(children: [
                      TabBuilder(
                        future: ApiService.getCustomMovies(
                            'now_playing?api_key=${Api.apiKey}&language=en-US&page=1'),
                      ),
                      TabBuilder(
                        future: ApiService.getCustomMovies(
                            'upcoming?api_key=${Api.apiKey}&language=en-US&page=1'),
                      ),
                      TabBuilder(
                        future: ApiService.getCustomMovies(
                            'top_rated?api_key=${Api.apiKey}&language=en-US&page=1'),
                      ),
                      TabBuilder(
                        future: ApiService.getCustomMovies(
                            'popular?api_key=${Api.apiKey}&language=en-US&page=1'),
                      ),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
