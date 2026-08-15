import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
part 'qibla_screen__qiblascreenmixin1.dart';
part 'qibla_screen__qiblascreenmixin2.dart';
part 'qibla_screen__qiblascreenmixin3.dart';
part 'qibla_screen__qiblascreenmixin4.dart';
part 'qibla_screen__qiblascreenmixin5.dart';
part 'qibla_screen__qiblascreenmixin6.dart';
class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> with _QiblaScreenMixin1, _QiblaScreenMixin2, _QiblaScreenMixin3, _QiblaScreenMixin4, _QiblaScreenMixin5, _QiblaScreenMixin6{
  // إحداثيات الكعبة المشرفة
  static const double _kaabaLat = 21.422487;
  static const double _kaabaLng = 39.826206;

  bool _hasPermission = false;
  bool _isLoading = true;

  String _statusMessage = 'جاري تحديد موقعك...';

  Position? _currentPosition;

  /// Bearing القبلة الحقيقي من موقع المستخدم
  double? _qiblaBearing;

  /// اتجاه الهاتف بالنسبة للشمال
  double? _heading;

  /// اتجاه الهاتف بعد التنعيم
  double? _smoothedHeading;

  bool _hasVibrated = false;

  // Low Pass Filter
  static const double _filterAlpha = 0.15;

}

