part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin12 on _ChildDetailsScreenState {
  Widget _buildParentMessageFallback(
    Map<String, dynamic> record,
  ) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            Colors.white.withOpacity(0.95),
        borderRadius:
            BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.05),
            blurRadius: 12,
          ),
        ],
      ),
      child: const Column(
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(height: 7),
          Text(
            'التواصل مع الإدارة غير متاح حالياً',
            textAlign:
                TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'لم يتم ربط الطالب بحساب ولي الأمر.',
            textAlign:
                TextAlign.center,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoMessages() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color:
            Colors.grey.shade50,
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(height: 7),
          Text(
            'لا توجد رسائل بعد',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
          SizedBox(height: 3),
          Text(
            'يمكنك إرسال رسالة للإدارة من هنا.',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatLoading() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: const Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child:
              CircularProgressIndicator(
            strokeWidth: 2,
            color: primaryBlue,
          ),
        ),
      ),
    );
  }

  Widget _buildAdminLoading() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.05),
            blurRadius: 12,
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child:
                CircularProgressIndicator(
              strokeWidth: 2,
              color:
                  primaryBlue,
            ),
          ),
          SizedBox(width: 10),
          Text(
            'جاري الاتصال بالإدارة...',
            style: TextStyle(
              fontSize: 12,
              color:
                  Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatError() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color:
            Colors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color:
              Colors.red.withOpacity(0.15),
        ),
      ),
      child: const Text(
        'تعذر تحميل المحادثة.',
        textAlign:
            TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 12,
        ),
      ),
    );
  }

  // ============================================================
  // Status
  // ============================================================


}
