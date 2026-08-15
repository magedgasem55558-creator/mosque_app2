part of 'home_screen.dart';

class AutoPrayerCountdownGlass
    extends StatefulWidget {
  const AutoPrayerCountdownGlass({super.key});

  @override
  State<AutoPrayerCountdownGlass> createState() =>
      _AutoPrayerCountdownGlassState();
}

class _AutoPrayerCountdownGlassState
    extends State<AutoPrayerCountdownGlass> {
  String _nextPrayerName = "جاري الحساب...";

  Duration _timeLeft = Duration.zero;

  Timer? _timer;

  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _initPrayerLogic();
  }

  Future<void> _initPrayerLogic() async {
    try {
      LocationPermission permission =
          await Geolocator.requestPermission();

      if (permission ==
              LocationPermission.denied ||
          permission ==
              LocationPermission.deniedForever) {
        if (mounted) {
          setState(() {
            _loading = false;
            _nextPrayerName =
                "تعذر تحديد الموقع";
          });
        }

        return;
      }

      final position =
          await Geolocator.getCurrentPosition(
        desiredAccuracy:
            LocationAccuracy.high,
      );

      final coordinates = Coordinates(
        position.latitude,
        position.longitude,
      );

      final params =
          CalculationMethod.umm_al_qura
              .getParameters();

      params.madhab = Madhab.shafi;

      _updatePrayer(
        coordinates,
        params,
      );

      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) {
          _updatePrayer(
            coordinates,
            params,
          );
        },
      );
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _nextPrayerName =
              "تعذر تحديد الموقع";
        });
      }
    }
  }

  void _updatePrayer(
    Coordinates coordinates,
    CalculationParameters params,
  ) {
    final prayerTimes = PrayerTimes.today(
      coordinates,
      params,
    );

    final next = prayerTimes.nextPrayer();

    if (!mounted) return;

    if (next != Prayer.none) {
      final prayerTime =
          prayerTimes.timeForPrayer(next);

      if (prayerTime == null) {
        return;
      }

      final difference =
          prayerTime.difference(
        DateTime.now(),
      );

      setState(() {
        _nextPrayerName =
            _translatePrayer(next);

        _timeLeft = difference.isNegative
            ? Duration.zero
            : difference;

        _loading = false;
      });
    } else {
      final tomorrow =
          DateTime.now().add(
        const Duration(days: 1),
      );

      final tomorrowDate =
          DateComponents.from(tomorrow);

      final tomorrowTimes = PrayerTimes(
        coordinates,
        tomorrowDate,
        params,
      );

      final difference =
          tomorrowTimes.fajr.difference(
        DateTime.now(),
      );

      setState(() {
        _nextPrayerName = "الفجر";

        _timeLeft = difference.isNegative
            ? Duration.zero
            : difference;

        _loading = false;
      });
    }
  }

  String _translatePrayer(
    Prayer prayer,
  ) {
    switch (prayer) {
      case Prayer.fajr:
        return "الفجر";

      case Prayer.dhuhr:
        return "الظهر";

      case Prayer.asr:
        return "العصر";

      case Prayer.maghrib:
        return "المغرب";

      case Prayer.isha:
        return "العشاء";

      default:
        return "الصلاة";
    }
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Container(
        height: 145,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.97),
          borderRadius:
              BorderRadius.circular(24),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: HomeScreen.teal,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(
        18,
        17,
        18,
        18,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.98),
        borderRadius:
            BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: HomeScreen.teal
                .withOpacity(0.12),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: HomeScreen.teal
                      .withOpacity(0.10),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.access_time_rounded,
                  color: HomeScreen.teal,
                  size: 19,
                ),
              ),

              const SizedBox(width: 8),

              Text(
                'المتبقي لصلاة $_nextPrayerName',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              _timePart(
                _timeLeft.inHours
                    .toString()
                    .padLeft(2, '0'),
                "ساعة",
              ),

              _buildDivider(),

              _timePart(
                (_timeLeft.inMinutes % 60)
                    .toString()
                    .padLeft(2, '0'),
                "دقيقة",
              ),

              _buildDivider(),

              _timePart(
                (_timeLeft.inSeconds % 60)
                    .toString()
                    .padLeft(2, '0'),
                "ثانية",
              ),
            ],
          ),

          const SizedBox(height: 12),

          Container(
            height: 4,
            width: 90,
            decoration: BoxDecoration(
              gradient:
                  const LinearGradient(
                colors: [
                  HomeScreen.darkGreen,
                  HomeScreen.blue,
                ],
              ),
              borderRadius:
                  BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timePart(
    String value,
    String label,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 31,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 1),

        Text(
          label,
          style: const TextStyle(
            color: HomeScreen.teal,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ).copyWith(bottom: 15),
      child: const Text(
        ':',
        style: TextStyle(
          color: HomeScreen.teal,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
