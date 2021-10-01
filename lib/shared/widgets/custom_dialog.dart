import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String errorMessage;

  const CustomDialog({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  void _showDialog(BuildContext context, String errorMessage) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ocorreu um erro',
              style: Theme.of(context).textTheme.headline6),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Erro: ', style: Theme.of(context).textTheme.subtitle1),
                Text(
                  errorMessage,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showDialog(context, errorMessage));
    return const SizedBox();
  }
}
