import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_screen__loginscreenmixin1.dart';
part 'login_screen__loginscreenmixin2.dart';
part 'login_screen__loginscreenmixin3.dart';
part 'login_screen__loginscreenmixin4.dart';
part 'login_screen__loginscreenmixin5.dart';
class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

@override
State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
with SingleTickerProviderStateMixin, _LoginScreenMixin1, _LoginScreenMixin2, _LoginScreenMixin3, _LoginScreenMixin4, _LoginScreenMixin5 {
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

bool _isLoading = false;
bool _rememberMe = false;
bool _obscurePassword = true;

late AnimationController _animationController;
late Animation<double> _fadeAnimation;
late Animation<Offset> _slideAnimation;

}

