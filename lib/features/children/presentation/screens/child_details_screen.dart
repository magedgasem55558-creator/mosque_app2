import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hijri_date/hijri.dart';
part 'child_details_screen__childdetailsscreenmixin1.dart';
part 'child_details_screen__childdetailsscreenmixin2.dart';
part 'child_details_screen__childdetailsscreenmixin3.dart';
part 'child_details_screen__childdetailsscreenmixin4.dart';
part 'child_details_screen__childdetailsscreenmixin5.dart';
part 'child_details_screen__childdetailsscreenmixin6.dart';
part 'child_details_screen__childdetailsscreenmixin7.dart';
part 'child_details_screen__childdetailsscreenmixin8.dart';
part 'child_details_screen__childdetailsscreenmixin9.dart';
part 'child_details_screen__childdetailsscreenmixin10.dart';
part 'child_details_screen__childdetailsscreenmixin11.dart';
part 'child_details_screen__childdetailsscreenmixin12.dart';
part 'child_details_screen__childdetailsscreenmixin13.dart';
part 'child_details_screen__childdetailsscreenmixin14.dart';
class ChildDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> child;

  const ChildDetailsScreen({
    super.key,
    required this.child,
  });

  @override
  State<ChildDetailsScreen> createState() =>
      _ChildDetailsScreenState();
}

class _ChildDetailsScreenState extends State<ChildDetailsScreen> with _ChildDetailsScreenMixin1, _ChildDetailsScreenMixin2, _ChildDetailsScreenMixin3, _ChildDetailsScreenMixin4, _ChildDetailsScreenMixin5, _ChildDetailsScreenMixin6, _ChildDetailsScreenMixin7, _ChildDetailsScreenMixin8, _ChildDetailsScreenMixin9, _ChildDetailsScreenMixin10, _ChildDetailsScreenMixin11, _ChildDetailsScreenMixin12, _ChildDetailsScreenMixin13, _ChildDetailsScreenMixin14{
  // ============================================================
  // الألوان الرسمية
  // ============================================================

  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color primaryBlue = Color(0xFF42A5F5);
  static const Color background = Color(0xFFF5F7FA);

  final TextEditingController _parentMessageController =
      TextEditingController();

  bool _sendingMessage = false;

  String? _adminId;
  bool _loadingAdmin = false;

}

