import 'package:flutter/material.dart';
import 'pages/first_main.dart';

void main() {
  runApp(const FileManager()); 
}

class FileManager extends StatelessWidget {
  const FileManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FileManager",
      home: FirstMainPage(),
    );
  }
}