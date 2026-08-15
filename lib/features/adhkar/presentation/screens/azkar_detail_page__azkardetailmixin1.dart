part of 'hisn_el_muslim_page.dart';

mixin _AzkarDetailMixin1 on _AzkarDetailPageState {
  @override
  void initState() {
    super.initState();

    _counters = widget.items.map<int>((item) {
      return item['count'] as int;
    }).toList();
  }

  List<int> get filteredIndexes {
    if (_search.trim().isEmpty) {
      return List.generate(
        widget.items.length,
        (index) => index,
      );
    }

    final query = _search.trim();

    return List.generate(
      widget.items.length,
      (index) => index,
    ).where((index) {
      return widget.items[index]['text']
          .toString()
          .contains(query);
    }).toList();
  }

  void _decrement(int index) {
    if (_counters[index] <= 0) return;

    HapticFeedback.lightImpact();

    setState(() {
      _counters[index]--;
    });

    if (_counters[index] == 0) {
      HapticFeedback.mediumImpact();
    }
  }

  void _resetOne(int index) {
    setState(() {
      _counters[index] =
          widget.items[index]['count'] as int;
    });
  }

  void _toggleFavorite(String text) {
    setState(() {
      if (_favorites.contains(text)) {
        _favorites.remove(text);
      } else {
        _favorites.add(text);
      }
    });
  }

  Future<void> _share(String text) async {
    await SharePlus.instance.share(
      ShareParams(
        text: '$text\n\nمن تطبيق حصن المسلم',
      ),
    );
  }

  void _copy(String text) {
    Clipboard.setData(
      ClipboardData(text: text),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'تم نسخ الذكر',
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final indexes = filteredIndexes;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: widget.themeColor,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _search = _search.isEmpty
                      ? ' '
                      : '';
                });
              },
              icon: const Icon(
                Icons.search_rounded,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            if (_search.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  14,
                  16,
                  4,
                ),
                child: TextField(
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      _search = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'ابحث داخل الأذكار...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

            _buildProgressHeader(),

            Expanded(
              child: indexes.isEmpty
                  ? _buildEmptySearch()
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        8,
                        16,
                        30,
                      ),
                      itemCount: indexes.length,
                      itemBuilder: (context, listIndex) {
                        final index =
                            indexes[listIndex];

                        return _buildZikrCard(
                          index,
                          listIndex + 1,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }


}
