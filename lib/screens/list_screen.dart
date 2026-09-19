import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> _items = [];
  String _searchQuery = '';
  bool _isLoading = true;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  // 1. Memuat Data dari SharedPreferences
  Future<void> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _items = prefs.getStringList('oetan_items') ??
          ['Kayu Jati', 'Kayu Mahoni', 'Kayu Pinus'];
      _isLoading = false;
    });
  }

  // 2. Menyimpan Data ke SharedPreferences
  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('oetan_items', _items);
  }

  // 3. Fungsi Tambah Item Baru
  void _addItem(String name) {
    if (name.trim().isNotEmpty) {
      setState(() {
        _items.add(name);
      });
      _saveItems();
      _textController.clear();
      Navigator.of(context).pop();
    }
  }

  // 4. Fungsi Edit / Ubah Nama Item
  void _editItem(int index, String newName) {
    if (newName.trim().isNotEmpty) {
      setState(() {
        _items[index] = newName;
      });
      _saveItems();
      _textController.clear();
      Navigator.of(context).pop();
    }
  }

  // 5. Fungsi Hapus Item
  void _removeItem(String itemValue) {
    setState(() {
      _items.remove(itemValue);
    });
    _saveItems();
  }

  // Modal Dialog Tambah Item
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

  // Modal Dialog Edit Item
  void _showEditDialog(int originalIndex) {
    _textController.text = _items[originalIndex];
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
            onPressed: () => _editItem(originalIndex, _textController.text),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Filter daftar berdasarkan kata kunci pencarian
    final filteredItems = _items.where((item) {
      return item.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          // Widget Kolom Pencarian (Search Bar)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari item...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Daftar Item (ListView)
          Expanded(
            child: filteredItems.isEmpty
                ? const Center(
                    child: Text(
                      'Item tidak ditemukan.',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final originalIndex = _items.indexOf(item);

                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(item),
                          // Navigasi ke Halaman Detail saat item diklik
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  itemName: item,
                                  itemIndex: originalIndex,
                                ),
                              ),
                            );
                          },
                          // Tombol Aksi Edit & Hapus
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _showEditDialog(originalIndex),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _removeItem(item),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
