import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Service/Controller/SearchController.dart';

class SearchBox extends StatelessWidget {
  final VoidCallback onSumbit;
  const SearchBox({
    Key? key,
    required this.onSumbit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Get.find<SearchController>().searchController,
      style: const TextStyle(color: Color(0xFF36333E)),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(3.14),
            child: SvgPicture.asset(
              'Assets/Image/Search.svg',
              width: 22,
              height: 22,
            ),
          ),
          onPressed: () => onSumbit(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          color: Color(
            0xFF36333E,
          ),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        contentPadding: const EdgeInsets.only(
          left: 16,
          right: 0,
          top: 0,
          bottom: 0,
        ),
        filled: true,
        fillColor: const Color(0xFFEDFF36),
        hintText: 'Search',
      ),
      onSubmitted: (a) => onSumbit(),
    );
  }
}