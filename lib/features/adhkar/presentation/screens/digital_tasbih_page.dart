part of 'hisn_el_muslim_page.dart';

class DigitalTasbihPage extends StatefulWidget {
  const DigitalTasbihPage({super.key});

  @override
  State<DigitalTasbihPage> createState() =>
      _DigitalTasbihPageState();
}

class _DigitalTasbihPageState
    extends State<DigitalTasbihPage>
    with SingleTickerProviderStateMixin, _TasbihMixin1, _TasbihMixin2, _TasbihMixin3{
  int _count = 0;
  int _total = 0;

  final List<String> _phrases = [
    'سُبْحَانَ اللَّهِ',
    'الحَمْدُ لِلَّهِ',
    'اللَّهُ أَكْبَرُ',
    'لاَ إِلَهَ إِلاَّ اللَّهُ',
    'أَسْتَغْفِرُ اللَّهَ',
    'لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ',
    'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ',
  ];

  String _currentPhrase = 'سُبْحَانَ اللَّهِ';

  late AnimationController _animationController;

}


