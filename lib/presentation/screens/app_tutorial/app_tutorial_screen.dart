import 'package:animate_do/animate_do.dart';
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
      'Disfruta con los tuyos!',
      'Dolore aute dolore est occaecat elit ipsum aliqua reprehenderit qui consectetur officia excepteur.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageController;
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
    pageController.addListener(() {
      final page = pageController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });

    @override
    void dispose() {
      pageController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
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
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Start'),
                    ),
                  ))
              : const SizedBox()
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
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
