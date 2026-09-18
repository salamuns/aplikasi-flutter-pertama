import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 16),
          Text(
            'Pengguna Oetan Kayoe',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text('user@oetankayoe.com', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
 
