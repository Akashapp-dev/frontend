import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Home"), centerTitle: true),
      body: const Center(
        child: Text("Welcome to Chat App!", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
