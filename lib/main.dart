import 'dart:ui';

import 'package:datalist_convertpdf/basic_pdf_api.dart';
import 'package:datalist_convertpdf/image_pdf_api.dart';
import 'package:datalist_convertpdf/paragraph_pdf.dart';
import 'package:datalist_convertpdf/save_and_openpdf.dart';
import 'package:datalist_convertpdf/table_pdf_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final basicPdfFile = await BasicPdfApi.generateBasicTextPdf(
                      'Basic Text', 'Flutter Developer');

                  SaveAndOpenDocument.openPdf(basicPdfFile);
                },
                child: const Text('Basic PDF')),
            ElevatedButton(
                onPressed: () async {
                  final paragraphPdf =
                      await ParagraphPdfApi.generateParagraphPdf();
                  SaveAndOpenDocument.openPdf(paragraphPdf);
                },
                child: const Text('Paragrafh PDF')),
            ElevatedButton(
                onPressed: () async {
                  final tablePdf = await TablePdfApi.generateTablePdf();
                  SaveAndOpenDocument.openPdf(tablePdf);
                },
                child: const Text('Text to Table PDF')),
            ElevatedButton(
                onPressed: () async {
                  final imagePdf = await ImagePdfApi.generateImagePdf();
                  SaveAndOpenDocument.openPdf(imagePdf);
                },
                child: const Text('Image to PDF'))
          ],
        ),
      ),
    );
  }
}
