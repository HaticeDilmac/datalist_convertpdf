import 'dart:io';

import 'package:datalist_convertpdf/save_and_openpdf.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

class User {
  final String name;
  final String surname;
  final int age;
  User({
    required this.name,
    required this.surname,
    required this.age,
  });
}

class TablePdfApi {
  static Future<File> generateTablePdf() async {
    // final pdf = Document();

    // final headers = ['Name', 'Surname', 'Age'];
    // final users = [
    //   User(name: 'Ahmet', surname: 'Can', age: 22),
    //   User(name: 'Ahmet', surname: 'Can', age: 22),
    //   User(name: 'Fatma', surname: 'Yıldız', age: 34),
    //   User(name: 'Ahmet', surname: 'Can', age: 24),
    //   User(name: 'Yasemin', surname: 'Tek', age: 45),
    // ];

    // final data =
    //     users.map((user) => [user.name, user.surname, user.age]).toList();

    // pdf.addPage(Page(
    //     build: (context) =>
    //         TableHelper.fromTextArray(data: data, headers: headers)));
    // return SaveAndOpenDocument.savePdf(name: 'table_pdf.pdf', pdf: pdf);
    final headers = ['Name', 'Surname', 'Age'];
    final users = [
      User(name: 'Ahmet', surname: 'Can', age: 22),
      User(name: 'Ahmet', surname: 'Can', age: 22),
      User(name: 'Fatma', surname: 'Yıldız', age: 34),
      User(name: 'Ahmet', surname: 'Can', age: 24),
      User(name: 'Yasemin', surname: 'Tek', age: 45),
    ];

    final data =
        users.map((user) => [user.name, user.surname, user.age]).toList();

    // Yazı tipini yükleme
    final fontData = await rootBundle.load("assets/fonts/Roboto-Regular.ttf");
    final font = pw.Font.ttf(fontData);

    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (context) => pw.Table.fromTextArray(
        headers: headers,
        data: data,
        border: TableBorder.all(width: 1),
        cellStyle: pw.TextStyle(font: font),
        headerStyle: pw.TextStyle(font: font, fontWeight: pw.FontWeight.bold),
      ),
    ));

    return SaveAndOpenDocument.savePdf(name: 'table_pdf.pdf', pdf: pdf);
  }
}
