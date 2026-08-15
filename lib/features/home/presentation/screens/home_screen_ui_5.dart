part of 'home_screen.dart';

extension _home_screenUi5 on HomeScreen {
  Widget _buildEventCard(
    Map<String, dynamic> event,
  ) {
    final title = event['title'] ?? 'فعالية';
    final location = event['location'] ?? '';

    String? timeStr = event['time'] as String?;

    if (timeStr == null || timeStr.isEmpty) {
      timeStr = event['date'] as String?;
    }

    String dateStr = '';

    if (timeStr != null && timeStr.isNotEmpty) {
      dateStr = _formatLectureTime(timeStr);
    } else {
      final lastUpdated =
          event['lastUpdated'] as Timestamp?;

      if (lastUpdated != null) {
        final dt = lastUpdated.toDate();

        dateStr =
            '${dt.year}/${dt.month.toString().padLeft(2, '0')}/${dt.day.toString().padLeft(2, '0')}';
      }
    }

    return _buildGlassCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _buildSmallIcon(
              Icons.event_rounded,
              Colors.orange,
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'فعالية قادمة',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    title,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  if (location.isNotEmpty)
                    Text(
                      'المكان: $location',
                      maxLines: 1,
                      overflow:
                          TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 11,
                      ),
                    ),

                  if (dateStr.isNotEmpty)
                    Text(
                      dateStr,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 11,
                      ),
                    ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black26,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // Small icon
  // ============================================================

  Widget _buildSmallIcon(
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 51,
      height: 51,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.18),
            color.withOpacity(0.06),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        icon,
        color: color,
        size: 27,
      ),
    );
  }

  // ============================================================
  // Glass card
  // ============================================================

  Widget _buildGlassCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.97),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  // ============================================================
  // Logout + Developer Contact
  // ============================================================


}
