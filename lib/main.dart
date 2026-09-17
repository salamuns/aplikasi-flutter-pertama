import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Dinamo is',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const DynamicListScreen(),
    );
  }
}

class DynamicListScreen extends StatefulWidget {
  const DynamicListScreen({super.key});

  @override
  State<DynamicListScreen> createState() => _DynamicListScreenState();
}

class _DynamicListScreenState extends State<DynamicListScreen> {
  // 1. List penampung data
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  
  // Controller untuk mengambil teks dari TextField
  final TextEditingController _textController = TextEditingController();

  // 2. Fungsi untuk menambah item
  void _addItem(String title) {
    if (title.trim().isEmpty) return;
    setState(() {
      _items.add(title);
    });
    _textController.clear(); // Bersihkan input teks setelah ditambah
  }

  // 3. Fungsi untuk menghapus item berdasarkan indeks
  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  // Dialog konfirmasi/input tambah item
  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Item Baru'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Masukkan nama item...',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                _addItem(_textController.text);
                Navigator.pop(context);
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item Dinamis'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Jika list kosong, tampilkan pesan kosong. Jika ada, tampilkan ListView.
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'Belum ada item. Klik tombol + untuk menambah.',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(_items[index]),
                    trailing: IconButton(
                      icon: const Icon(Colors.delete, color: Colors.red),
                      onPressed: () => _removeItem(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        tooltip: 'Tambah Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
