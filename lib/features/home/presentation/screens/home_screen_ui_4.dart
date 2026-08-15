part of 'home_screen.dart';

extension _home_screenUi4 on HomeScreen {
  Widget _buildUpcomingLecture() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('lectures')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
                ConnectionState.waiting ||
            !snapshot.hasData ||
            snapshot.data!.docs.isEmpty) {
          return const SizedBox.shrink();
        }

        final now = DateTime.now();

        final List<Map<String, dynamic>> upcoming = [];

        for (final doc in snapshot.data!.docs) {
          final data =
              doc.data() as Map<String, dynamic>;

          final timeStr = data['time'] as String?;

          if (timeStr != null) {
            final time = DateTime.tryParse(timeStr);

            if (time != null && time.isAfter(now)) {
              final copy =
                  Map<String, dynamic>.from(data);

              copy['id'] = doc.id;
              upcoming.add(copy);
            }
          }
        }

        if (upcoming.isEmpty) {
          return const SizedBox.shrink();
        }

        upcoming.sort(
          (a, b) => DateTime.parse(a['time'])
              .compareTo(
                DateTime.parse(b['time']),
              ),
        );

        final lecture = upcoming.first;

        return _buildGlassCard(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildSmallIcon(
                  Icons.menu_book_rounded,
                  const Color(0xFF7E57C2),
                ),

                const SizedBox(width: 13),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'محاضرة قادمة',
                        style: TextStyle(
                          color: Color(0xFF7E57C2),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        lecture['title'] ?? 'محاضرة',
                        maxLines: 1,
                        overflow:
                            TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      if (lecture['speaker'] != null &&
                          (lecture['speaker'] as String)
                              .isNotEmpty)
                        Text(
                          'المحاضر: ${lecture['speaker']}',
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                        ),

                      const SizedBox(height: 3),

                      Text(
                        _formatLectureTime(
                          lecture['time'],
                        ),
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
      },
    );
  }

  // ============================================================
  // Khutba card
  // ============================================================

  Widget _buildKhutbaCard(NextKhutba? khutba) {
    return _buildGlassCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _buildSmallIcon(
              Icons.mic_external_on_rounded,
              HomeScreen.teal,
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'خطبة الجمعة القادمة',
                    style: TextStyle(
                      color: HomeScreen.teal,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    khutba?.title ??
                        'لم يتم تحديد العنوان',
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    'الخطيب: ${khutba?.imam ?? 'غير محدد'}',
                    style: const TextStyle(
                      color: Colors.black54,
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
  // Event card
  // ============================================================


}
