import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class SaveAndOpenDocument {
  // Bu sınıf, PDF dosyalarını kaydetmek ve açmak için iki yöntem içerir.

  static Future<File> savePdf({
    required String name,
    // PDF belgesi için dosya adı
    required Document pdf,
    // 'Document', pdf kütüphanesinden gelen bir PDF dosyasını temsil eder
  }) async {
    // Bu metot, PDF dosyasını belirli bir dizine kaydetmek için kullanılır.
    final root = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    // Platform kontrolü yaparak, Android cihazlarda harici depolama dizinini,
    // diğer platformlarda ise uygulamanın belge dizinini alır.

    final file = File('${root!.path}/$name');
    // Yukarıda alınan dizin yoluna ve dosya adına göre yeni bir dosya oluşturulur.

    await file.writeAsBytes(await pdf.save());
    // PDF dosyası byte olarak kaydedilir.

    debugPrint('${root.path}/$name');
    // Dosyanın tam yolu debug konsoluna yazdırılır (sorun giderme için).

    return file;
    // Kaydedilen dosya nesnesi geri döndürülür.
  }

  static Future<void> openPdf(File file) async {
    // Bu metot, verilen dosyayı varsayılan uygulama ile açmak için kullanılır.

    final path = file.path;
    // Dosya yolunu alır.

    await OpenFile.open(path);
    // Dosyayı varsayılan uygulama ile açar (örneğin, PDF okuyucu).
  }
}
