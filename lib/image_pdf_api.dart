import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'save_and_openpdf.dart';

class ImagePdfApi {
  static Future<File> generateImagePdf() async {
    final pdf = Document();

    final image1 =
        (await rootBundle.load('assets/img_1.jpeg')).buffer.asUint8List();
    final image2 =
        (await rootBundle.load('assets/img_2.jpeg')).buffer.asUint8List();

    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) {
        if (context.pageNumber == 2) {
          return FullPage(
              ignoreMargins: true,
              child: Image(
                  MemoryImage(
                    image1,
                  ),
                  fit: BoxFit.cover));
        } else {
          return Container();
        }
      },
    );

    pdf.addPage(MultiPage(
        build: (context) => [
              Image(MemoryImage(image1)),
              Center(
                  child: Image(MemoryImage(image2),
                      width: pageTheme.pageFormat.availableWidth / 2,
                      height: 500)),
              ClipRRect(
                  verticalRadius: 32,
                  horizontalRadius: 32,
                  child: Image(MemoryImage(image1)))
            ],
        header: (context) => Header(
            child: Container(
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Şirket Adı'),
                      Image(
                          MemoryImage(
                            image1,
                          ),
                          width: 50,
                          height: 50),
                      Text('${context.pagesCount}'),
                    ])))));

    return SaveAndOpenDocument.savePdf(name: 'image_pdf.pdf', pdf: pdf);
  }
}
