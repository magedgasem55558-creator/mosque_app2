part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin13 on _ChildDetailsScreenState {
  Widget _buildStatusDescription({
    required String status,
    required Color color,
    required IconData icon,
  }) {
    String description;

    switch (status) {
      case 'غائب':
        description =
            'لم يحضر الطالب إلى الحلقة في هذا اليوم.';
        break;

      case 'إجازة':
        description =
            'الطالب في إجازة ولا يوجد إنجاز مسجل لهذا اليوم.';
        break;

      case 'مستأذن':
        description =
            'الطالب مستأذن لهذا اليوم بعذر مسجل.';
        break;

      case 'مراجعة':
        description =
            'تم تخصيص هذا اليوم لمراجعة المحفوظ السابق.';
        break;

      default:
        description =
            'تم تسجيل حالة خاصة للطالب.';
    }

    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color:
            color.withOpacity(0.07),
        borderRadius:
            BorderRadius.circular(17),
        border: Border.all(
          color:
              color.withOpacity(0.16),
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration:
                BoxDecoration(
              color:
                  color.withOpacity(0.12),
              shape:
                  BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 22,
            ),
          ),

          const SizedBox(width: 11),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height: 5),

                Text(
                  description,
                  style:
                      const TextStyle(
                    color:
                        Colors.black87,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Section Title
  // ============================================================

  Widget _buildSectionTitle({
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: primaryGreen,
          size: 20,
        ),
        const SizedBox(width: 7),
        Text(
          title,
          style:
              const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // Highlight
  // ============================================================

  Widget _buildHighlightCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color:
            iconColor.withOpacity(0.07),
        borderRadius:
            BorderRadius.circular(16),
        border: Border.all(
          color:
              iconColor.withOpacity(0.18),
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(
              color:
                  iconColor.withOpacity(
                      0.13),
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 21,
            ),
          ),

          const SizedBox(width: 11),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 12,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height: 5),

                Text(
                  value,
                  textDirection:
                      TextDirection.rtl,
                  textAlign:
                      TextAlign.right,
                  style:
                      const TextStyle(
                    color:
                        Colors.black87,
                    fontSize: 14,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Evaluation Tag
  // ============================================================


}
