part of 'donate_screen.dart';

extension _donate_screenUi1 on DonateScreen {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              darkGreen,
              blue,
              lightBackground,
            ],
            stops: [
              0.0,
              0.43,
              1.0,
            ],
          ),
        ),
        child: SafeArea(
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('settings')
                .doc('donation_info')
                .get(),
            builder: (context, snapshot) {
              String bankName = 'بنك الكريمي';
              String accountNumber =
                  'يمني 3155105932 - سعودي 3173113918';
              String transferName =
                  'عبر الكريمي - حامد المزجاجي';
              String phone = '779626069';

              String hadith =
                  'قال رسول الله ﷺ:\n'
                  '«مَنْ بَنَى مَسْجِدًا بَنَى اللَّهُ لَهُ '
                  'مِثْلَهُ فِي الْجَنَّةِ»';

              if (snapshot.hasData && snapshot.data!.exists) {
                final rawData = snapshot.data!.data();

                if (rawData is Map<String, dynamic>) {
                  bankName = rawData['bankName'] ?? bankName;
                  accountNumber =
                      rawData['accountNumber'] ?? accountNumber;
                  transferName =
                      rawData['transferName'] ?? transferName;
                  phone = rawData['phone'] ?? phone;
                  hadith = rawData['hadith'] ?? hadith;
                }
              }

              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          18,
                          14,
                          18,
                          30,
                        ),
                        child: Column(
                          children: [
                            // ==================================================
                            // العنوان
                            // ==================================================

                            _buildHeader(),

                            const SizedBox(height: 20),

                            // ==================================================
                            // البطاقة الرئيسية
                            // ==================================================

                            _buildDonationHero(),

                            const SizedBox(height: 18),

                            // ==================================================
                            // الحديث
                            // ==================================================

                            _buildHadithCard(hadith),

                            const SizedBox(height: 22),

                            // ==================================================
                            // عنوان طرق التبرع
                            // ==================================================

                            _buildSectionTitle(
                              icon: Icons.account_balance_wallet_rounded,
                              title: 'طرق التبرع',
                              subtitle:
                                  'اختر طريقة التحويل المناسبة لك',
                            ),

                            const SizedBox(height: 12),

                            // ==================================================
                            // البنك
                            // ==================================================

                            _buildDonationMethod(
                              context,
                              title: bankName,
                              subtitle: 'الحساب البنكي',
                              detail: accountNumber,
                              icon: Icons.account_balance_rounded,
                              color: darkGreen,
                            ),

                            const SizedBox(height: 12),

                            // ==================================================
                            // الحوالات
                            // ==================================================

                            _buildDonationMethod(
                              context,
                              title: 'الموحدة للحوالات',
                              subtitle: 'بيانات التحويل',
                              detail: transferName,
                              icon: Icons.swap_horiz_rounded,
                              color: blue,
                            ),

                            const SizedBox(height: 22),

                            // ==================================================
                            // تنبيه
                            // ==================================================

                            _buildImportantNotice(),

                            const SizedBox(height: 18),

                            // ==================================================
                            // التواصل
                            // ==================================================

                            _buildContactCard(
                              context,
                              phone,
                            ),

                            const SizedBox(height: 18),

                            // ==================================================
                            // دعاء
                            // ==================================================

                            _buildBottomMessage(),

                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // ============================================================
  // Header
  // ============================================================


}
