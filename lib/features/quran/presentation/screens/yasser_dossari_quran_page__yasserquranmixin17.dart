part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin17 on _YasserDossariQuranPageState {
  Widget _buildAudioPlayer() {
    final index =
        _currentSurahIndex!;

    final isDownloaded =
        _downloadedQuran.any(
      (item) =>
          item.surahNumber ==
              index + 1 &&
          item.reciterId ==
              _currentReciterId,
    );

    String reciterName =
        _selectedReciter.name;

    final downloadedMatch =
        _downloadedQuran.where(
      (item) =>
          item.surahNumber ==
              index + 1 &&
          item.reciterId ==
              _currentReciterId,
    );

    if (downloadedMatch.isNotEmpty) {
      reciterName =
          downloadedMatch.first.reciterName;
    }

    return Container(
      margin:
          const EdgeInsets.fromLTRB(
        12,
        0,
        12,
        10,
      ),
      padding:
          const EdgeInsets.all(
        16,
      ),
      decoration:
          BoxDecoration(
        gradient:
            const LinearGradient(
          begin:
              Alignment.topRight,
          end:
              Alignment.bottomLeft,
          colors: [
            QuranTheme.darkGreen,
            QuranTheme.green,
          ],
        ),
        borderRadius:
            BorderRadius.circular(
          26,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(.18),
            blurRadius: 20,
            offset:
                const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration:
                    BoxDecoration(
                  color: Colors.white
                      .withOpacity(.12),
                  borderRadius:
                      BorderRadius.circular(
                    14,
                  ),
                ),
                child:
                    const Icon(
                  Icons
                      .graphic_eq_rounded,
                  color:
                      QuranTheme.gold,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child:
                    Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      'سورة ${QuranData.surahNames[index]}',
                      style:
                          const TextStyle(
                        color:
                            Colors.white,
                        fontSize: 15,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child:
                              Text(
                            reciterName,
                            maxLines: 1,
                            overflow:
                                TextOverflow
                                    .ellipsis,
                            style:
                                const TextStyle(
                              color:
                                  Colors.white70,
                              fontSize:
                                  11,
                            ),
                          ),
                        ),
                        if (isDownloaded) ...[
                          const SizedBox(
                            width: 6,
                          ),
                          const Icon(
                            Icons
                                .wifi_off_rounded,
                            color:
                                QuranTheme.gold,
                            size: 13,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed:
                    () async {
                  await _audioPlayer
                      .stop();

                  if (mounted) {
                    setState(() {
                      _currentSurahIndex =
                          null;
                      _currentReciterId =
                          null;
                      _isPlaying =
                          false;
                    });
                  }
                },
                icon:
                    const Icon(
                  Icons.close_rounded,
                  color:
                      Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SliderTheme(
            data:
                SliderTheme.of(
              context,
            ).copyWith(
              activeTrackColor:
                  QuranTheme.gold,
              inactiveTrackColor:
                  Colors.white24,
              thumbColor:
                  QuranTheme.gold,
              overlayColor:
                  QuranTheme.gold
                      .withOpacity(.15),
              trackHeight: 4,
            ),
            child: Slider(
              min: 0,
              max:
                  _duration
                              .inMilliseconds >
                          0
                      ? _duration
                          .inMilliseconds
                          .toDouble()
                      : 1,
              value:
                  _position
                      .inMilliseconds
                      .toDouble()
                      .clamp(
                        0,
                        _duration
                                    .inMilliseconds >
                                0
                            ? _duration
                                .inMilliseconds
                                .toDouble()
                            : 1,
                      ),
              onChanged:
                  (value) {
                _audioPlayer.seek(
                  Duration(
                    milliseconds:
                        value.toInt(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets
                    .symmetric(
              horizontal: 6,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Text(
                  _formatTime(
                    _position,
                  ),
                  style:
                      const TextStyle(
                    color:
                        Colors.white60,
                    fontSize: 11,
                  ),
                ),
                Text(
                  _formatTime(
                    _duration,
                  ),
                  style:
                      const TextStyle(
                    color:
                        Colors.white60,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .center,
            children: [
              _playerCircleButton(
                Icons
                    .replay_10_rounded,
                () => _seek(-10),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () async {
                  if (_isPlaying) {
                    await _audioPlayer
                        .pause();
                  } else {
                    await _audioPlayer
                        .resume();
                  }
                },
                child:
                    Container(
                  width: 62,
                  height: 62,
                  decoration:
                      BoxDecoration(
                    color:
                        QuranTheme.gold,
                    shape:
                        BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: QuranTheme
                            .gold
                            .withOpacity(
                          .30,
                        ),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child:
                      Icon(
                    _isPlaying
                        ? Icons
                            .pause_rounded
                        : Icons
                            .play_arrow_rounded,
                    color:
                        QuranTheme.darkGreen,
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              _playerCircleButton(
                Icons
                    .forward_10_rounded,
                () => _seek(10),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
