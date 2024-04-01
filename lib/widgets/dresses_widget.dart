import 'package:flutter/material.dart';
import 'package:gemstore_flutter/models/dresses.dart';

class DressCard extends StatefulWidget {
  final Dress dress;

  DressCard({super.key, required this.dress});

  @override
  _DressCardState createState() => _DressCardState();
}

class _DressCardState extends State<DressCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.dress.image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 2,
              right: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        widget.dress.liked ? Icons.favorite : Icons.favorite_border,
                        color: widget.dress.liked ? Colors.red : Colors.grey,
                        size: 15,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.dress.liked = !widget.dress.liked;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.dress.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                '\$${widget.dress.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: widget.dress.starRating > 0 ? Colors.green : Colors.grey,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.dress.starRating > 1 ? Colors.green : Colors.grey,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.dress.starRating > 2 ? Colors.green : Colors.grey,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.dress.starRating > 3 ? Colors.green : Colors.grey,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.dress.starRating > 4 ? Colors.green : Colors.grey,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '(${widget.dress.numOfRatings})',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
