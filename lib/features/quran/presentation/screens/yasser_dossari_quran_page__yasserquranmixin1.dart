part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin1 on _YasserDossariQuranPageState {
  @override
  void initState() {
    super.initState();

    _reciters = List.from(_fallbackReciters);
    _selectedReciter = _reciters.first;

    _listenToAudio();
    _initialize();
  }

  Future<void> _initialize() async {
    await _loadPreferences();

    await _loadDownloadedQuran();

    await _checkDownloadedFiles();

    await _loadRecitersFromApi();

    await _loadSavedPage();

    if (mounted) {
      setState(() {});
    }

    // تظهر الرسالة بعد تجهيز الصفحة.
    await _showFirstTimeTip();
  }

  // ==========================================================================
  // رسالة أول مرة
  // ==========================================================================

  Future<void> _showFirstTimeTip() async {
    final prefs = await SharedPreferences.getInstance();

    final hasSeenTip =
        prefs.getBool('quran_first_tip_shown') ?? false;

    if (hasSeenTip || !mounted) return;

    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    if (!mounted) return;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          titlePadding: const EdgeInsets.fromLTRB(
            24,
            24,
            24,
            8,
          ),
          contentPadding: const EdgeInsets.fromLTRB(
            24,
            8,
            24,
            10,
          ),
          actionsPadding: const EdgeInsets.fromLTRB(
            16,
            0,
            16,
            16,
          ),
          title: Column(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(.10),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.download_for_offline_rounded,
                  color: Colors.teal,
                  size: 34,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'استمع للقرآن بدون إنترنت',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'ميزة رائعة للاستماع في أي وقت',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal.shade700,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Text(
                'يمكنك تنزيل أي سورة بصوت القارئ '
                'المفضل لديك، ثم الاستماع إليها لاحقًا '
                'في أي وقت حتى بدون اتصال بالإنترنت.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade700,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 18),
              _buildTipItem(
                icon: Icons.download_rounded,
                title: 'حمّل السورة',
                subtitle:
                    'اختر السورة والقارئ ثم اضغط على زر التحميل.',
              ),
              const SizedBox(height: 10),
              _buildTipItem(
                icon: Icons.wifi_off_rounded,
                title: 'استمع بدون إنترنت',
                subtitle:
                    'بعد اكتمال التحميل يمكنك الاستماع إليها في أي وقت.',
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(.06),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.teal.withOpacity(.12),
                  ),
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.teal.shade600,
                      size: 19,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'يمكنك العثور على جميع السور '
                        'التي تم تنزيلها من قسم التنزيلات، '
                        'مع معرفة اسم القارئ لكل سورة.',
                        style: TextStyle(
                          color: Colors.teal.shade800,
                          fontSize: 12.5,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  await prefs.setBool(
                    'quran_first_tip_shown',
                    true,
                  );

                  if (ctx.mounted) {
                    Navigator.pop(ctx);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'فهمت، ابدأ الآن',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }


}
