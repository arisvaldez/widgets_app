import 'package:animate_do/animate_do.dart';
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

  void moveScrollTopBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
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
    moveScrollTopBottom();
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!isMounted) return;

    final lastId = imagesIds.last;
    isLoading = true;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(title: const Text('Infite Scroll')),
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: Stack(
            fit: StackFit.expand,
            children: [
              RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView.builder(
                  controller: scrollController,
                  physics:const  BouncingScrollPhysics(),
                  itemCount: imagesIds.length,
                  itemBuilder: (context, index) {
                    return FadeInImage(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300,
                      placeholder:
                          const AssetImage('assets/images/jar-loading.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/id/${imagesIds[index]}/500/300'),
                    );
                  },
                ),
              ),
              if (isLoading)
                FadeIn(
                  delay: const Duration(milliseconds: 500),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors.primary,
                      ),
                      child: CircularProgressIndicator(
                        color: colors.onPrimary,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ));
  }
}
