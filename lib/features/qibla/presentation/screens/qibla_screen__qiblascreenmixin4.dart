part of 'qibla_screen.dart';

mixin _QiblaScreenMixin4 on _QiblaScreenState {
  Widget _buildQiblaStatus(
    bool isFacingQibla,
    Color activeColor,
  ) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 250,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: activeColor.withOpacity(0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: activeColor.withOpacity(0.12),
            blurRadius: 14,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isFacingQibla
                ? Icons.check_circle_rounded
                : Icons.navigation_rounded,
            color: activeColor,
            size: 23,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              isFacingQibla
                  ? 'أنت تواجه القبلة 🕋'
                  : 'وجّه الهاتف باتجاه السهم',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Compass UI
  // ============================================================

  Widget _buildCompass(
    double arrowRotation,
    Color activeColor,
  ) {
    return SizedBox(
      width: 320,
      height: 320,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // الدائرة الخارجية
          Container(
            width: 310,
            height: 310,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: activeColor.withOpacity(0.12),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),

          // الدائرة الداخلية
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
            ),
          ),

          // علامات الاتجاهات
          _buildDirectionLabels(),

          // سهم القبلة
          AnimatedRotation(
            turns: arrowRotation / (2 * math.pi),
            duration: const Duration(
              milliseconds: 180,
            ),
            curve: Curves.easeOutCubic,
            child: SizedBox(
              width: 270,
              height: 270,
              child: Column(
                children: [
                  const SizedBox(height: 15),

                  Icon(
                    Icons.navigation_rounded,
                    size: 62,
                    color: activeColor,
                  ),

                  Expanded(
                    child: Container(
                      width: 3,
                      margin: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      decoration: BoxDecoration(
                        color:
                            activeColor.withOpacity(0.35),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // المركز
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.teal,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.teal.withOpacity(0.35),
                  blurRadius: 12,
                ),
              ],
            ),
            child: const Icon(
              Icons.mosque_rounded,
              color: Colors.teal,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Direction labels
  // ============================================================


}
