import 'package:flutter/material.dart';

class SpecsList extends StatelessWidget {
  final title;
  final value;

  const SpecsList({
    super.key,
    this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title : ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleSmall?.color,
              ),
            ),
            TextSpan(
              text: '$value',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleSmall?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class sliderDots extends StatelessWidget {
  final bool isActive;
  const sliderDots({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 20 : 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).brightness == Brightness.dark
                ? Color.fromARGB(255, 255, 255, 255)
                : Color.fromARGB(255, 43, 43, 43)
            : Theme.of(context).brightness == Brightness.dark
                ? Color.fromARGB(224, 75, 75, 75)
                : Color.fromARGB(255, 223, 223, 223),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
