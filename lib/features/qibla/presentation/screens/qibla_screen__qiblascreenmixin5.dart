part of 'qibla_screen.dart';

mixin _QiblaScreenMixin5 on _QiblaScreenState {
  Widget _buildDirectionLabels() {
    return SizedBox(
      width: 275,
      height: 275,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'N',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),

          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text(
                'E',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),

          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'S',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),

          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'W',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Data card
  // ============================================================

  Widget _buildDataCard(
    double difference,
    double absoluteDifference,
    Color activeColor,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDataRow(
            'زاوية القبلة',
            '${_qiblaBearing?.toStringAsFixed(1) ?? '--'}°',
          ),

          const Divider(height: 22),

          _buildDataRow(
            'اتجاه الهاتف',
            '${_heading?.toStringAsFixed(1) ?? '--'}°',
          ),

          const Divider(height: 22),

          _buildDataRow(
            'الانحراف عن القبلة',
            '${absoluteDifference.toStringAsFixed(1)}°',
            valueColor: activeColor,
          ),

          const SizedBox(height: 10),

          _buildDirectionHint(difference),
        ],
      ),
    );
  }

  Widget _buildDataRow(
    String title,
    String value, {
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // اتجاه الدوران المطلوب
  // ============================================================

  Widget _buildDirectionHint(double difference) {
    if (difference.abs() <= 5) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'القبلة أمامك مباشرة 🕋',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    final direction =
        difference > 0 ? 'يمين' : 'يسار';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'حرّك الهاتف $direction '
        '${difference.abs().toStringAsFixed(1)}°',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.teal.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ============================================================
  // Status
  // ============================================================

  Widget _buildStatusText(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // Permission screen
  // ============================================================


}
