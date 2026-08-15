part of 'login_screen.dart';

mixin _LoginScreenMixin5 on _LoginScreenState {
Widget _buildFooter() {
return Column(
children: [
Row(
mainAxisAlignment:
MainAxisAlignment.center,
children: [
Container(
width: 35,
height: 1,
color: Colors.grey.shade300,
),
const SizedBox(width: 10),
Text(
'أهلاً وسهلاً بك',
style: TextStyle(
color: Colors.grey.shade500,
fontSize: 12,
fontWeight: FontWeight.w500,
),
),
const SizedBox(width: 10),
Container(
width: 35,
height: 1,
color: Colors.grey.shade300,
),
],
),

const SizedBox(height: 12),  

    Row(  
      mainAxisAlignment:  
          MainAxisAlignment.center,  
      children: [  
        Icon(  
          Icons.security_rounded,  
          size: 15,  
          color: Colors.grey.shade500,  
        ),  
        const SizedBox(width: 5),  
        Text(  
          'بياناتك محمية وآمنة',  
          style: TextStyle(  
            color: Colors.grey.shade500,  
            fontSize: 11,  
          ),  
        ),  
      ],  
    ),  
  ],  
);

}

}
