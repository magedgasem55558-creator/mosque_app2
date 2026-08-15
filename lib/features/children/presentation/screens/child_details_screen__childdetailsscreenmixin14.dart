part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin14 on _ChildDetailsScreenState {
  Widget _buildEvaluationTag(
    String title,
    bool isDone,
    IconData icon,
  ) {
    final Color color =
        isDone
            ? primaryGreen
            : Colors.grey;

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration:
                BoxDecoration(
              color: isDone
                  ? primaryGreen
                      .withOpacity(0.10)
                  : Colors.grey
                      .withOpacity(0.08),
              shape:
                  BoxShape.circle,
            ),
            child: Icon(
              isDone
                  ? icon
                  : Icons.remove_rounded,
              color: color,
              size: 19,
            ),
          ),

          const SizedBox(
              height: 6),

          Text(
            title,
            textAlign:
                TextAlign.center,
            style: TextStyle(
              color: isDone
                  ? Colors.black87
                  : Colors.grey,
              fontSize: 11,
              fontWeight: isDone
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),

          const SizedBox(
              height: 2),

          Text(
            isDone
                ? 'ممتاز'
                : 'لم يسجل',
            style: TextStyle(
              color: isDone
                  ? primaryGreen
                  : Colors.grey.shade400,
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Loading
  // ============================================================

  Widget _buildLoading() {
    return const Center(
      child:
          CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      ),
    );
  }

  // ============================================================
  // Empty
  // ============================================================

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.all(30),
        child: Container(
          width: double.infinity,
          padding:
              const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.08),
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            mainAxisSize:
                MainAxisSize.min,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration:
                    BoxDecoration(
                  gradient:
                      LinearGradient(
                    colors: [
                      primaryGreen
                          .withOpacity(
                              0.12),
                      primaryBlue
                          .withOpacity(
                              0.12),
                    ],
                  ),
                  shape:
                      BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color:
                      primaryGreen,
                  size: 38,
                ),
              ),

              const SizedBox(
                  height: 18),

              Text(
                title,
                textAlign:
                    TextAlign.center,
                style:
                    const TextStyle(
                  color:
                      Colors.black87,
                  fontSize: 18,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(
                  height: 8),

              Text(
                subtitle,
                textAlign:
                    TextAlign.center,
                style: TextStyle(
                  color:
                      Colors.grey.shade600,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return _buildEmptyState(
      icon:
          Icons.person_off_rounded,
      title:
          'تعذر العثور على الطالب',
      subtitle:
          'لم يتم العثور على معرف الطالب المطلوب.',
    );
  }

  // ============================================================
  // التحقق من وجود نص
  // ============================================================

  bool _hasText(dynamic value) {
    if (value == null) {
      return false;
    }

    final String text =
        value.toString().trim();

    if (text.isEmpty) {
      return false;
    }

    if (text == 'لا يوجد') {
      return false;
    }

    return true;
  }

}
