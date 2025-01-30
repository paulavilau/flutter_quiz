import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class DocsPage extends StatefulWidget {
  final String fileName;
  final String title;
  final String image;

  const DocsPage(
      {super.key,
      required this.fileName,
      required this.title,
      required this.image});

  @override
  _DocsPageState createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
  late Future<String> fileContent;
  String imageFile = "";

  @override
  void initState() {
    super.initState();
    // Load the text file when the page is loaded
    fileContent = loadAsset(widget.fileName);
    imageFile = widget.image;
  }

  Future<String> loadAsset(String fileName) async {
    try {
      // Load the text file from assets using rootBundle
      return await rootBundle.loadString('docs/$fileName.txt');
    } catch (e) {
      return 'Error loading file: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(widget.title),
      ),
      body: FutureBuilder<String>(
        future: fileContent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                constraints: const BoxConstraints(),
                child: Column(
                  children: [
                    kIsWeb
                        ? Image.asset("images/$imageFile",
                            height: MediaQuery.of(context).size.height * 0.4)
                        : Image.asset("images/$imageFile"),
                    Text(
                      snapshot.data!,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 19,
                          fontFamily: "Roboto Slab",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
