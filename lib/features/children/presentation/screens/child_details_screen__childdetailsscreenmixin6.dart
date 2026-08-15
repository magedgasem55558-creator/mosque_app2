part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin6 on _ChildDetailsScreenState {
  Widget _buildDateBadge(
    String date,
  ) {
    final DateTime? gregorianDate =
        DateTime.tryParse(date);

    if (gregorianDate == null) {
      return Container(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color:
              Colors.grey.shade100,
          borderRadius:
              BorderRadius.circular(10),
        ),
        child: Text(
          date,
          style: TextStyle(
            color:
                Colors.grey.shade600,
            fontSize: 10,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      );
    }

    final HijriDate hijri =
        HijriDate.fromDate(
      DateTime(
        gregorianDate.year,
        gregorianDate.month,
        gregorianDate.day,
      ),
    );

    final String hijriText =
        '${_toArabicNumber(hijri.hDay)} '
        '${_getHijriMonthName(hijri.hMonth)} '
        '${_toArabicNumber(hijri.hYear)} هـ';

    final String gregorianText =
        '${_toArabicNumber(gregorianDate.day)}/'
        '${_toArabicNumber(gregorianDate.month)}/'
        '${_toArabicNumber(gregorianDate.year)} م';

    return Container(
      constraints:
          const BoxConstraints(
        minWidth: 96,
      ),
      padding:
          const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color:
            primaryGreen.withOpacity(0.07),
        borderRadius:
            BorderRadius.circular(12),
        border: Border.all(
          color:
              primaryGreen.withOpacity(0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center,
        children: [
          Text(
            hijriText,
            textAlign:
                TextAlign.center,
            style: const TextStyle(
              color: primaryGreen,
              fontSize: 10,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            gregorianText,
            textAlign:
                TextAlign.center,
            style: TextStyle(
              color:
                  Colors.grey.shade600,
              fontSize: 9,
              fontWeight:
                  FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _getHijriMonthName(
    int month,
  ) {
    const months = [
      'محرم',
      'صفر',
      'ربيع الأول',
      'ربيع الآخر',
      'جمادى الأولى',
      'جمادى الآخرة',
      'رجب',
      'شعبان',
      'رمضان',
      'شوال',
      'ذو القعدة',
      'ذو الحجة',
    ];

    if (month < 1 || month > 12) {
      return '';
    }

    return months[month - 1];
  }

  String _toArabicNumber(
    dynamic value,
  ) {
    return value
        .toString()
        .replaceAll('0', '٠')
        .replaceAll('1', '١')
        .replaceAll('2', '٢')
        .replaceAll('3', '٣')
        .replaceAll('4', '٤')
        .replaceAll('5', '٥')
        .replaceAll('6', '٦')
        .replaceAll('7', '٧')
        .replaceAll('8', '٨')
        .replaceAll('9', '٩');
  }

  // ============================================================
  // Evaluation
  // ============================================================


}
