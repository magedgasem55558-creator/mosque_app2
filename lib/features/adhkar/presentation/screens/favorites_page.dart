part of 'hisn_el_muslim_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  List<Map<String, dynamic>> get favorites {
    final List<Map<String, dynamic>> result = [];

    for (final category in AzkarData.categories) {
      final items =
          List<Map<String, dynamic>>.from(
        category['items'],
      );

      for (final item in items) {
        result.add({
          'text': item['text'],
          'category': category['title'],
          'color': category['color'],
        });
      }
    }

    // صفحة المفضلة الأساسية تعرض جميع الأذكار
    // ويمكن لاحقاً ربطها بـ SharedPreferences.
    return result.take(20).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(
            'المفضلة',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final item = favorites[index];
            final Color color =
                item['color'] as Color;

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item['category'],
                        style: TextStyle(
                          color: color,
                          fontSize: 12,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item['text'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.9,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// المسبحة الإلكترونية المحسنة
// ============================================================


