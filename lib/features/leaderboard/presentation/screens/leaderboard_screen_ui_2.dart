part of 'leaderboard_screen.dart';

extension _leaderboard_screenUi2 on LeaderboardScreen {
  Widget _buildLeaderboard(
    List<QueryDocumentSnapshot> students,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(
            12,
            10,
            12,
            30,
          ),
          child: Column(
            children: [
              const SizedBox(height: 18),

              // --------------------------------------------------
              // منصة المتصدرين
              // --------------------------------------------------

              SizedBox(
                height: 510,
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,
                  children: [
                    // المركز الثاني
                    if (students.length > 1)
                      Expanded(
                        child: _buildPodiumItem(
                          doc: students[1],
                          rank: 2,
                          color: silver,
                          podiumHeight: 145,
                        ),
                      )
                    else
                      const Expanded(
                        child: SizedBox(),
                      ),

                    // المركز الأول
                    Expanded(
                      child: _buildPodiumItem(
                        doc: students[0],
                        rank: 1,
                        color: gold,
                        podiumHeight: 190,
                        isWinner: true,
                      ),
                    ),

                    // المركز الثالث
                    if (students.length > 2)
                      Expanded(
                        child: _buildPodiumItem(
                          doc: students[2],
                          rank: 3,
                          color: bronze,
                          podiumHeight: 115,
                        ),
                      )
                    else
                      const Expanded(
                        child: SizedBox(),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // --------------------------------------------------
              // رسالة تشجيعية
              // --------------------------------------------------

              _buildMotivationCard(),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // Podium item
  // ============================================================


}
