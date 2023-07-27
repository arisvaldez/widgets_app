import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(alignment: WrapAlignment.center, spacing: 10, children: [
          ElevatedButton(
              onPressed: () {}, child: const Text('Elevated Button')),
          const ElevatedButton(
              onPressed: null, child: Text('Elevated Disabled')),
          ElevatedButton.icon(
            label: const Text('Elevated Icon'),
            onPressed: () {},
            icon: const Icon(Icons.access_alarm_rounded),
          ),
          FilledButton(onPressed: () {}, child: const Text('Filled Button')),
          FilledButton.tonal(
              onPressed: () {}, child: const Text('Filled Tonal')),
          FilledButton.icon(
            label: const Text('Filled Icon'),
            onPressed: () {},
            icon: const Icon(Icons.abc_sharp),
          ),
          FilledButton.tonalIcon(
            label: const Text('Filled tonal Icon'),
            onPressed: () {},
            icon: const Icon(Icons.abc_sharp),
          ),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
            label: const Text('Outlined Icon'),
          ),
          TextButton(onPressed: () {}, child: const Text('Text Button')),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.beach_access),
            label: const Text('Text Button'),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.zoom_in)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.people_alt),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white)),
          )
        ]),
      ),
    );
  }
}
