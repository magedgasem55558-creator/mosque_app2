part of 'hisn_el_muslim_page.dart';

mixin _TasbihMixin1 on _DigitalTasbihPageState {
  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: .94,
      upperBound: 1,
      value: 1,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _increment() {
    HapticFeedback.lightImpact();

    setState(() {
      _count++;
      _total++;
    });

    _animationController.reverse().then((_) {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  void _reset() {
    HapticFeedback.mediumImpact();

    setState(() {
      _count = 0;
    });
  }

  void _resetAll() {
    setState(() {
      _count = 0;
      _total = 0;
    });
  }

  void _changePhrase(String phrase) {
    setState(() {
      _currentPhrase = phrase;
      _count = 0;
    });
  }


}
