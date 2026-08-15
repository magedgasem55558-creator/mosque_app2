part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin10 on _ChildDetailsScreenState {
  Widget _buildSendMessageBox({
    required String studentId,
    required String parentId,
    required String halaqaId,
  }) {
    return Container(
      padding:
          const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius:
            BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller:
                  _parentMessageController,

              maxLines: 3,
              minLines: 1,

              textDirection:
                  TextDirection.rtl,
              textAlign:
                  TextAlign.right,

              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight:
                    FontWeight.w500,
                height: 1.5,
              ),

              decoration:
                  InputDecoration(
                hintText:
                    'اكتب رسالة للإدارة...',
                hintStyle:
                    TextStyle(
                  color:
                      Colors.grey.shade400,
                  fontSize: 12,
                ),
                border:
                    InputBorder.none,
                enabledBorder:
                    InputBorder.none,
                focusedBorder:
                    InputBorder.none,
              ),
            ),
          ),

          const SizedBox(width: 8),

          Container(
            width: 45,
            height: 45,
            decoration:
                const BoxDecoration(
              gradient:
                  LinearGradient(
                colors: [
                  primaryGreen,
                  primaryBlue,
                ],
              ),
              shape:
                  BoxShape.circle,
            ),
            child: IconButton(
              onPressed:
                  _sendingMessage
                      ? null
                      : () {
                          _sendMessage(
                            studentId:
                                studentId,
                            parentId:
                                parentId,
                            halaqaId:
                                halaqaId,
                          );
                        },
              icon:
                  _sendingMessage
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child:
                              CircularProgressIndicator(
                            strokeWidth:
                                2,
                            color:
                                Colors.white,
                          ),
                        )
                      : const Icon(
                          Icons
                              .send_rounded,
                          color:
                              Colors.white,
                          size: 20,
                        ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // إرسال ولي الأمر -> المدير
  // ============================================================


}
