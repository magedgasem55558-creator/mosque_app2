part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin3 on _ChildDetailsScreenState {
  Widget _buildDailyReport(
    String studentId,
  ) {
    final String today =
        DateTime.now()
            .toIso8601String()
            .split('T')[0];

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('records')
          .where(
            'studentId',
            isEqualTo: studentId,
          )
          .where(
            'date',
            isEqualTo: today,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return _buildLoading();
        }

        if (snapshot.hasError) {
          return _buildEmptyState(
            icon:
                Icons.error_outline_rounded,
            title:
                'تعذر تحميل البيانات',
            subtitle:
                'حدث خطأ أثناء جلب سجل الطالب.',
          );
        }

        if (!snapshot.hasData ||
            snapshot.data!.docs.isEmpty) {
          return _buildEmptyState(
            icon:
                Icons.event_available_rounded,
            title:
                'لا يوجد سجل اليوم',
            subtitle:
                'لم يتم تسجيل أي حالة للطالب بتاريخ\n$today',
          );
        }

        final List<DocumentSnapshot> docs =
            [...snapshot.data!.docs];

        _sortRecordsNewestFirst(docs);

        return _buildRecordList(docs);
      },
    );
  }

  // ============================================================
  // Monthly
  // ============================================================

  Widget _buildMonthlyReport(
    String studentId,
  ) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('records')
          .where(
            'studentId',
            isEqualTo: studentId,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return _buildLoading();
        }

        if (snapshot.hasError) {
          return _buildEmptyState(
            icon:
                Icons.error_outline_rounded,
            title:
                'تعذر تحميل السجل',
            subtitle:
                'حدث خطأ أثناء جلب البيانات.',
          );
        }

        if (!snapshot.hasData ||
            snapshot.data!.docs.isEmpty) {
          return _buildEmptyState(
            icon:
                Icons.history_rounded,
            title:
                'لا توجد سجلات سابقة',
            subtitle:
                'ستظهر هنا جميع حالات وإنجازات الطالب.',
          );
        }

        final List<DocumentSnapshot> docs =
            [...snapshot.data!.docs];

        _sortRecordsNewestFirst(docs);

        return _buildRecordList(docs);
      },
    );
  }

  // ============================================================
  // ترتيب الرصد
  // ============================================================

  void _sortRecordsNewestFirst(
    List<DocumentSnapshot> docs,
  ) {
    docs.sort((a, b) {
      final Map<String, dynamic> dataA =
          (a.data()
                  as Map<String, dynamic>?) ??
              {};

      final Map<String, dynamic> dataB =
          (b.data()
                  as Map<String, dynamic>?) ??
              {};

      final DateTime dateA =
          _recordDateTime(dataA);

      final DateTime dateB =
          _recordDateTime(dataB);

      return dateB.compareTo(dateA);
    });
  }

  DateTime _recordDateTime(
    Map<String, dynamic> data,
  ) {
    final dynamic createdAt =
        data['createdAt'];

    if (createdAt is Timestamp) {
      return createdAt.toDate();
    }

    final String date =
        data['date']?.toString() ?? '';

    final DateTime? parsed =
        DateTime.tryParse(date);

    return parsed ?? DateTime(1900);
  }

  // ============================================================
  // Records
  // ============================================================


}
