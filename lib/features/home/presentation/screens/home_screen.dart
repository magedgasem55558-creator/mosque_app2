import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

import 'package:mosque_app/services/firebase_service.dart';
import 'package:mosque_app/models/mosque_models.dart';
import 'package:mosque_app/screens/login_screen.dart';
import 'package:mosque_app/screens/my_children_screen.dart';
import 'package:mosque_app/screens/leaderboard_screen.dart';
import 'package:mosque_app/screens/donate_screen.dart';
import 'package:mosque_app/screens/qibla_screen.dart';
import 'package:mosque_app/screens/yasser_dossari_quran_page.dart';
import 'package:mosque_app/screens/hisn_el_muslim_page.dart';
part 'home_screen_ui_1.dart';
part 'home_screen_ui_2.dart';
part 'home_screen_ui_3.dart';
part 'home_screen_ui_4.dart';
part 'home_screen_ui_5.dart';
part 'home_screen_ui_6.dart';
part 'home_screen_ui_7.dart';
part 'remembrance_carousel.dart';
part 'auto_prayer_countdown_glass.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color blue = Color(0xFF42A5F5);
  static const Color lightBg = Color(0xFFF5F7FA);
  static const Color teal = Color(0xFF00897B);

}


// ================================================================
// Format lecture time
// ================================================================

String _formatLectureTime(String? isoTime) {
  if (isoTime == null) {
    return '';
  }

  final dt = DateTime.tryParse(isoTime);

  if (dt == null) {
    return isoTime;
  }

  return '${dt.year}/'
      '${dt.month.toString().padLeft(2, '0')}/'
      '${dt.day.toString().padLeft(2, '0')}  '
      '${dt.hour.toString().padLeft(2, '0')}:'
      '${dt.minute.toString().padLeft(2, '0')}';
}

// ================================================================
// REMEMBRANCE CAROUSEL
// ================================================================

