import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{

  final String text;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(17),
        margin: const EdgeInsets.symmetric(horizontal: 23.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}