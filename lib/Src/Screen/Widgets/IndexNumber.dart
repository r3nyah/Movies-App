import 'package:flutter/material.dart';

class IndexNumber extends StatelessWidget {
  final int number;

  const IndexNumber({
    super.key,
    required this.number,
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      (number).toString(),
      style: const TextStyle(
        fontSize: 120,
        fontWeight: FontWeight.w600,
        shadows: [
          Shadow(
            offset: Offset(-1.5, -1.5),
            color: Color(0xFFEE2AA9),
          ),
          Shadow(
            offset: Offset(1.5, -1.5),
            color: Color(0xFFEE2AA9),
          ),
          Shadow(
            offset: Offset(1.5, 1.5),
            color: Color(0xFFEE2AA9),
          ),
          Shadow(
            offset: Offset(-1.5, 1.5),
            color: Color(0xFFEE2AA9),
          ),
        ],
        color: Color(0xFF36333E),
      ),
    );
  }
}
