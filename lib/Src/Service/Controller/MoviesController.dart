import 'package:get/get.dart';
import 'package:ukl_moviesapp/Src/Screen/Page/WatchListScreen.dart';
import '../../Service/API/API_service.dart';
import '../../Service/Model/Movie.dart';

class MovieController extends GetxController {
  var isLoading = false.obs;
  var mainTopRatedMovies = <Movie>[].obs;
  var watchListMovies = <Movie>[].obs;

  @override
  void onInit() async {
    isLoading.value = true;
    mainTopRatedMovies.value = (await ApiService.getTopRatedMovies())!;
    isLoading.value = false;
    super.onInit();
  }

  bool isInWatchList(Movie movie) {
    return watchListMovies.any((element) => element.id == movie.id);
  }

  void addToWatchList(Movie movie) {
    if (watchListMovies.any((element) => element.id == movie.id)) {
      watchListMovies.remove(movie);
      Get.snackbar(
        'Success',
        'Removed from watch list',
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(milliseconds: 500),
      );
    } else {
      watchListMovies.add(movie);
      Get.snackbar('Success', 'added to watch list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500));
    }
  }
}
