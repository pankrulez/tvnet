import 'package:flutter/material.dart';
import 'package:tvnet/screens/upload_documents.dart';
import 'package:tvnet/widgets/adaptive_scaffold.dart';
//import '../resources/constants.dart';

class UploadedDocuments extends StatelessWidget {
  static String id = 'uploaded_docs_page';
  const UploadedDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AdaptiveAppBar(
          elevation: 5.0,
          title: const Text('DOCUMENTS'),
          centerTitle: true,
          backgroundColor: Colors.blue.withAlpha((0.7 * 255).round()),
        ),
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Uploaded Documents',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  Container(
                    color: Colors.deepOrangeAccent,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.amberAccent,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            const Row(
              children: [],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, UploadNewDocuments.id);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
