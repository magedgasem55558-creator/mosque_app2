part of 'login_screen.dart';

mixin _LoginScreenMixin2 on _LoginScreenState {
void _showErrorSnackBar(String message) {
ScaffoldMessenger.of(context).clearSnackBars();

ScaffoldMessenger.of(context).showSnackBar(  
  SnackBar(  
    content: Row(  
      children: [  
        const Icon(  
          Icons.error_outline_rounded,  
          color: Colors.white,  
        ),  
        const SizedBox(width: 10),  
        Expanded(  
          child: Text(  
            message,  
            style: const TextStyle(  
              color: Colors.white,  
              fontSize: 14,  
              fontWeight: FontWeight.w500,  
            ),  
          ),  
        ),  
      ],  
    ),  
    backgroundColor: const Color(0xFFC62828),  
    behavior: SnackBarBehavior.floating,  
    margin: const EdgeInsets.all(16),  
    shape: RoundedRectangleBorder(  
      borderRadius: BorderRadius.circular(16),  
    ),  
    duration: const Duration(seconds: 4),  
  ),  
);

}

// ============================================================
// Build
// ============================================================

@override
Widget build(BuildContext context) {
return Directionality(
textDirection: TextDirection.rtl,
child: Scaffold(
backgroundColor: const Color(0xFFF7F8F6),
body: Stack(
children: [
// ====================================================
// الخلفية
// ====================================================

Positioned(  
          top: -170,  
          left: -100,  
          child: _buildBackgroundCircle(  
            size: 430,  
            color: const Color(0xFF0B5D3B),  
          ),  
        ),  

        Positioned(  
          top: -100,  
          right: -150,  
          child: _buildBackgroundCircle(  
            size: 350,  
            color: const Color(0xFF147A52),  
          ),  
        ),  

        Positioned(  
          bottom: -170,  
          right: -100,  
          child: _buildBackgroundCircle(  
            size: 400,  
            color: const Color(0xFFE8C56A),  
          ),  
        ),  

        // ====================================================  
        // المحتوى  
        // ====================================================  

        SafeArea(  
          child: Center(  
            child: SingleChildScrollView(  
              physics: const BouncingScrollPhysics(),  
              padding: const EdgeInsets.symmetric(  
                horizontal: 22,  
                vertical: 30,  
              ),  
              child: FadeTransition(  
                opacity: _fadeAnimation,  
                child: SlideTransition(  
                  position: _slideAnimation,  
                  child: Column(  
                    children: [  
                      _buildTopBrand(),  

                      const SizedBox(height: 25),  

                      _buildLoginCard(),  

                      const SizedBox(height: 24),  

                      _buildFooter(),  
                    ],  
                  ),  
                ),  
              ),  
            ),  
          ),  
        ),  
      ],  
    ),  
  ),  
);

}

// ============================================================
// دوائر الخلفية
// ============================================================

Widget _buildBackgroundCircle({
required double size,
required Color color,
}) {
return Container(
width: size,
height: size,
decoration: BoxDecoration(
shape: BoxShape.circle,
color: color.withOpacity(0.08),
),
);
}

// ============================================================
// الشعار والعنوان العلوي
// ============================================================

Widget _buildTopBrand() {
return Column(
children: [
Container(
width: 88,
height: 88,
decoration: BoxDecoration(
shape: BoxShape.circle,
color: Colors.white,
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.10),
blurRadius: 25,
offset: const Offset(0, 10),
),
],
),
child: Container(
margin: const EdgeInsets.all(7),
decoration: BoxDecoration(
shape: BoxShape.circle,
gradient: const LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
Color(0xFF0B6B43),
Color(0xFF063D29),
],
),
),
child: const Icon(
Icons.mosque_rounded,
color: Color(0xFFE8C56A),
size: 43,
),
),
),

const SizedBox(height: 16),  

    const Text(  
      'مرحباً بك',  
      style: TextStyle(  
        color: Color(0xFF123D2C),  
        fontSize: 28,  
        fontWeight: FontWeight.w900,  
        letterSpacing: -0.5,  
      ),  
    ),  

    const SizedBox(height: 5),  

    Text(  
      'سجّل دخولك للوصول إلى حسابك',  
      style: TextStyle(  
        color: Colors.grey.shade600,  
        fontSize: 14,  
        fontWeight: FontWeight.w500,  
      ),  
    ),  

    const SizedBox(height: 13),  

    Container(  
      width: 55,  
      height: 3,  
      decoration: BoxDecoration(  
        color: const Color(0xFFD1A83C),  
        borderRadius: BorderRadius.circular(10),  
      ),  
    ),  
  ],  
);

}

// ============================================================
// بطاقة تسجيل الدخول
// ============================================================


}
