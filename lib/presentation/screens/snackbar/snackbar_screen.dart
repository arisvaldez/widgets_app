import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('HOla mUndo'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text(
            'Ea et ex et cillum culpa ipsum qui irure cupidatat exercitation magna occaecat in. Sit nulla sint cillum labore. Labore exercitation Lorem occaecat minim cupidatat et pariatur occaecat reprehenderit id incididunt excepteur dolor laboris.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBars and Dialogs')),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Mostar Snackbar'),
          icon: const Icon(Icons.remove_red_eye),
          onPressed: () => showCustomSnackbar(context)),
      body: Center(
          child: Column(
        children: [
          FilledButton.tonal(
            child: const Text('Licencias'),
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text(
                    'Et amet duis ad enim velit deserunt et nisi. Fugiat proident deserunt pariatur amet amet fugiat sunt id deserunt quis sunt. Pariatur Lorem id aliqua magna adipisicing duis aute culpa aliquip sunt enim et cupidatat laborum. Elit consectetur mollit deserunt Lorem dolore. Officia sit laboris id exercitation incididunt in minim mollit quis sit proident quis ullamco. Ea qui qui consequat amet cillum non ut occaecat. Officia incididunt sit sint consequat velit.')
              ]);
            },
          ),
          FilledButton.tonal(
            child: const Text('Mostrar Dialog'),
            onPressed: () => openDialog(context),
          ),
        ],
      )),
    );
  }
}
