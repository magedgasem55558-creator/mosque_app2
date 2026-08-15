part of 'login_screen.dart';

mixin _LoginScreenMixin1 on _LoginScreenState {
@override
void initState() {
super.initState();

_animationController = AnimationController(  
  vsync: this,  
  duration: const Duration(milliseconds: 900),  
);  

_fadeAnimation = CurvedAnimation(  
  parent: _animationController,  
  curve: Curves.easeOut,  
);  

_slideAnimation = Tween<Offset>(  
  begin: const Offset(0, 0.12),  
  end: Offset.zero,  
).animate(  
  CurvedAnimation(  
    parent: _animationController,  
    curve: Curves.easeOutCubic,  
  ),  
);  

_animationController.forward();  

_loadSavedCredentials();

}

@override
void dispose() {
_animationController.dispose();
_emailController.dispose();
_passwordController.dispose();
super.dispose();
}

// ============================================================
// تحميل البريد المحفوظ
// ============================================================

Future<void> _loadSavedCredentials() async {
final prefs = await SharedPreferences.getInstance();

if (!mounted) return;  

setState(() {  
  _emailController.text =  
      prefs.getString('saved_email') ?? '';  
  _rememberMe =  
      prefs.getBool('remember_me') ?? false;  
});

}

// ============================================================
// حفظ خيار تذكرني
// ============================================================

Future<void> _handleRememberMe() async {
final prefs = await SharedPreferences.getInstance();

if (_rememberMe) {  
  await prefs.setString(  
    'saved_email',  
    _emailController.text.trim(),  
  );  

  await prefs.setBool(  
    'remember_me',  
    true,  
  );  
} else {  
  await prefs.remove('saved_email');  

  await prefs.setBool(  
    'remember_me',  
    false,  
  );  
}

}

// ============================================================
// رسائل أخطاء Firebase
// ============================================================

String _getAuthErrorMessage(
FirebaseAuthException e,
) {
switch (e.code) {
case 'user-not-found':
case 'invalid-email':
case 'invalid-credential':
return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';

case 'wrong-password':  
    return 'كلمة المرور غير صحيحة';  

  case 'user-disabled':  
    return 'تم تعطيل هذا الحساب من قبل الإدارة';  

  case 'too-many-requests':  
    return 'تم حظر المحاولات مؤقتاً، حاول لاحقاً';  

  case 'network-request-failed':  
    return 'تأكد من اتصالك بالإنترنت وأعد المحاولة';  

  case 'channel-error':  
    return 'يرجى ملء جميع الحقول المطلوبة';  

  default:  
    return 'حدث خطأ غير متوقع';  
}

}

// ============================================================
// تسجيل الدخول
// ============================================================

Future<void> _login() async {
final email = _emailController.text.trim();
final password = _passwordController.text.trim();

if (email.isEmpty && password.isEmpty) {  
  _showErrorSnackBar(  
    'يرجى إدخال البريد الإلكتروني وكلمة المرور',  
  );  
  return;  
}  

if (email.isEmpty) {  
  _showErrorSnackBar(  
    'يرجى إدخال البريد الإلكتروني',  
  );  
  return;  
}  

if (password.isEmpty) {  
  _showErrorSnackBar(  
    'يرجى إدخال كلمة المرور',  
  );  
  return;  
}  

setState(() {  
  _isLoading = true;  
});  

try {  
  await FirebaseAuth.instance  
      .signInWithEmailAndPassword(  
    email: email,  
    password: password,  
  );  

  await _handleRememberMe();  

  if (mounted) {  
    Navigator.pop(context);  
  }  
} on FirebaseAuthException catch (e) {  
  debugPrint(  
    'Login Auth Error Code: ${e.code}',  
  );  

  if (mounted) {  
    _showErrorSnackBar(  
      _getAuthErrorMessage(e),  
    );  
  }  
} catch (e) {  
  debugPrint(  
    'Login General Error: $e',  
  );  

  if (mounted) {  
    _showErrorSnackBar(  
      'حدث خطأ أثناء الاتصال بالخادم',  
    );  
  }  
} finally {  
  if (mounted) {  
    setState(() {  
      _isLoading = false;  
    });  
  }  
}

}

// ============================================================
// Snackbar
// ============================================================


}
