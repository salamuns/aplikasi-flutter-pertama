import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<String> _items = ['Kayu Jati', 'Kayu Mahoni', 'Kayu Pinus'];
  final TextEditingController _textController = TextEditingController();

  // 1. Fungsi Tambah Item
  void _addItem(String name) {
    if (name.trim().isNotEmpty) {
      setState(() {
        _items.add(name);
      });
      _textController.clear();
      Navigator.of(context).pop();
    }
  }

  // 2. Fungsi Edit / Ubah Nama Item
  void _editItem(int index, String newName) {
    if (newName.trim().isNotEmpty) {
      setState(() {
        _items[index] = newName;
      });
      _textController.clear();
      Navigator.of(context).pop();
    }
  }

  // 3. Fungsi Hapus Item
  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  // Dialog untuk Tambah Item Baru
  void _showAddDialog() {
    _textController.clear();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Item Baru'),
        content: TextField(
          controller: _textController,
          decoration: const InputDecoration(hintText: 'Masukkan nama item...'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => _addItem(_textController.text),
            child: const Text('Tambah'),
          ),
        ],
      ),
    );
  }

  // Dialog untuk Edit / Ubah Item
  void _showEditDialog(int index) {
    // Isi TextField dengan nama item yang ada sekarang
    _textController.text = _items[index];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ubah Nama Item'),
        content: TextField(
          controller: _textController,
          decoration: const InputDecoration(hintText: 'Masukkan nama baru...'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => _editItem(index, _textController.text),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'Belum ada data item.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(_items[index]),
                    // Baris aksi di sebelah kanan (Edit & Hapus)
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showEditDialog(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeItem(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
