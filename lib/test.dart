import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';

class PdfUploader extends StatefulWidget {
  @override
  _PdfUploaderState createState() => _PdfUploaderState();
}

class _PdfUploaderState extends State<PdfUploader> {
  File? selectedPdf;
  UploadTask? task;

  Future pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedPdf = File(result.files.single.path!);
      });
    }
  }

  Future uploadPDF() async {
    if (selectedPdf == null) return;

    String fileName = path.basename(selectedPdf!.path);
    Reference reference =
        FirebaseStorage.instance.ref().child('pdfs').child(fileName);
    task = reference.putFile(selectedPdf!);

    setState(() {});

    task!.snapshotEvents.listen((TaskSnapshot snapshot) {
      print('Task state: ${snapshot.state}');
      print(
          'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
    });

    try {
      await task!.whenComplete(() => print('Upload complete'));
    } catch (e) {
      print('Error uploading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PDF Uploader',
          style: TextStyle(
            fontFamily: 'Bossiple',
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: pickPDF,
              child: Text('Pick a PDF file'),
            ),
            SizedBox(height: 20),
            if (selectedPdf != null)
              Text('Selected PDF: ====> ${path.basename(selectedPdf!.path)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: uploadPDF,
              child: Text('Upload PDF'),
            ),
            if (task != null) ...[
              SizedBox(height: 20),
              StreamBuilder<TaskSnapshot>(
                stream: task!.snapshotEvents,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final bytesTransferred =
                        snapshot.data!.bytesTransferred.toDouble();
                    final totalBytes = snapshot.data!.totalBytes.toDouble();
                    final progress = (bytesTransferred / totalBytes) * 100;
                    return Text(
                        'Upload Progress: ${progress.toStringAsFixed(2)} %');
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
