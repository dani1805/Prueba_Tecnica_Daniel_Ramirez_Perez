import 'package:flutter/material.dart';

class StandardLanguageItem extends StatelessWidget {
  const StandardLanguageItem({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, width: MediaQuery.of(context).size.width * 0.05),
        SizedBox(width: 10),
        Text(title),
      ],
    );
  }
}
