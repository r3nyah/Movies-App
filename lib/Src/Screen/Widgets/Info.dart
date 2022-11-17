import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Service/Model/Movie.dart';
import '../../Service/Util/Utils.dart';

class Infos extends StatelessWidget {
  final Movie movie;

  const Infos({
    super.key,
    required this.movie,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              movie.title,
              style: const TextStyle(
                color: Color(0xFFEDFF36),
                fontSize: 20,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('Assets/Image/Star.svg'),
                  const SizedBox(width: 5,),
                  Text(
                    movie.voteAverage == 0.0
                      ? 'N/A'
                      : movie.voteAverage.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Color(0xFFFF8700),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('Assets/Image/Ticket.svg'),
                  const SizedBox(width: 5,),
                  Text(
                    Utils.getGenres(movie),
                    style: const TextStyle(
                      color: Color(0xFFEE2AA9),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('Assets/Image/calender.svg'),
                  const SizedBox(width: 5,),
                  Text(
                    movie.releaseDate.split('-')[0],
                    style: const TextStyle(
                      color: Color(0xFFEE2AA9),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
