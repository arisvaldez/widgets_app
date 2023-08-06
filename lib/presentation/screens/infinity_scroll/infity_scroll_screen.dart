import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfityScrollScreen extends StatefulWidget {
  static const String name = 'infinity_scroll_screen';

  const InfityScrollScreen({super.key});

  @override
  State<InfityScrollScreen> createState() => _InfityScrollScreenState();
}

class _InfityScrollScreenState extends State<InfityScrollScreen> {
  late final ScrollController scrollController;
  bool isLoading = false;
  bool isMounted = true;

  List<int> imagesIds = [1, 2, 3, 4, 5];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future loadNextPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;

    setState(() {});

    await Future.delayed(Duration(seconds: 2));

    addFiveImages();

    isLoading = false;
    
    if (!isMounted) {
      return;
    }
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(title: const Text('Infite Scroll')),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300'),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
