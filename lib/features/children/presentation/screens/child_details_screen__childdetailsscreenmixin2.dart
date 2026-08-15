part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin2 on _ChildDetailsScreenState {
  Widget _buildStudentCard(
    String studentName,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  primaryGreen,
                  primaryBlue,
                ],
              ),
              borderRadius:
                  BorderRadius.circular(19),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: 34,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  'الطالب',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  studentName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color:
                        primaryGreen.withOpacity(0.09),
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize:
                        MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_stories_rounded,
                        color: primaryGreen,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'حلقة القرآن',
                        style: TextStyle(
                          color: primaryGreen,
                          fontSize: 11,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  primaryBlue.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.verified_rounded,
              color: primaryBlue,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Tabs
  // ============================================================

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.96),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TabBar(
        indicator: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              primaryGreen,
              primaryBlue,
            ],
          ),
          borderRadius:
              BorderRadius.circular(16),
        ),
        indicatorSize:
            TabBarIndicatorSize.tab,
        indicatorPadding:
            const EdgeInsets.all(5),
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor:
            Colors.grey.shade600,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.today_rounded,
              size: 21,
            ),
            text: 'إنجاز اليوم',
          ),
          Tab(
            icon: Icon(
              Icons.calendar_month_rounded,
              size: 21,
            ),
            text: 'السجل الكامل',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Daily
  // ============================================================


}
