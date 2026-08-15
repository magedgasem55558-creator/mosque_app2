part of 'qibla_screen.dart';

mixin _QiblaScreenMixin1 on _QiblaScreenState {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  // ============================================================
  // التهيئة
  // ============================================================

  Future<void> _initialize() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _hasPermission = false;
      _statusMessage = 'جاري طلب صلاحية الموقع...';
    });

    try {
      // التحقق من خدمة الموقع
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        if (!mounted) return;

        setState(() {
          _isLoading = false;
          _statusMessage =
              'خدمة الموقع غير مفعلة.\nيرجى تشغيل GPS ثم المحاولة مرة أخرى.';
        });

        return;
      }

      // التحقق من الصلاحيات
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        if (!mounted) return;

        setState(() {
          _isLoading = false;
          _statusMessage =
              'لا يمكن تحديد القبلة بدون السماح بالوصول إلى الموقع.';
        });

        return;
      }

      if (permission == LocationPermission.deniedForever) {
        if (!mounted) return;

        setState(() {
          _isLoading = false;
          _statusMessage =
              'صلاحية الموقع مرفوضة نهائيًا.\n'
              'افتح إعدادات التطبيق واسمح بالوصول إلى الموقع.';
        });

        return;
      }

      // الحصول على الموقع
      if (!mounted) return;

      setState(() {
        _statusMessage = 'جاري الحصول على موقعك بدقة...';
      });

      Position? position;

      try {
        position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 0,
          ),
          timeLimit: const Duration(seconds: 15),
        );
      } catch (_) {
        // استخدام آخر موقع معروف إذا فشل GPS
        position = await Geolocator.getLastKnownPosition();
      }

      if (position == null) {
        if (!mounted) return;

        setState(() {
          _isLoading = false;
          _statusMessage =
              'تعذر الحصول على موقعك.\n'
              'تأكد من تشغيل GPS وأنك في مكان مفتوح.';
        });

        return;
      }

      // حساب اتجاه القبلة من موقع المستخدم
      final qiblaBearing = _calculateQiblaBearing(
        position.latitude,
        position.longitude,
      );

      if (!mounted) return;

      setState(() {
        _currentPosition = position;
        _qiblaBearing = qiblaBearing;
        _hasPermission = true;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
        _statusMessage =
            'حدث خطأ أثناء تحديد الموقع.\n'
            'يرجى المحاولة مرة أخرى.';
      });
    }
  }

  // ============================================================
  // حساب Bearing القبلة
  // ============================================================

  double _calculateQiblaBearing(
    double userLat,
    double userLng,
  ) {
    final lat1 = _degreesToRadians(userLat);
    final lat2 = _degreesToRadians(_kaabaLat);

    final deltaLng =
        _degreesToRadians(_kaabaLng - userLng);

    final y = math.sin(deltaLng) * math.cos(lat2);

    final x =
        math.cos(lat1) * math.sin(lat2) -
        math.sin(lat1) *
            math.cos(lat2) *
            math.cos(deltaLng);

    final bearing =
        math.atan2(y, x) * 180.0 / math.pi;

    return _normalizeAngle(bearing);
  }

  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180.0;
  }

  // ============================================================
  // تطبيع الزاوية إلى 0 - 360
  // ============================================================

  double _normalizeAngle(double angle) {
    final normalized = angle % 360.0;

    if (normalized < 0) {
      return normalized + 360.0;
    }

    return normalized;
  }

  // ============================================================
  // حساب أقصر فرق زاوي بين الهاتف والقبلة
  //
  // النتيجة من -180 إلى +180
  // ============================================================

  double _angleDifference(
    double target,
    double current,
  ) {
    double difference = target - current;

    while (difference > 180) {
      difference -= 360;
    }

    while (difference < -180) {
      difference += 360;
    }

    return difference;
  }

  // ============================================================
  // تنعيم اتجاه الهاتف
  //
  // مهم:
  // نقوم بتنعيم Heading الهاتف وليس Bearing القبلة.
  // ============================================================

  double _smoothHeading(double newHeading) {
    newHeading = _normalizeAngle(newHeading);

    if (_smoothedHeading == null) {
      _smoothedHeading = newHeading;
      return newHeading;
    }

    final difference = _angleDifference(
      newHeading,
      _smoothedHeading!,
    );

    _smoothedHeading = _normalizeAngle(
      _smoothedHeading! + (_filterAlpha * difference),
    );

    return _smoothedHeading!;
  }

  // ============================================================
  // الاهتزاز عند الوصول للقبلة
  // ============================================================


}
