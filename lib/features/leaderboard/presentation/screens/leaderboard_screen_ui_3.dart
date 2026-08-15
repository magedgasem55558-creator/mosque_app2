part of 'leaderboard_screen.dart';

extension _leaderboard_screenUi3 on LeaderboardScreen {
  Widget _buildPodiumItem({
    required QueryDocumentSnapshot doc,
    required int rank,
    required Color color,
    required double podiumHeight,
    bool isWinner = false,
  }) {
    final data =
        doc.data() as Map<String, dynamic>;

    final String name =
        (data['name'] ?? 'طالب').toString();

    final dynamic rawPoints =
        data['totalPoints'] ?? 0;

    final int points =
        rawPoints is num
            ? rawPoints.toInt()
            : int.tryParse(
                  rawPoints.toString(),
                ) ??
                0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // ========================================================
        // التاج للمركز الأول
        // ========================================================

        if (isWinner)
          const Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              Icons.workspace_premium_rounded,
              color: gold,
              size: 38,
            ),
          ),

        if (!isWinner)
          const SizedBox(height: 38),

        // ========================================================
        // دائرة المركز
        // ========================================================

        Container(
          width: isWinner ? 88 : 76,
          height: isWinner ? 88 : 76,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color,
                color.withOpacity(0.72),
              ],
            ),

            border: Border.all(
              color: Colors.white,
              width: 4,
            ),

            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.35),
                blurRadius: isWinner ? 22 : 14,
                offset: const Offset(0, 7),
              ),
            ],
          ),

          child: Center(
            child: Text(
              '$rank',
              style: TextStyle(
                color: Colors.white,
                fontSize: isWinner ? 32 : 27,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // ========================================================
        // بطاقة اسم الطالب
        // ========================================================

        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 3,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: color.withOpacity(0.22),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.055),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // الاسم
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryBlue,
                  fontSize: isWinner ? 16 : 14,
                  fontWeight: FontWeight.w900,
                  height: 1.25,
                ),
              ),

              const SizedBox(height: 5),

              // النقاط
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.stars_rounded,
                    color: color,
                    size: 18,
                  ),
                  const SizedBox(width: 3),
                  Flexible(
                    child: Text(
                      '$points نقطة',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // ========================================================
        // المنصة
        // ========================================================

        Container(
          height: podiumHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(18),
            ),

            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color.withOpacity(0.30),
                color.withOpacity(0.08),
              ],
            ),

            border: Border.all(
              color: color.withOpacity(0.12),
            ),

            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, -4),
              ),
            ],
          ),

          child: Column(
            children: [
              const SizedBox(height: 15),

              // رقم المركز على المنصة
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.18),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$rank',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // Motivation card
  // ============================================================


}
