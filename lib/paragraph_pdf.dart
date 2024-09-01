import 'dart:io';

import 'package:datalist_convertpdf/save_and_openpdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class ParagraphPdfApi {
  static Future<File> generateParagraphPdf() async {
    final pdf = Document();
    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        customHeader(),
        Paragraph(text: LoremText().paragraph(300)),
        ...bulletPoints(),
        Paragraph(text: LoremText().paragraph(200)),
      ],
      header: (context) => buildPageNumber(context),
      footer: (context) => buildPageNumber(context),
    ));

    return SaveAndOpenDocument.savePdf(name: 'paragraph_pdf.pdf', pdf: pdf);
  }

  static Widget customHeader() {
    return Header(child: Text('Paraghraph Pdf Header'));
  }

  static List<Bullet> bulletPoints() => [
        Bullet(text: 'First Bullet '),
        Bullet(text: 'Second Bullet '),
        Bullet(text: 'Third Bullet ')
      ];

  static Widget buildPageNumber(Context context) => Container(
      alignment: Alignment.center,
      child: Text('Page ${context.pageNumber} of ${context.pagesCount}'));
}
