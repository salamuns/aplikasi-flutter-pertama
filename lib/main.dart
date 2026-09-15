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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplikasi Pertamaku'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Elemen 1: Icon
              const Icon(
                Icons.flutter_dash,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              
              // Elemen 2: Teks
              const Text(
                'Halo! Selamat Datang.',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Elemen 3: Baris Tombol (Row)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Tombol 1'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Tombol 2'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
