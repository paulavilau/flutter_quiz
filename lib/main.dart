import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import "docs/docs_main.dart";
import 'firebase_options.dart';
import "quiz/quiz_page.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      theme: ThemeData(),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/back.jpg'),
                fit: BoxFit
                    .cover, // Ensures the image covers the entire background
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Learn Flutter",
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: "Pacifico",
                          shadows: [
                            Shadow(
                                color: Colors.blue.shade700,
                                offset: Offset.zero,
                                blurRadius: 30)
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 250),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blue.shade200),
                      shadowColor: WidgetStatePropertyAll(Colors.blue.shade900),
                      elevation: const WidgetStatePropertyAll(5),
                    ),
                    child: const Text(
                      "Flutter Docs",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto Slab"),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DocsMain()),
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
                      "Flutter Quiz",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto Slab"),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            backgroundColor: Colors.lightBlueAccent,
            child: ListView(
              children: [
                ListTile(
                  title: Text('Login'),
                ),
                ListTile(
                  title: Text('Settings'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
