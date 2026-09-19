import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String itemName;
  final int itemIndex;

  const DetailScreen({
    super.key,
    required this.itemName,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $itemName'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Text(
                  '${itemIndex + 1}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Nama Item:',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            Text(
              itemName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 32),
            Text(
              'Deskripsi:',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              'Ini adalah halaman detail untuk $itemName.',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
