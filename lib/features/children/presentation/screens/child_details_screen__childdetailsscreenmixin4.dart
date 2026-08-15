part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin4 on _ChildDetailsScreenState {
  Widget _buildRecordList(
    List<DocumentSnapshot> docs,
  ) {
    if (docs.isEmpty) {
      return const SizedBox.shrink();
    }

    // ==========================================================
    // نأخذ أول سجل فقط للحصول على بيانات الطالب والحلقة
    // للمحادثة.
    //
    // المحادثة تظهر مرة واحدة فقط.
    // ==========================================================

    final Map<String, dynamic> firstRecord =
        (docs.first.data()
                as Map<String, dynamic>?) ??
            {};

    return ListView(
      physics:
          const BouncingScrollPhysics(),
      padding:
          const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        40,
      ),
      children: [
        // ======================================================
        // 💬 المحادثة
        // ======================================================

        _buildChatSection(
          firstRecord,
        ),

        const SizedBox(height: 20),

        // ======================================================
        // 📖 عنوان الإنجازات
        // ======================================================

        _buildRecordsHeader(
          docs.length,
        ),

        const SizedBox(height: 12),

        // ======================================================
        // 📚 جميع الإنجازات
        // ======================================================

        ...docs.map(
          (doc) {
            final Map<String, dynamic> data =
                (doc.data()
                        as Map<String, dynamic>?) ??
                    {};

            return _buildRecordCard(
              context,
              data,
            );
          },
        ),
      ],
    );
  }

  // ============================================================
  // عنوان الإنجازات
  // ============================================================

  Widget _buildRecordsHeader(
    int count,
  ) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color:
            Colors.white.withOpacity(0.96),
        borderRadius:
            BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset:
                const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient:
                  const LinearGradient(
                colors: [
                  primaryGreen,
                  primaryBlue,
                ],
              ),
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.auto_stories_rounded,
              color: Colors.white,
              size: 21,
            ),
          ),

          const SizedBox(width: 11),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'إنجازات الطالب',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'سجل التسميع والتقييم والملاحظات',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color:
                  primaryGreen.withOpacity(0.09),
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: Text(
              '$count',
              style:
                  const TextStyle(
                color: primaryGreen,
                fontSize: 12,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Record Card
  // ============================================================


}
