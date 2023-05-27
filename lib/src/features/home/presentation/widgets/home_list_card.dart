// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeListCard extends StatelessWidget {
  const HomeListCard({
    Key? key,
    required this.title,
    required this.homeCards,
    this.heigthCarousel = 120,
    this.route,
  }) : super(key: key);

  final String title;
  final Widget? route;
  final List<Widget> homeCards;
  final double heigthCarousel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                // return MaterialPageRoute(builder: (context) => route!)
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
        SizedBox(
          height: heigthCarousel,
          child: ListView.builder(
            itemCount: homeCards.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: homeCards[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
