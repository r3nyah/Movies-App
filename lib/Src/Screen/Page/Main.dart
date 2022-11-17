import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Service/Controller/BotNavController.dart';

class Main extends StatelessWidget {
  final BottomNavigatorController controller = Get.put(BottomNavigatorController());

  Main({super.key,});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.index.value,
              children: Get.find<BottomNavigatorController>().screens,
            ),
          ),
          bottomNavigationBar: Container(
            height: 78,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFEE2AA9),
                  width: 1
                )
              )
            ),
            child: BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: (index)=>Get.find<BottomNavigatorController>().setIndex(index),
              backgroundColor: const Color(0xFF36333E),
              selectedItemColor: const Color(0xFFEDFF36),
              unselectedItemColor: const Color(0xFFEE2AA9),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: SvgPicture.asset(
                      'Assets/Image/Home.svg',
                      height: 21,
                      width: 21,
                      color: controller.index.value == 0
                          ? const Color(0xFFEDFF36)
                          : const Color(0xFFEE2AA9),
                    ),
                  ),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: SvgPicture.asset(
                      'Assets/Image/Search.svg',
                      height: 21,
                      width: 21,
                      color: controller.index.value == 1
                          ? const Color(0xFFEDFF36)
                          : const Color(0xFFEE2AA9),
                    ),
                  ),
                  label: 'Search',
                  tooltip: 'Search Movies'
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: SvgPicture.asset(
                      'Assets/Image/Save.svg',
                      height: 21,
                      width: 21,
                      color: controller.index.value == 2
                          ? const Color(0xFFEDFF36)
                          : const Color(0xFFEE2AA9),
                    ),
                  ),
                  label: 'Watch List',
                  tooltip: 'Your WatchList'
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
