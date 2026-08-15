part of 'leaderboard_screen.dart';

extension _leaderboard_screenUi1 on LeaderboardScreen {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            const SizedBox(height: 8),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('students')
                    .orderBy(
                      'totalPoints',
                      descending: true,
                    )
                    .limit(3)
                    .snapshots(),
                builder: (context, snapshot) {
                  // ------------------------------------------------
                  // خطأ
                  // ------------------------------------------------

                  if (snapshot.hasError) {
                    return _buildErrorState();
                  }

                  // ------------------------------------------------
                  // تحميل
                  // ------------------------------------------------

                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return _buildLoadingState();
                  }

                  // ------------------------------------------------
                  // البيانات
                  // ------------------------------------------------

                  final students =
                      snapshot.data?.docs ?? [];

                  if (students.isEmpty) {
                    return _buildEmptyState();
                  }

                  return _buildLeaderboard(students);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // Header
  // ============================================================

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        18,
        20,
        8,
      ),
      child: Column(
        children: [
          // أيقونة الكأس
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryBlue,
                  blue,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: primaryBlue.withOpacity(0.22),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.emoji_events_rounded,
              color: Colors.white,
              size: 34,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'الطلاب المتصدرون',
            style: TextStyle(
              color: primaryBlue,
              fontSize: 25,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'أفضل 3 طلاب لهذا اليوم',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 16),

          // خط زخرفي
          Container(
            width: 55,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  lightBlue,
                  primaryBlue,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Leaderboard
  // ============================================================


}
