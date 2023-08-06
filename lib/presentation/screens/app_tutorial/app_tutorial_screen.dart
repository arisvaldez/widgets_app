import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la Comida',
      'Amet nulla minim aliqua enim duis in minim id quis minim ut ut. Veniam qui amet exercitation Lorem. Voluptate sunt cillum magna id enim.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega Rapida',
      'Ipsum consectetur nulla nostrud id ipsum nostrud exercitation consequat enim voluptate excepteur magna.',
      'assets/images/2.png'),
  SlideInfo(
      'Busca la Comida',
      'Dolore aute dolore est occaecat elit ipsum aliqua reprehenderit qui consectetur officia excepteur.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _Slide(slide)).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () => context.pop(),
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slideInfo;
  const _Slide(this.slideInfo);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(slideInfo.imageUrl),
          ),
          const SizedBox(height: 20),
          Text(
            slideInfo.title,
            style: titleStyle,
          ),
          const SizedBox(height: 10),
          Text(
            slideInfo.caption,
            style: captionStyle,
          ),
        ],
      )),
    );
  }
}
