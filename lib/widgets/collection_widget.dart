import 'package:flutter/material.dart';
import 'indicator_widget.dart';

class CollectionPage extends StatelessWidget {
  final String collectionName;
  final String imagePath;
  final int pageIndex;
  final int currentPageIndex;

  const CollectionPage({
    super.key,
    required this.collectionName,
    required this.imagePath,
    required this.pageIndex,
    required this.currentPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    List<String> words = collectionName.split(' ');

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0, right: 8, left: 40),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (String word in words)
                        Text(
                          word,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: PageIndicator(
                    pageCount: 3,
                    currentIndex: currentPageIndex,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
