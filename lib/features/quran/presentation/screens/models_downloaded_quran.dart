part of 'yasser_dossari_quran_page.dart';

class DownloadedQuran {
  final String reciterId;
  final String reciterName;
  final int surahNumber;
  final String surahName;
  final String filePath;

  const DownloadedQuran({
    required this.reciterId,
    required this.reciterName,
    required this.surahNumber,
    required this.surahName,
    required this.filePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'reciterId': reciterId,
      'reciterName': reciterName,
      'surahNumber': surahNumber,
      'surahName': surahName,
      'filePath': filePath,
    };
  }

  factory DownloadedQuran.fromJson(
    Map<String, dynamic> json,
  ) {
    return DownloadedQuran(
      reciterId: json['reciterId']?.toString() ?? '',
      reciterName: json['reciterName']?.toString() ?? '',
      surahNumber: json['surahNumber'] is int
          ? json['surahNumber']
          : int.tryParse(
                json['surahNumber']?.toString() ?? '',
              ) ??
              0,
      surahName: json['surahName']?.toString() ?? '',
      filePath: json['filePath']?.toString() ?? '',
    );
  }
}
