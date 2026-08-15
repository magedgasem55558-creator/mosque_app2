part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin1 on _ChildDetailsScreenState {
  @override
  void initState() {
    super.initState();

    _loadAdmin();
  }

  @override
  void dispose() {
    _parentMessageController.dispose();
    super.dispose();
  }

  // ============================================================
  // جلب المدير
  // ============================================================

  Future<void> _loadAdmin() async {
    if (_loadingAdmin) return;

    setState(() {
      _loadingAdmin = true;
    });

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where(
            'role',
            isEqualTo: 'admin',
          )
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        _adminId = snapshot.docs.first.id;
      }
    } catch (e) {
      debugPrint('Load Admin Error: $e');
    } finally {
      if (mounted) {
        setState(() {
          _loadingAdmin = false;
        });
      }
    }
  }

  // ============================================================
  // Build
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final String studentId =
        widget.child['id']?.toString() ?? '';

    final String studentName =
        widget.child['name']?.toString().trim().isNotEmpty == true
            ? widget.child['name'].toString().trim()
            : 'الطالب';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: background,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryGreen,
                primaryBlue,
                background,
              ],
              stops: [
                0.0,
                0.30,
                0.65,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                _buildTopHeader(
                  context,
                  studentName,
                ),

                const SizedBox(height: 12),

                _buildStudentCard(
                  studentName,
                ),

                const SizedBox(height: 16),

                _buildTabs(),

                const SizedBox(height: 8),

                Expanded(
                  child: studentId.isEmpty
                      ? _buildErrorState()
                      : TabBarView(
                          children: [
                            _buildDailyReport(studentId),
                            _buildMonthlyReport(studentId),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // Header
  // ============================================================

  Widget _buildTopHeader(
    BuildContext context,
    String studentName,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        0,
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.white.withOpacity(0.25),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  'متابعة الطالب',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  studentName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.25),
              ),
            ),
            child: const Icon(
              Icons.admin_panel_settings_rounded,
              color: Colors.white,
              size: 23,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Student Card
  // ============================================================


}
