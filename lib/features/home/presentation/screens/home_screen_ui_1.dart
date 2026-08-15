part of 'home_screen.dart';

extension _home_screenUi1 on HomeScreen {
  @override
  Widget build(BuildContext context) {
    final service = FirebaseService();

    return Scaffold(
      backgroundColor: HomeScreen.lightBg,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HomeScreen.darkGreen,
              HomeScreen.blue,
              HomeScreen.lightBg,
            ],
            stops: [0.0, 0.38, 0.72],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(
              18,
              12,
              18,
              30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),

                const SizedBox(height: 18),

                const AutoPrayerCountdownGlass(),

                const SizedBox(height: 14),

                const RemembranceCarousel(),

                const SizedBox(height: 18),

                _buildInfoRow(service),

                const SizedBox(height: 12),

                _buildUpcomingLecture(),

                const SizedBox(height: 28),

                _buildSectionTitle(
                  'خدمات المسجد',
                  'كل ما تحتاجه في مكان واحد',
                  Icons.apps_rounded,
                ),

                const SizedBox(height: 14),

                _buildServicesGrid(context),

                const SizedBox(height: 25),

                _buildLogoutButton(context),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // Header
  // ============================================================

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        18,
        16,
        18,
        16,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.97),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  HomeScreen.darkGreen,
                  HomeScreen.teal,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: HomeScreen.darkGreen.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.mosque_rounded,
              color: Colors.white,
              size: 29,
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحباً بك 👋',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'في مسجدنا',
                  style: TextStyle(
                    color: HomeScreen.darkGreen,
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: HomeScreen.blue.withOpacity(0.10),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: HomeScreen.darkGreen,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Section title
  // ============================================================


}
