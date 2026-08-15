part of 'hisn_el_muslim_page.dart';

mixin _AzkarDetailMixin3 on _AzkarDetailPageState {
  Widget _buildZikrCard(
    int index,
    int number,
  ) {
    final item = widget.items[index];
    final text = item['text'] as String;

    final int remaining = _counters[index];
    final int total = item['count'] as int;

    final bool done = remaining == 0;

    final double progress = total == 0
        ? 0
        : (total - remaining) / total;

    final bool favorite =
        _favorites.contains(text);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: done
            ? Colors.grey.shade50
            : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: done
              ? Colors.grey.shade300
              : widget.themeColor.withOpacity(.16),
          width: 1.3,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.themeColor.withOpacity(.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: widget.themeColor.withOpacity(.09),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$number',
                    style: TextStyle(
                      color: widget.themeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                tooltip: 'المفضلة',
                onPressed: () =>
                    _toggleFavorite(text),
                icon: Icon(
                  favorite
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  color: favorite
                      ? Colors.amber
                      : Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              height: 2,
              color: done
                  ? Colors.grey
                  : AppColors.text,
              fontWeight: FontWeight.w500,
              decoration: done
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),

          const SizedBox(height: 16),

          // ==================================================
          // العداد الدائري
          // ==================================================

          GestureDetector(
            onTap: done
                ? null
                : () => _decrement(index),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 7,
                      backgroundColor:
                          widget.themeColor.withOpacity(.10),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(
                        done
                            ? Colors.grey
                            : widget.themeColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: done
                          ? Colors.grey.shade100
                          : widget.themeColor
                              .withOpacity(.08),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Icon(
                          done
                              ? Icons.check_rounded
                              : Icons.touch_app_rounded,
                          color: done
                              ? Colors.grey
                              : widget.themeColor,
                          size: 21,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          done
                              ? 'تم'
                              : '$remaining',
                          style: TextStyle(
                            color: done
                                ? Colors.grey
                                : widget.themeColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          Text(
            done
                ? 'أحسنت، تم إكمال الذكر'
                : 'المتبقي: $remaining من $total',
            style: TextStyle(
              color: done
                  ? Colors.green
                  : Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              _actionButton(
                icon: Icons.copy_rounded,
                label: 'نسخ',
                onTap: () => _copy(text),
              ),
              const SizedBox(width: 8),
              _actionButton(
                icon: Icons.share_rounded,
                label: 'مشاركة',
                onTap: () => _share(text),
              ),
              const SizedBox(width: 8),
              _actionButton(
                icon: Icons.refresh_rounded,
                label: 'إعادة',
                onTap: () => _resetOne(index),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
