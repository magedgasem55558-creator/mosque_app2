part of 'qibla_screen.dart';

mixin _QiblaScreenMixin3 on _QiblaScreenState {
  Widget _buildQiblaCompass() {
    return StreamBuilder<QiblahDirection>(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _buildStatusText(
            'تعذر قراءة حساس البوصلة.\n'
            'تأكد من أن جهازك يحتوي على Magnetometer.',
          );
        }

        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.teal,
            ),
          );
        }

        final data = snapshot.data;

        if (data == null) {
          return _buildStatusText(
            'لم تصل قراءة من حساس البوصلة.',
          );
        }

        if (_qiblaBearing == null) {
          return _buildStatusText(
            'لم يتم حساب اتجاه القبلة بعد.',
          );
        }

        // --------------------------------------------------------
        // قراءة اتجاه الهاتف من الحساس
        //
        // flutter_qiblah يوفر اتجاه الجهاز.
        // لا نستخدم qiblahDirection.qiblah هنا.
        // --------------------------------------------------------

        final rawHeading = _normalizeAngle(
          data.direction,
        );

        final heading = _smoothHeading(rawHeading);

        _heading = heading;

        // --------------------------------------------------------
        // حساب الفرق الحقيقي بين الهاتف والقبلة
        // --------------------------------------------------------

        final difference = _angleDifference(
          _qiblaBearing!,
          heading,
        );

        final absoluteDifference =
            difference.abs();

        // أقل من 5 درجات = مواجهة القبلة
        final isFacingQibla =
            absoluteDifference <= 5.0;

        _handleHaptic(isFacingQibla);

        final activeColor = isFacingQibla
            ? Colors.green
            : Colors.teal;

        // --------------------------------------------------------
        // دوران السهم
        // --------------------------------------------------------

        final arrowRotation =
            _getArrowRotation(
          _qiblaBearing!,
          heading,
        );

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),

              _buildCalibrationWarning(),

              const SizedBox(height: 18),

              _buildQiblaStatus(
                isFacingQibla,
                activeColor,
              ),

              const SizedBox(height: 28),

              _buildCompass(
                arrowRotation,
                activeColor,
              ),

              const SizedBox(height: 28),

              _buildDataCard(
                difference,
                absoluteDifference,
                activeColor,
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // Calibration warning
  // ============================================================

  Widget _buildCalibrationWarning() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.amber.shade300,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.explore_rounded,
            color: Colors.amber.shade900,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'للدقة الأفضل، أبعد الهاتف عن المعادن '
              'والسيارات والأجهزة الإلكترونية. '
              'وإذا كانت البوصلة غير مستقرة حرّك الهاتف '
              'بحركة رقم 8 لمعايرة الحساس.',
              style: TextStyle(
                color: Colors.amber.shade900,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Qibla status
  // ============================================================


}
