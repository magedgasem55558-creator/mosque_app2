part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin11 on _ChildDetailsScreenState {
  Future<void> _sendMessage({
    required String studentId,
    required String parentId,
    required String halaqaId,
  }) async {
    final String text =
        _parentMessageController
            .text
            .trim();

    if (text.isEmpty) {
      return;
    }

    if (_adminId == null) {
      await _loadAdmin();

      if (_adminId == null) {
        if (!mounted) return;

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              'تعذر العثور على حساب المدير.',
            ),
            backgroundColor:
                Colors.redAccent,
          ),
        );

        return;
      }
    }

    setState(() {
      _sendingMessage = true;
    });

    try {
      final String studentName =
          widget.child['name']
                  ?.toString() ??
              'الطالب';

      final String parentName =
          widget.child['parentName']
                  ?.toString() ??
              widget.child['guardianName']
                  ?.toString() ??
              'ولي الأمر';

      final String halaqaName =
          widget.child['halaqaName']
                  ?.toString() ??
              '';

      final String currentParentId =
          parentId;

      final String conversationId =
          '${currentParentId}_$studentId';

      await FirebaseFirestore
          .instance
          .collection('messages')
          .add({
        // =====================================================
        // المحادثة
        // =====================================================

        'conversationId':
            conversationId,

        // =====================================================
        // الطالب
        // =====================================================

        'studentId':
            studentId,

        'studentName':
            studentName,

        // =====================================================
        // ولي الأمر
        // =====================================================

        'parentId':
            currentParentId,

        'parentName':
            parentName,

        // =====================================================
        // الحلقة
        // =====================================================

        'halaqaId':
            halaqaId,

        'halaqaName':
            halaqaName,

        // =====================================================
        // المدير
        // =====================================================

        'adminId':
            _adminId,

        // =====================================================
        // المرسل والمستقبل
        // =====================================================

        'senderId':
            currentParentId,

        'senderRole':
            'parent',

        'receiverId':
            _adminId,

        'receiverRole':
            'admin',

        // =====================================================
        // الرسالة
        // =====================================================

        'text':
            text,

        // =====================================================
        // الوقت
        // =====================================================

        'createdAt':
            FieldValue.serverTimestamp(),

        'updatedAt':
            FieldValue.serverTimestamp(),
      });

      _parentMessageController.clear();

      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'تم إرسال الرسالة إلى الإدارة.',
          ),
          backgroundColor:
              primaryGreen,
          behavior:
              SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'تعذر إرسال الرسالة: $e',
          ),
          backgroundColor:
              Colors.redAccent,
          behavior:
              SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _sendingMessage = false;
        });
      }
    }
  }

  // ============================================================
  // Fallback
  // ============================================================


}
