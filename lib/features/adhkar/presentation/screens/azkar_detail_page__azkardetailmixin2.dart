part of 'hisn_el_muslim_page.dart';

mixin _AzkarDetailMixin2 on _AzkarDetailPageState {
  Widget _buildProgressHeader() {
    int completed = 0;

    for (int i = 0; i < _counters.length; i++) {
      if (_counters[i] == 0) {
        completed++;
      }
    }

    final progress = widget.items.isEmpty
        ? 0.0
        : completed / widget.items.length;

    return Container(
      margin: const EdgeInsets.fromLTRB(
        16,
        14,
        16,
        4,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 58,
            height: 58,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 5,
                  backgroundColor:
                      widget.themeColor.withOpacity(.10),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(
                    widget.themeColor,
                  ),
                ),
                Text(
                  '${(progress * 100).round()}%',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: widget.themeColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'وردك اليومي',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'أكمل الأذكار بهدوء واحتساب',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$completed / ${widget.items.length}',
            style: TextStyle(
              color: widget.themeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySearch() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 60,
            color: Colors.grey,
          ),
          SizedBox(height: 12),
          Text(
            'لم يتم العثور على الذكر',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


}
