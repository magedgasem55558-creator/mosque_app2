part of 'child_details_screen.dart';

mixin _ChildDetailsScreenMixin8 on _ChildDetailsScreenState {
  Widget _buildMessagesSection({
    required String studentId,
    required String parentId,
    required String halaqaId,
  }) {
    final Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance
            .collection('messages')
            .where(
              'adminId',
              isEqualTo: _adminId,
            )
            .where(
              'parentId',
              isEqualTo: parentId,
            )
            .where(
              'studentId',
              isEqualTo: studentId,
            )
            .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _buildChatError();
        }

        if (snapshot.connectionState ==
                ConnectionState.waiting &&
            !snapshot.hasData) {
          return _buildChatLoading();
        }

        final List<DocumentSnapshot> docs =
            snapshot.data?.docs.toList() ?? [];

        docs.sort((a, b) {
          final Map<String, dynamic> dataA =
              (a.data()
                      as Map<String, dynamic>?) ??
                  {};

          final Map<String, dynamic> dataB =
              (b.data()
                      as Map<String, dynamic>?) ??
                  {};

          final Timestamp? timeA =
              dataA['createdAt']
                  as Timestamp?;

          final Timestamp? timeB =
              dataB['createdAt']
                  as Timestamp?;

          if (timeA == null &&
              timeB == null) {
            return 0;
          }

          if (timeA == null) {
            return -1;
          }

          if (timeB == null) {
            return 1;
          }

          return timeA.compareTo(timeB);
        });

        return Container(
          width: double.infinity,
          padding:
              const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.07),
                blurRadius: 18,
                offset:
                    const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              // ==================================================
              // عنوان المحادثة
              // ==================================================

              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration:
                        BoxDecoration(
                      color: primaryBlue
                          .withOpacity(0.10),
                      borderRadius:
                          BorderRadius.circular(
                              13),
                    ),
                    child: const Icon(
                      Icons
                          .admin_panel_settings_rounded,
                      color:
                          primaryBlue,
                      size: 23,
                    ),
                  ),

                  const SizedBox(
                      width: 10),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          'التواصل مع الإدارة',
                          style:
                              TextStyle(
                            color:
                                Colors.black87,
                            fontSize: 15,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: 3),
                        Text(
                          'رسائل ولي الأمر والمدير',
                          style:
                              TextStyle(
                            color:
                                Colors.black45,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (docs.isNotEmpty)
                    Container(
                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 9,
                        vertical: 6,
                      ),
                      decoration:
                          BoxDecoration(
                        color: primaryGreen
                            .withOpacity(
                                0.09),
                        borderRadius:
                            BorderRadius
                                .circular(
                                    10),
                      ),
                      child: Text(
                        '${docs.length}',
                        style:
                            const TextStyle(
                          color:
                              primaryGreen,
                          fontSize: 11,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(
                  height: 14),

              // ==================================================
              // الرسائل
              // ==================================================

              if (docs.isEmpty)
                _buildNoMessages()
              else
                Container(
                  constraints:
                      const BoxConstraints(
                    maxHeight: 360,
                  ),
                  child:
                      ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const BouncingScrollPhysics(),
                    itemCount:
                        docs.length,
                    itemBuilder:
                        (context, index) {
                      final Map<String,
                              dynamic>
                          data =
                          (docs[index]
                                  .data()
                              as Map<String,
                                  dynamic>?) ??
                              {};

                      return _buildMessageBubble(
                        data,
                      );
                    },
                  ),
                ),

              const SizedBox(
                  height: 13),

              // ==================================================
              // إرسال رسالة
              // ==================================================

              _buildSendMessageBox(
                studentId: studentId,
                parentId: parentId,
                halaqaId: halaqaId,
              ),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // Message Bubble
  // ============================================================


}
