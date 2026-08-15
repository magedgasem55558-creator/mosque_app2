part of 'home_screen.dart';

extension _home_screenUi3 on HomeScreen {
  Widget _buildGridItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(23),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
            border: Border.all(
              color: Colors.white.withOpacity(0.8),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.13),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.055),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            color.withOpacity(0.18),
                            color.withOpacity(0.07),
                          ],
                        ),
                        borderRadius:
                            BorderRadius.circular(17),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 28,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 12,
                bottom: 13,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: color.withOpacity(0.45),
                  size: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // Info row
  // ============================================================

  Widget _buildInfoRow(FirebaseService service) {
    return StreamBuilder<NextKhutba>(
      stream: service.streamNextKhutba(),
      builder: (context, khutbaSnapshot) {
        if (khutbaSnapshot.connectionState ==
            ConnectionState.waiting) {
          return _buildGlassCard(
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    color: HomeScreen.teal,
                  ),
                  SizedBox(width: 14),
                  Text(
                    'جاري جلب بيانات الخطبة...',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        final khutba = khutbaSnapshot.data;

        return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('settings')
              .doc('next_event')
              .snapshots(),
          builder: (context, eventSnapshot) {
            if (eventSnapshot.connectionState ==
                ConnectionState.waiting) {
              return _buildKhutbaCard(khutba);
            }

            if (eventSnapshot.hasError ||
                !eventSnapshot.hasData ||
                !eventSnapshot.data!.exists) {
              return _buildKhutbaCard(khutba);
            }

            final eventData =
                eventSnapshot.data!.data()
                    as Map<String, dynamic>?;

            if (eventData == null ||
                (eventData['title'] as String? ?? '')
                    .isEmpty) {
              return _buildKhutbaCard(khutba);
            }

            return Column(
              children: [
                _buildKhutbaCard(khutba),
                const SizedBox(height: 10),
                _buildEventCard(eventData),
              ],
            );
          },
        );
      },
    );
  }

  // ============================================================
  // Upcoming lecture
  // ============================================================


}
