part of 'login_screen.dart';

mixin _LoginScreenMixin3 on _LoginScreenState {
Widget _buildLoginCard() {
return Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB(
20,
25,
20,
22,
),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(30),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.07),
blurRadius: 30,
offset: const Offset(0, 15),
),
],
border: Border.all(
color: Colors.white,
width: 1.5,
),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// عنوان البطاقة
Row(
children: [
Container(
width: 45,
height: 45,
decoration: BoxDecoration(
color: const Color(0xFFEAF5F0),
borderRadius: BorderRadius.circular(14),
),
child: const Icon(
Icons.lock_person_rounded,
color: Color(0xFF087046),
size: 25,
),
),

const SizedBox(width: 12),  

          const Column(  
            crossAxisAlignment:  
                CrossAxisAlignment.start,  
            children: [  
              Text(  
                'تسجيل الدخول',  
                style: TextStyle(  
                  color: Color(0xFF17231E),  
                  fontSize: 20,  
                  fontWeight: FontWeight.w800,  
                ),  
              ),  
              SizedBox(height: 2),  
              Text(  
                'أدخل بيانات حسابك',  
                style: TextStyle(  
                  color: Colors.grey,  
                  fontSize: 12,  
                ),  
              ),  
            ],  
          ),  
        ],  
      ),  

      const SizedBox(height: 25),  

      // البريد الإلكتروني  
      _buildTextField(  
        controller: _emailController,  
        label: 'البريد الإلكتروني',  
        hint: 'example@email.com',  
        icon: Icons.email_outlined,  
        keyboardType:  
            TextInputType.emailAddress,  
      ),  

      const SizedBox(height: 15),  

      // كلمة المرور  
      _buildTextField(  
        controller: _passwordController,  
        label: 'كلمة المرور',  
        hint: 'أدخل كلمة المرور',  
        icon: Icons.lock_outline_rounded,  
        obscure: _obscurePassword,  
        suffixIcon: IconButton(  
          onPressed: () {  
            setState(() {  
              _obscurePassword =  
                  !_obscurePassword;  
            });  
          },  
          icon: Icon(  
            _obscurePassword  
                ? Icons.visibility_off_outlined  
                : Icons.visibility_outlined,  
            color: Colors.grey.shade500,  
          ),  
        ),  
      ),  

      const SizedBox(height: 13),  

      // تذكرني  
      Row(  
        children: [  
          SizedBox(  
            width: 25,  
            height: 25,  
            child: Checkbox(  
              value: _rememberMe,  
              onChanged: (value) {  
                setState(() {  
                  _rememberMe =  
                      value ?? false;  
                });  
              },  
              activeColor:  
                  const Color(0xFF087046),  
              checkColor: Colors.white,  
              side: BorderSide(  
                color: Colors.grey.shade400,  
              ),  
              shape:  
                  RoundedRectangleBorder(  
                borderRadius:  
                    BorderRadius.circular(6),  
              ),  
            ),  
          ),  

          const SizedBox(width: 8),  

          const Text(  
            'تذكرني',  
            style: TextStyle(  
              color: Color(0xFF555C58),  
              fontSize: 13,  
              fontWeight: FontWeight.w500,  
            ),  
          ),  
        ],  
      ),  

      const SizedBox(height: 24),  

      // زر الدخول  
      _buildLoginButton(),  
    ],  
  ),  
);

}

// ============================================================
// حقل الإدخال
// ============================================================


}
