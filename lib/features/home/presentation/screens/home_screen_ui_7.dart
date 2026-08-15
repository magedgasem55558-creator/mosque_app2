part of 'home_screen.dart';

extension _home_screenUi7 on HomeScreen {
  void _showDeveloperContactDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding:
              const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.black.withOpacity(0.15),
                  blurRadius: 25,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // الأيقونة
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    gradient:
                        const LinearGradient(
                      colors: [
                        HomeScreen.darkGreen,
                        HomeScreen.teal,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        BorderRadius.circular(19),
                  ),
                  child: const Icon(
                    Icons.support_agent_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'طلب نسخة لمسجدك',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 7),

                const Text(
                  'للتواصل مع المطور أو طلب نسخة خاصة لمسجدك',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 18),

                // ==================================================
                // رقم التواصل
                // ==================================================

                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    color:
                        const Color(0xFFF5F7FA),
                    borderRadius:
                        BorderRadius.circular(16),
                    border: Border.all(
                      color:
                          HomeScreen.darkGreen.withOpacity(0.12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color:
                              HomeScreen.darkGreen.withOpacity(
                            0.10,
                          ),
                          borderRadius:
                              BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: const Icon(
                          Icons.phone_rounded,
                          color: HomeScreen.darkGreen,
                          size: 21,
                        ),
                      ),

                      const SizedBox(width: 11),

                      const Expanded(
                        child: Text(
                          '776503890',
                          textDirection:
                              TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight:
                                FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      IconButton(
                        tooltip: 'نسخ الرقم',
                        onPressed: () async {
                          await Clipboard.setData(
                            const ClipboardData(
                              text: '776503890',
                            ),
                          );

                          if (dialogContext
                              .mounted) {
                            ScaffoldMessenger.of(
                              dialogContext,
                            ).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'تم نسخ رقم التواصل',
                                  textAlign:
                                      TextAlign.center,
                                ),
                                behavior:
                                    SnackBarBehavior
                                        .floating,
                                duration:
                                    Duration(
                                  seconds: 2,
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.copy_rounded,
                          color: HomeScreen.darkGreen,
                          size: 21,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // ==================================================
                // زر إغلاق
                // ==================================================

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        dialogContext,
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor: HomeScreen.darkGreen,
                      foregroundColor:
                          Colors.white,
                      elevation: 0,
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: const Text(
                      'إغلاق',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
