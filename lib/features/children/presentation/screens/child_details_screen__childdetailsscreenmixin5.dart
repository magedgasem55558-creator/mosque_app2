part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin5 on _ChildDetailsScreenState {
  Widget _buildRecordCard(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    final String status =
        data['status']?.toString() ??
            'حاضر';

    final bool isAbsent =
        status == 'غائب';

    final bool isVacation =
        status == 'إجازة';

    final bool isExcused =
        status == 'مستأذن';

    final bool isReviewStatus =
        status == 'مراجعة';

    final bool isSpecialStatus =
        isAbsent ||
        isVacation ||
        isExcused ||
        isReviewStatus;

    final String surah =
        data['surah']?.toString() ??
            'غير محددة';

    final String date =
        data['date']?.toString() ?? '';

    final String grade =
        data['grade']?.toString() ?? '';

    Color statusColor;
    IconData statusIcon;

    if (isAbsent) {
      statusColor = Colors.red;
      statusIcon =
          Icons.person_off_rounded;
    } else if (isVacation) {
      statusColor = Colors.orange;
      statusIcon =
          Icons.beach_access_rounded;
    } else if (isExcused) {
      statusColor =
          Colors.deepPurple;
      statusIcon =
          Icons.event_available_rounded;
    } else if (isReviewStatus) {
      statusColor = Colors.blue;
      statusIcon =
          Icons.fact_check_rounded;
    } else {
      statusColor = primaryGreen;
      statusIcon =
          Icons.menu_book_rounded;
    }

    return Container(
      margin:
          const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isSpecialStatus
            ? statusColor.withOpacity(0.035)
            : Colors.white,
        borderRadius:
            BorderRadius.circular(24),
        border: Border.all(
          color: isSpecialStatus
              ? statusColor.withOpacity(0.25)
              : Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.07),
            blurRadius: 18,
            offset:
                const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(24),
        child: Column(
          children: [
            // ==================================================
            // الشريط العلوي
            // ==================================================

            Container(
              height: 5,
              decoration:
                  BoxDecoration(
                gradient:
                    LinearGradient(
                  colors:
                      isSpecialStatus
                          ? [
                              statusColor,
                              statusColor
                                  .withOpacity(
                                      0.5),
                            ]
                          : const [
                              primaryGreen,
                              primaryBlue,
                            ],
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(17),
              child: Column(
                children: [
                  // ==========================================
                  // رأس الإنجاز
                  // ==========================================

                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration:
                            BoxDecoration(
                          gradient:
                              LinearGradient(
                            colors:
                                isSpecialStatus
                                    ? [
                                        statusColor,
                                        statusColor
                                            .withOpacity(
                                                0.65),
                                      ]
                                    : const [
                                        primaryGreen,
                                        primaryBlue,
                                      ],
                          ),
                          borderRadius:
                              BorderRadius.circular(
                                  15),
                        ),
                        child: Icon(
                          statusIcon,
                          color:
                              Colors.white,
                          size: 26,
                        ),
                      ),

                      const SizedBox(
                          width: 13),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            Text(
                              isSpecialStatus
                                  ? 'حالة الطالب'
                                  : 'إنجاز القرآن الكريم',
                              style:
                                  TextStyle(
                                color: Colors
                                    .grey
                                    .shade600,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(
                                height: 4),

                            Text(
                              isSpecialStatus
                                  ? status
                                  : 'سورة $surah',
                              maxLines: 1,
                              overflow:
                                  TextOverflow
                                      .ellipsis,
                              style:
                                  TextStyle(
                                color:
                                    isSpecialStatus
                                        ? statusColor
                                        : Colors
                                            .black87,
                                fontSize: 18,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      _buildDateBadge(
                        date,
                      ),
                    ],
                  ),

                  // ==========================================
                  // حالات الغياب والإجازة والاستئذان
                  // ==========================================

                  if (isSpecialStatus) ...[
                    const SizedBox(
                        height: 18),

                    _buildStatusDescription(
                      status: status,
                      color: statusColor,
                      icon: statusIcon,
                    ),
                  ],

                  // ==========================================
                  // إنجاز الحفظ
                  // ==========================================

                  if (!isSpecialStatus) ...[
                    const SizedBox(
                        height: 18),

                    _buildHighlightCard(
                      icon: Icons
                          .format_list_numbered_rounded,
                      iconColor:
                          primaryGreen,
                      label:
                          'نطاق التسميع',
                      value:
                          'من الآية ${data['fromAyah'] ?? '0'} إلى الآية ${data['toAyah'] ?? '0'}',
                    ),

                    const SizedBox(
                        height: 17),

                    _buildEvaluationSection(
                      grade,
                    ),
                  ],

                  // ==========================================
                  // 📚 المطلوب غداً
                  // ==========================================

                  if (_hasText(
                    data['tomorrowRequirement'],
                  )) ...[
                    const SizedBox(
                        height: 15),

                    _buildHighlightCard(
                      icon: Icons
                          .auto_stories_rounded,
                      iconColor:
                          primaryBlue,
                      label:
                          'المطلوب غداً',
                      value:
                          data[
                                  'tomorrowRequirement']
                              .toString(),
                    ),
                  ],

                  // ==========================================
                  // 📝 ملاحظة المدرس
                  // ==========================================

                  if (_hasText(
                    data['notes'],
                  )) ...[
                    const SizedBox(
                        height: 11),

                    _buildHighlightCard(
                      icon: Icons
                          .edit_note_rounded,
                      iconColor:
                          primaryGreen,
                      label:
                          'ملاحظة المدرس',
                      value:
                          data['notes']
                              .toString(),
                    ),
                  ],

                  const SizedBox(
                      height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // التاريخ
  // ============================================================


}
