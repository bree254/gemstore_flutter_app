import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentIndex;

  const PageIndicator({super.key, required this.pageCount, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            color: index == currentIndex ? Colors.white : Colors.grey.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}
