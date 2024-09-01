import 'dart:io';

import 'package:datalist_convertpdf/save_and_openpdf.dart';
import 'package:pdf/widgets.dart';

class BasicPdfApi {
  static Future<File> generateBasicTextPdf(String text, String text2) async {
    final pdf = Document();

    pdf.addPage(Page(
        build: (_) => Center(
                child: Column(children: [
              Text(text),
              Text(text2),
            ]))));

   //write a document name
    return SaveAndOpenDocument.savePdf(name: 'basic_pdf.pdf', pdf: pdf);
  }
}
