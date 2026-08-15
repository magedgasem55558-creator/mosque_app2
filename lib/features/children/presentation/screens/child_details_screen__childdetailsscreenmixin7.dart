part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin7 on _ChildDetailsScreenState {
  Widget _buildEvaluationSection(
    String grade,
  ) {
    final bool memorization =
        _gradeContains(
      grade,
      'حفظ',
    );

    final bool mastery =
        _gradeContains(
      grade,
      'إتقان',
    );

    final bool tajweed =
        _gradeContains(
      grade,
      'تجويد',
    );

    final bool review =
        _gradeContains(
      grade,
      'مراجعة',
    );

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          icon: Icons.star_rounded,
          title: 'التقييم',
        ),

        const SizedBox(height: 10),

        Container(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 14,
          ),
          decoration:
              BoxDecoration(
            color:
                Colors.grey.shade50,
            borderRadius:
                BorderRadius.circular(17),
            border: Border.all(
              color:
                  Colors.grey.shade200,
            ),
          ),
          child: Row(
            children: [
              _buildEvaluationTag(
                'حفظ',
                memorization,
                Icons.menu_book_rounded,
              ),
              _buildEvaluationTag(
                'إتقان',
                mastery,
                Icons.verified_rounded,
              ),
              _buildEvaluationTag(
                'تجويد',
                tajweed,
                Icons.record_voice_over_rounded,
              ),
              _buildEvaluationTag(
                'مراجعة',
                review,
                Icons.replay_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _gradeContains(
    String grade,
    String value,
  ) {
    return grade
        .split('-')
        .map(
          (e) => e.trim(),
        )
        .contains(value);
  }

  // ============================================================
  // 💬 محادثة ولي الأمر مع المدير
  // تظهر مرة واحدة فقط أعلى الإنجازات
  // ============================================================

  Widget _buildChatSection(
    Map<String, dynamic> record,
  ) {
    final String studentId =
        widget.child['id']?.toString() ?? '';

    final String parentId =
        widget.child['parentId']?.toString() ??
        widget.child['parentUid']?.toString() ??
        widget.child['guardianId']?.toString() ??
        record['parentId']?.toString() ??
        '';

    final String halaqaId =
        widget.child['halaqaId']?.toString() ??
        record['halaqaId']?.toString() ??
        '';

    if (studentId.isEmpty ||
        parentId.isEmpty) {
      return _buildParentMessageFallback(
        record,
      );
    }

    if (_adminId == null) {
      return _buildAdminLoading();
    }

    return _buildMessagesSection(
      studentId: studentId,
      parentId: parentId,
      halaqaId: halaqaId,
    );
  }

  // ============================================================
  // Messages
  // ============================================================


}
