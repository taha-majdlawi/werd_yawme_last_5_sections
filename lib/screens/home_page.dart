import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 226, 234),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "الورد اليومي",
          style: TextStyle(fontFamily: 'Amiri', fontSize: 25),
        ),
        backgroundColor: Color.fromARGB(255, 227, 226, 234),
      ),
    );
  }
}
