import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      CarouselSlider(
          items: [
            Container(
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/free-vector/people-carrying-donation-charity-related-icons_53876-43091.jpg?w=2000'),
                      fit: BoxFit.fill)),
            ),
            Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVRkGDxnBEtn6sXa_91FjhiZff9eFS5hx7-g&usqp=CAU'),
                      fit: BoxFit.fill)),
            ),
            Container(
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTDnVvDH2nryYvqtfWjoRsEXmbcoMCwK1Chw&usqp=CAU'),
                        fit: BoxFit.fill))),
            Container(
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.gannett-cdn.com/-mm-/3b8b0abcb585d9841e5193c3d072eed1e5ce62bc/c=0-30-580-356/local/-/media/2017/10/05/USATODAY/usatsports/glass-jar-full-of-cois-with-donate-written-on-it-charity-donation-philanthropy_large.jpg?width=1200&disable=upscale&format=pjpg&auto=webp'),
                        fit: BoxFit.fill)))
          ],
          options: CarouselOptions(
              height: 180,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8)),
    ]);
  }
}
