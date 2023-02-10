import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  int activeIndex = 0;
  final urlimages = [
    'https://plus.unsplash.com/premium_photo-1666323097054-20bc48585d32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1571942520137-8a28622024fb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
    'https://images.unsplash.com/photo-1565227326837-708e5280f315?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2066&q=80',
    'https://images.unsplash.com/photo-1528538327220-59f9d5753302?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1948&q=80',
    'https://images.unsplash.com/photo-1648150311538-29bd39c69f64?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
    'https://images.unsplash.com/photo-1623030235422-07f96401f5ea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80',
  ];
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: ((index, reason) =>
                    setState(() => activeIndex = index))),
            itemCount: urlimages.length,
            itemBuilder: ((context, index, realIndex) {
              final urlimagens = urlimages[index];
              return buildImage(urlimagens, index);
            }),
          ),
          const SizedBox(height: 32),
          buildIndicator(),
        ]),
      ),
    );
  }

  Widget buildImage(String urlimagens, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.network(urlimagens),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
        activeIndex: activeIndex, count: urlimages.length);
  }
}
