import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(),
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        //  actions: [
        //    IconButton(
        //      onPressed: () {},
        //      icon: const Icon(Icons.more_vert),
        //    ),
        // ],
      ),
      body: const Center(
        child: Text(
          "Settings Screen",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
