part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin9 on _ChildDetailsScreenState {
  Widget _buildMessageBubble(
    Map<String, dynamic> data,
  ) {
    final String role =
        data['senderRole']
                ?.toString() ??
            'parent';

    final bool isAdmin =
        role == 'admin';

    final String text =
        data['text']?.toString() ?? '';

    final Timestamp? createdAt =
        data['createdAt']
            as Timestamp?;

    String timeText = '';

    if (createdAt != null) {
      final date =
          createdAt.toDate();

      timeText =
          '${date.hour.toString().padLeft(2, '0')}:'
          '${date.minute.toString().padLeft(2, '0')}';
    }

    return Align(
      alignment: isAdmin
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        constraints:
            const BoxConstraints(
          maxWidth: 310,
        ),
        margin:
            const EdgeInsets.only(
          bottom: 9,
        ),
        padding:
            const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isAdmin
              ? primaryGreen
                  .withOpacity(0.09)
              : primaryBlue
                  .withOpacity(0.09),
          borderRadius:
              BorderRadius.circular(16),
          border: Border.all(
            color: isAdmin
                ? primaryGreen
                    .withOpacity(0.16)
                : primaryBlue
                    .withOpacity(0.16),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Icon(
                  isAdmin
                      ? Icons
                          .admin_panel_settings_rounded
                      : Icons.person_rounded,
                  color: isAdmin
                      ? primaryGreen
                      : primaryBlue,
                  size: 15,
                ),

                const SizedBox(
                    width: 5),

                Text(
                  isAdmin
                      ? 'المدير'
                      : 'ولي الأمر',
                  style: TextStyle(
                    color: isAdmin
                        ? primaryGreen
                        : primaryBlue,
                    fontSize: 10,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(
                height: 6),

            Text(
              text,
              textDirection:
                  TextDirection.rtl,
              textAlign:
                  TextAlign.right,
              style:
                  const TextStyle(
                color:
                    Colors.black87,
                fontSize: 13,
                height: 1.5,
              ),
            ),

            if (timeText.isNotEmpty) ...[
              const SizedBox(
                  height: 5),
              Text(
                timeText,
                style: TextStyle(
                  color:
                      Colors.grey.shade500,
                  fontSize: 9,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ============================================================
  // Send Message Box
  // ============================================================


}
