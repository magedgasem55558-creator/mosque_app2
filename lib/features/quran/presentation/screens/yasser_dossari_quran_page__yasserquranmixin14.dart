part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin14 on _YasserDossariQuranPageState {
  Widget _buildQuranPage() {
    return Container(
      margin:
          const EdgeInsets.fromLTRB(
        16,
        5,
        16,
        8,
      ),
      decoration:
          BoxDecoration(
        color:
            const Color(0xFFFFFCF2),
        borderRadius:
            BorderRadius.circular(
          18,
        ),
        border: Border.all(
          color:
              QuranTheme.gold
                  .withOpacity(.45),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(.08),
            blurRadius: 18,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),
      child:
          SingleChildScrollView(
        padding:
            const EdgeInsets.fromLTRB(
          20,
          25,
          20,
          25,
        ),
        child: Column(
          children: [
            Container(
              width:
                  double.infinity,
              height: 3,
              decoration:
                  BoxDecoration(
                gradient:
                    const LinearGradient(
                  colors: [
                    Colors.transparent,
                    QuranTheme.gold,
                    Colors.transparent,
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(
                  5,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'الصفحة $_currentPage',
              style:
                  const TextStyle(
                color:
                    QuranTheme.gold,
                fontSize: 13,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            ..._pageAyahs.map(
              (ayah) {
                final text =
                    ayah['text']
                            ?.toString() ??
                        '';

                final number =
                    ayah['numberInSurah']
                            ?.toString() ??
                        '';

                return Padding(
                  padding:
                      const EdgeInsets
                          .only(
                    bottom: 14,
                  ),
                  child:
                      RichText(
                    textAlign:
                        TextAlign.center,
                    text:
                        TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '$text ',
                          style:
                              const TextStyle(
                            color:
                                Color(
                              0xFF20231F,
                            ),
                            fontSize:
                                21,
                            height:
                                2.05,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                        WidgetSpan(
                          alignment:
                              PlaceholderAlignment
                                  .middle,
                          child:
                              Container(
                            margin:
                                const EdgeInsets
                                    .symmetric(
                              horizontal:
                                  3,
                            ),
                            width: 27,
                            height: 27,
                            decoration:
                                BoxDecoration(
                              shape:
                                  BoxShape.circle,
                              border:
                                  Border.all(
                                color:
                                    QuranTheme.gold,
                              ),
                            ),
                            child:
                                Center(
                              child:
                                  Text(
                                number,
                                style:
                                    const TextStyle(
                                  color:
                                      QuranTheme.green,
                                  fontSize:
                                      9,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width:
                  double.infinity,
              height: 3,
              decoration:
                  const BoxDecoration(
                gradient:
                    LinearGradient(
                  colors: [
                    Colors.transparent,
                    QuranTheme.gold,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
