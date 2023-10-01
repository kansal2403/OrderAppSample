import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String name;

  const PrimaryButton({super.key, required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
          elevation: 4,
          textStyle:
              TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
      child: Text(name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
