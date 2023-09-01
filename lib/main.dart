import 'package:flutter/material.dart';

import 'constant/strings.dart';
import 'pages/bottom_navigation_page.dart';

void main() {
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kLibraryTitle,
      home: BottomNavigationPage(),
    );
  }
}
