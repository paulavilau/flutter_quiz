import 'package:flutter/material.dart';

import 'docs_page.dart';

class DocsMain extends StatelessWidget {
  const DocsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Back'),
            backgroundColor: Colors.blue.shade200,
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.3,
                image: AssetImage('images/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blue.shade200),
                      shadowColor: WidgetStatePropertyAll(Colors.blue.shade900),
                      elevation: const WidgetStatePropertyAll(5),
                    ),
                    child: const Text(
                      "Flutter Basics",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto Slab"),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DocsPage(
                              fileName: 'flutter_basics',
                              title: "Flutter Basics",
                              image: "flutter.webp"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blue.shade200),
                      shadowColor: WidgetStatePropertyAll(Colors.blue.shade900),
                      elevation: const WidgetStatePropertyAll(5),
                    ),
                    child: const Text(
                      "Introduction to Dart",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto Slab"),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DocsPage(
                              fileName: 'dart_intro',
                              title: "Introduction to Dart",
                              image: "dart_logo.png"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blue.shade200),
                      shadowColor: WidgetStatePropertyAll(Colors.blue.shade900),
                      elevation: const WidgetStatePropertyAll(5),
                    ),
                    child: const Text(
                      "Widgets",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto Slab"),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DocsPage(
                              fileName: 'widgets',
                              title: "Flutter Widgets",
                              image: "widgets.png"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blue.shade200),
                      shadowColor: WidgetStatePropertyAll(Colors.blue.shade900),
                      elevation: const WidgetStatePropertyAll(5),
                    ),
                    child: const Text(
                      "Hot Reload",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto Slab"),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DocsPage(
                              fileName: 'hot_reload',
                              title: "Hot Reload",
                              image: "hot.png"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blue.shade200),
                      shadowColor: WidgetStatePropertyAll(Colors.blue.shade900),
                      elevation: const WidgetStatePropertyAll(5),
                    ),
                    child: const Text(
                      "Flutter Packages",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto Slab"),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DocsPage(
                              fileName: 'packages',
                              title: "Flutter Packages",
                              image: "pack.jpg"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blue.shade200),
                      shadowColor: WidgetStatePropertyAll(Colors.blue.shade900),
                      elevation: const WidgetStatePropertyAll(5),
                    ),
                    child: const Text(
                      "Navigation",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto Slab"),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DocsPage(
                              fileName: 'navigation',
                              title: "Flutter Navigation",
                              image: "nav.png"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
