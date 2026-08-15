part of 'home_screen.dart';

extension _home_screenUi6 on HomeScreen {
  Widget _buildLogoutButton(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<User?>(
          stream:
              FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }

            return Center(
              child: TextButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                icon: const Icon(
                  Icons.logout_rounded,
                  color: Colors.black45,
                  size: 19,
                ),
                label: const Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 8),

        // ======================================================
        // طلب نسخة للمسجد / التواصل مع المطور
        // ======================================================

        Center(
          child: TextButton.icon(
            onPressed: () {
              _showDeveloperContactDialog(context);
            },
            icon: const Icon(
              Icons.support_agent_rounded,
              color: HomeScreen.darkGreen,
              size: 21,
            ),
            label: const Text(
              'انقر هنا لطلب نسخة لمسجدك أو للتواصل مع المطور',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HomeScreen.darkGreen,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // Developer contact dialog
  // ============================================================


}
