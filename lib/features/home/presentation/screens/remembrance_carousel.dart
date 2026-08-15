part of 'home_screen.dart';

class RemembranceCarousel extends StatefulWidget {
  const RemembranceCarousel({super.key});

  @override
  State<RemembranceCarousel> createState() =>
      _RemembranceCarouselState();
}

class _RemembranceCarouselState
    extends State<RemembranceCarousel> {
  int _currentIndex = 0;

  Timer? _timer;

  final List<String> _remembrances = [
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
    "لاَ إِلَهَ إِلاَّ أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ",
    "سُبْحَانَ اللَّهِ، وَالْحَمْدُ لِلَّهِ، وَلاَ إِلَهَ إِلاَّ اللَّهُ، وَاللَّهُ أَكْبَرُ",
    "أَسْتَغْفِرُ اللَّهَ الَّذِي لاَ إِلَهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ وَأَتُوبُ إِلَيْهِ",
    "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ",
    "لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ",
    "رَبِّ اغْفِرْ لِي وَتُبْ عَلَيَّ إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ عَدَدَ خَلْقِهِ وَرِضَا نَفْسِهِ وَزِنَةَ عَرْشِهِ وَمِدَادَ كَلِمَاتِهِ",
    "اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلاً مُتَقَبَّلاً",
    "اللَّهُمَّ أَجِرْنِي مِنَ النَّارِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ (مائة مرة)",
    "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
    "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ شَرِّ مَا عَمِلْتُ، وَمِنْ شَرِّ مَا لَمْ أَعْمَلْ",
    "رَضِيتُ بِاللَّهِ رَبًّا، وَبِالْإِسْلَامِ دِينًا، وَبِمُحَمَّدٍ نَبِيًّا وَرَسُولاً",
    "يَا حَيُّ يَا قَيُّومُ، بِرَحْمَتِكَ أَسْتَغِيثُ",
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        if (!mounted) return;

        setState(() {
          _currentIndex =
              (_currentIndex + 1) %
                  _remembrances.length;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.97),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _quoteIcon(),

          const SizedBox(width: 10),

          Expanded(
            child: AnimatedSwitcher(
              duration:
                  const Duration(milliseconds: 700),
              transitionBuilder:
                  (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Text(
                _remembrances[_currentIndex],
                key: ValueKey(_currentIndex),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  height: 1.55,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          _quoteIcon(),
        ],
      ),
    );
  }

  Widget _quoteIcon() {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color:
            HomeScreen.darkGreen.withOpacity(0.09),
        borderRadius: BorderRadius.circular(11),
      ),
      child: const Icon(
        Icons.format_quote_rounded,
        color: HomeScreen.darkGreen,
        size: 19,
      ),
    );
  }
}

// ================================================================
// PRAYER COUNTDOWN
// ================================================================
