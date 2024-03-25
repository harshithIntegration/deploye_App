import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class Documentpage extends StatefulWidget {
  const Documentpage({Key? key}) : super(key: key);

  @override
  State<Documentpage> createState() => _DocumentpageState();
}

class _DocumentpageState extends State<Documentpage> {
  List<String> pdfPaths = [];

  Future<void> _addPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          pdfPaths.add(result.files.first.path!);
        });
      }
    } catch (e) {
      print("Error picking PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Documents',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: _addPDF,
                child: Text(
                  'Add PDF',
                  style: TextStyle(
                    color: Colors.red.shade900,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pdfPaths.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(pdfPaths[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFScreen(filePath: pdfPaths[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  final String filePath;

  const PDFScreen({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
