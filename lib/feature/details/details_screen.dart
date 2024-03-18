import 'package:cis_task/item.dart';
import 'package:flutter/material.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.item});

  final Item item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              item.name,
              style: const TextStyle(fontSize: 24),
            ),
            Image.asset(
              item.image,
            ),
            Text(
              item.rating,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
