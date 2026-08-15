part of 'hisn_el_muslim_page.dart';

class AzkarDetailPage extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> items;
  final Color themeColor;
  final IconData icon;

  const AzkarDetailPage({
    super.key,
    required this.title,
    required this.items,
    required this.themeColor,
    required this.icon,
  });

  @override
  State<AzkarDetailPage> createState() => _AzkarDetailPageState();
}

class _AzkarDetailPageState extends State<AzkarDetailPage> with _AzkarDetailMixin1, _AzkarDetailMixin2, _AzkarDetailMixin3, _AzkarDetailMixin4{
  late List<int> _counters;
  final Set<String> _favorites = {};
  String _search = '';

}


// ============================================================
// المفضلة
// ============================================================


