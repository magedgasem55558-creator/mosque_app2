part of 'home_screen.dart';

extension _home_screenUi2 on HomeScreen {
  Widget _buildSectionTitle(
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: HomeScreen.darkGreen,
            size: 23,
          ),
        ),

        const SizedBox(width: 11),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // Services grid
  // ============================================================

  Widget _buildServicesGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 13,
      crossAxisSpacing: 13,
      childAspectRatio: 1.18,
      children: [
        _buildGridItem(
          context,
          'المتصدرون',
          'أفضل الطلاب',
          Icons.emoji_events_rounded,
          const Color(0xFFFFB300),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const LeaderboardScreen(),
              ),
            );
          },
        ),

        StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildGridItem(
                context,
                'أبنائي',
                'متابعة الإنجاز',
                Icons.family_restroom_rounded,
                HomeScreen.teal,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MyChildrenScreen(),
                    ),
                  );
                },
              );
            }

            return _buildGridItem(
              context,
              'دخول الآباء',
              'متابعة الأبناء',
              Icons.lock_outline_rounded,
              HomeScreen.blue,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              },
            );
          },
        ),

        _buildGridItem(
          context,
          'تبرع للمسجد',
          'ساهم في الخير',
          Icons.favorite_rounded,
          const Color(0xFFE91E63),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DonateScreen(),
              ),
            );
          },
        ),

        _buildGridItem(
          context,
          'القبلة',
          'حدد اتجاه القبلة',
          Icons.explore_rounded,
          const Color(0xFFEF5350),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const QiblaScreen(),
              ),
            );
          },
        ),

        _buildGridItem(
          context,
          'القرآن الكريم',
          'استمع وتدبر',
          Icons.menu_book_rounded,
          HomeScreen.darkGreen,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const YasserDossariQuranPage(),
              ),
            );
          },
        ),

        _buildGridItem(
          context,
          'الأذكار',
          'حصن المسلم',
          Icons.auto_awesome_rounded,
          HomeScreen.teal,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HisnElMuslimPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  // ============================================================
  // Grid item
  // ============================================================


}
