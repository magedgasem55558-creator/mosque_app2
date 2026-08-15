part of 'qibla_screen.dart';

mixin _QiblaScreenMixin2 on _QiblaScreenState {
  void _handleHaptic(bool facingQibla) {
    if (facingQibla) {
      if (!_hasVibrated) {
        HapticFeedback.mediumImpact();
        _hasVibrated = true;
      }
    } else {
      _hasVibrated = false;
    }
  }

  // ============================================================
  // اتجاه السهم
  //
  // نريد أن يشير السهم دائمًا من مركز الشاشة إلى القبلة.
  //
  // إذا كان الهاتف متجهًا شمالًا:
  // القبلة تظهر حسب Bearing القبلة.
  //
  // إذا تحرك الهاتف:
  // نطرح Heading الهاتف من Bearing القبلة.
  // ============================================================

  double _getArrowRotation(
    double qiblaBearing,
    double heading,
  ) {
    final difference = _angleDifference(
      qiblaBearing,
      heading,
    );

    return _degreesToRadians(difference);
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2E7D32),
              Color(0xFF42A5F5),
              Color(0xFFF5F5F5),
            ],
            stops: [
              0.0,
              0.5,
              1.0,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),

              Expanded(
                child: _isLoading
                    ? _buildLoading()
                    : !_hasPermission
                        ? _buildPermissionView()
                        : _buildQiblaCompass(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // Header
  // ============================================================

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            const Expanded(
              child: Text(
                'اتجاه القبلة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // Loading
  // ============================================================

  Widget _buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Colors.teal,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              _statusMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Compass
  // ============================================================


}
