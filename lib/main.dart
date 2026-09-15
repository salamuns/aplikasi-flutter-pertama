import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan SnackBar'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 1. Buat SnackBar yang ingin ditampilkan
            const snackBar = SnackBar(
              content: Text('Halo! Ini pesan SnackBar.'),
              duration: Duration(seconds: 2), // Durasi muncul (opsional)
            );

            // 2. Tampilkan SnackBar menggunakan ScaffoldMessenger
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Tampilkan Pesan'),
        ),
      ),
    );
  }
}
