part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin18 on _YasserDossariQuranPageState {
  Widget _playerCircleButton(
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child:
          Container(
        width: 45,
        height: 45,
        decoration:
            BoxDecoration(
          color: Colors.white
              .withOpacity(.10),
          shape:
              BoxShape.circle,
        ),
        child:
            Icon(
          icon,
          color:
              Colors.white,
          size: 24,
        ),
      ),
    );
  }

  // ==========================================================================
  // Empty
  // ==========================================================================

  Widget _emptyState(
    IconData icon,
    String text,
  ) {
    return Center(
      child:
          Column(
        mainAxisAlignment:
            MainAxisAlignment
                .center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration:
                BoxDecoration(
              color:
                  Colors.white,
              shape:
                  BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(
                    .06,
                  ),
                  blurRadius:
                      15,
                ),
              ],
            ),
            child:
                Icon(
              icon,
              size: 38,
              color:
                  QuranTheme.green,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            text,
            style:
                const TextStyle(
              color:
                  QuranTheme.text,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================================
  // DISPOSE
  // ==========================================================================

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

}
