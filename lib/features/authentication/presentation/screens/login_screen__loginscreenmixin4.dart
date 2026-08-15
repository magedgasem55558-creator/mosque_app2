part of 'login_screen.dart';

mixin _LoginScreenMixin4 on _LoginScreenState {
Widget _buildTextField({
required TextEditingController controller,
required String label,
required String hint,
required IconData icon,
bool obscure = false,
TextInputType keyboardType =
TextInputType.text,
Widget? suffixIcon,
}) {
return TextField(
controller: controller,
obscureText: obscure,
keyboardType: keyboardType,
textDirection: TextDirection.rtl,
style: const TextStyle(
color: Color(0xFF202623),
fontSize: 15,
fontWeight: FontWeight.w600,
),
cursorColor: const Color(0xFF087046),
decoration: InputDecoration(
labelText: label,
hintText: hint,
floatingLabelBehavior:
FloatingLabelBehavior.auto,

labelStyle: TextStyle(  
      color: Colors.grey.shade600,  
      fontSize: 13,  
    ),  

    hintStyle: TextStyle(  
      color: Colors.grey.shade400,  
      fontSize: 13,  
    ),  

    prefixIcon: Container(  
      margin: const EdgeInsets.all(9),  
      decoration: BoxDecoration(  
        color: const Color(0xFFEAF5F0),  
        borderRadius:  
            BorderRadius.circular(11),  
      ),  
      child: Icon(  
        icon,  
        color: const Color(0xFF087046),  
        size: 21,  
      ),  
    ),  

    suffixIcon: suffixIcon,  

    filled: true,  
    fillColor: const Color(0xFFF8FAF9),  

    contentPadding:  
        const EdgeInsets.symmetric(  
      horizontal: 15,  
      vertical: 17,  
    ),  

    border: OutlineInputBorder(  
      borderRadius:  
          BorderRadius.circular(17),  
      borderSide: BorderSide(  
        color: Colors.grey.shade200,  
      ),  
    ),  

    enabledBorder:  
        OutlineInputBorder(  
      borderRadius:  
          BorderRadius.circular(17),  
      borderSide: BorderSide(  
        color: Colors.grey.shade200,  
      ),  
    ),  

    focusedBorder:  
        OutlineInputBorder(  
      borderRadius:  
          BorderRadius.circular(17),  
      borderSide: const BorderSide(  
        color: Color(0xFF087046),  
        width: 1.7,  
      ),  
    ),  
  ),  
);

}

// ============================================================
// زر تسجيل الدخول
// ============================================================

Widget _buildLoginButton() {
return SizedBox(
width: double.infinity,
height: 56,
child: DecoratedBox(
decoration: BoxDecoration(
gradient: const LinearGradient(
begin: Alignment.centerRight,
end: Alignment.centerLeft,
colors: [
Color(0xFF087046),
Color(0xFF06482F),
],
),
borderRadius:
BorderRadius.circular(17),
boxShadow: [
BoxShadow(
color:
const Color(0xFF087046)
.withOpacity(0.25),
blurRadius: 15,
offset: const Offset(0, 7),
),
],
),
child: ElevatedButton(
onPressed:
_isLoading ? null : _login,
style: ElevatedButton.styleFrom(
backgroundColor:
Colors.transparent,
disabledBackgroundColor:
Colors.transparent,
shadowColor: Colors.transparent,
elevation: 0,
shape:
RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(17),
),
),
child: AnimatedSwitcher(
duration:
const Duration(milliseconds: 250),
child: _isLoading
? const SizedBox(
key: ValueKey('loading'),
width: 25,
height: 25,
child:
CircularProgressIndicator(
strokeWidth: 2.5,
color: Colors.white,
),
)
: const Row(
key: ValueKey('login'),
mainAxisAlignment:
MainAxisAlignment.center,
children: [
Text(
'دخول إلى الحساب',
style: TextStyle(
color: Colors.white,
fontSize: 16,
fontWeight:
FontWeight.w800,
),
),
SizedBox(width: 10),
Icon(
Icons.arrow_back_rounded,
color: Colors.white,
size: 21,
),
],
),
),
),
),
);
}

// ============================================================
// أسفل الصفحة
// ============================================================


}
