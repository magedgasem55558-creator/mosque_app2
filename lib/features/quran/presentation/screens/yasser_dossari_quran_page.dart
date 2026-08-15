import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'yasser_dossari_quran_page__yasserquranmixin1.dart';
part 'yasser_dossari_quran_page__yasserquranmixin2.dart';
part 'yasser_dossari_quran_page__yasserquranmixin3.dart';
part 'yasser_dossari_quran_page__yasserquranmixin4.dart';
part 'yasser_dossari_quran_page__yasserquranmixin5.dart';
part 'yasser_dossari_quran_page__yasserquranmixin6.dart';
part 'yasser_dossari_quran_page__yasserquranmixin7.dart';
part 'yasser_dossari_quran_page__yasserquranmixin8.dart';
part 'yasser_dossari_quran_page__yasserquranmixin9.dart';
part 'yasser_dossari_quran_page__yasserquranmixin10.dart';
part 'yasser_dossari_quran_page__yasserquranmixin11.dart';
part 'yasser_dossari_quran_page__yasserquranmixin12.dart';
part 'yasser_dossari_quran_page__yasserquranmixin13.dart';
part 'yasser_dossari_quran_page__yasserquranmixin14.dart';
part 'yasser_dossari_quran_page__yasserquranmixin15.dart';
part 'yasser_dossari_quran_page__yasserquranmixin16.dart';
part 'yasser_dossari_quran_page__yasserquranmixin17.dart';
part 'yasser_dossari_quran_page__yasserquranmixin18.dart';
part 'models_reciter.dart';
part 'models_surah.dart';
part 'models_downloaded_quran.dart';
part 'quran_data.dart';
part 'quran_theme.dart';
// ============================================================================
// النماذج
// ============================================================================







// ============================================================================
// بيانات القرآن
// ============================================================================



// ============================================================================
// الألوان
// ============================================================================



// ============================================================================
// الصفحة
// ============================================================================

class YasserDossariQuranPage extends StatefulWidget {
  const YasserDossariQuranPage({super.key});

  @override
  State<YasserDossariQuranPage> createState() =>
      _YasserDossariQuranPageState();
}

class _YasserDossariQuranPageState
    extends State<YasserDossariQuranPage> with _YasserQuranMixin1, _YasserQuranMixin2, _YasserQuranMixin3, _YasserQuranMixin4, _YasserQuranMixin5, _YasserQuranMixin6, _YasserQuranMixin7, _YasserQuranMixin8, _YasserQuranMixin9, _YasserQuranMixin10, _YasserQuranMixin11, _YasserQuranMixin12, _YasserQuranMixin13, _YasserQuranMixin14, _YasserQuranMixin15, _YasserQuranMixin16, _YasserQuranMixin17, _YasserQuranMixin18{
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Dio _dio = Dio();

  // ==========================================================================
  // القراء
  // ==========================================================================

  final List<Reciter> _fallbackReciters = const [
    Reciter(
      id: 'yasser',
      name: 'ياسر الدوسري',
      serverUrl: 'https://server11.mp3quran.net/yasser/',
    ),
    Reciter(
      id: 'basit',
      name: 'عبد الباسط عبد الصمد',
      serverUrl: 'https://server7.mp3quran.net/basit/',
    ),
    Reciter(
      id: 'afs',
      name: 'مشاري العفاسي',
      serverUrl: 'https://server8.mp3quran.net/afs/',
    ),
    Reciter(
      id: 'maher',
      name: 'ماهر المعيقلي',
      serverUrl: 'https://server12.mp3quran.net/maher/',
    ),
    Reciter(
      id: 'shur',
      name: 'سعود الشريم',
      serverUrl: 'https://server7.mp3quran.net/shur/',
    ),
    Reciter(
      id: 'sds',
      name: 'عبد الرحمن السديس',
      serverUrl: 'https://server11.mp3quran.net/sds/',
    ),
    Reciter(
      id: 'shatri',
      name: 'أبو بكر الشاطري',
      serverUrl: 'https://server11.mp3quran.net/shatri/',
    ),
    Reciter(
      id: 'hudhaify',
      name: 'علي الحذيفي',
      serverUrl: 'https://server9.mp3quran.net/hudhaify/',
    ),
    Reciter(
      id: 'minsh',
      name: 'محمد صديق المنشاوي',
      serverUrl: 'https://server10.mp3quran.net/minsh/',
    ),
    Reciter(
      id: 'hussary',
      name: 'محمود خليل الحصري',
      serverUrl: 'https://server13.mp3quran.net/husr/',
    ),
  ];

  List<Reciter> _reciters = [];

  late Reciter _selectedReciter;

  bool _loadingReciters = true;

  // ==========================================================================
  // الصوت
  // ==========================================================================

  bool _isPlaying = false;

  int? _currentSurahIndex;

  String? _currentReciterId;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  // ==========================================================================
  // التنزيلات
  // ==========================================================================

  final Map<String, bool> _downloadedSurahs = {};
  final Map<String, double> _downloadProgress = {};

  final List<DownloadedQuran> _downloadedQuran = [];

  // ==========================================================================
  // المفضلة والبحث
  // ==========================================================================

  final Set<int> _favorites = {};

  String _searchQuery = '';

  // 0 = السور
  // 1 = التنزيلات
  // 2 = الصفحات
  // 3 = القراء
  int _selectedTab = 0;

  // ==========================================================================
  // الصفحات
  // ==========================================================================

  int _currentPage = 1;

  List<dynamic> _pageAyahs = [];

  bool _loadingPage = false;

  // ==========================================================================
  // INIT
  // ==========================================================================

}

