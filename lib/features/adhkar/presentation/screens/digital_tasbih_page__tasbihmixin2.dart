part of 'hisn_el_muslim_page.dart';

mixin _TasbihMixin2 on _DigitalTasbihPageState {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.green,
                AppColors.primary,
                AppColors.background,
              ],
              stops: [0, .48, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                _buildAppBar(),

                const SizedBox(height: 25),

                const Text(
                  'اذكر الله بقلب حاضر',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  _currentPhrase,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),

                const Spacer(),

                // ==================================================
                // الدائرة الكبيرة
                // ==================================================

                ScaleTransition(
                  scale: _animationController,
                  child: GestureDetector(
                    onTap: _increment,
                    child: Container(
                      width: 255,
                      height: 255,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient:
                            const LinearGradient(
                          colors: [
                            Color(0xFF14B8A6),
                            Color(0xFF0F766E),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: Colors.white
                              .withOpacity(.25),
                          width: 7,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(.18),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.touch_app_rounded,
                            color: Colors.white70,
                            size: 27,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '$_count',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 68,
                              fontWeight:
                                  FontWeight.w800,
                            ),
                          ),
                          const Text(
                            'اضغط للذكر',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(.13),
                    borderRadius:
                        BorderRadius.circular(30),
                  ),
                  child: Text(
                    'المجموع الكلي: $_total',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Spacer(),

                // ==================================================
                // اختيار الذكر
                // ==================================================

                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal,
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemCount: _phrases.length,
                    itemBuilder: (context, index) {
                      final phrase =
                          _phrases[index];

                      final selected =
                          phrase ==
                              _currentPhrase;

                      return Padding(
                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 5,
                        ),
                        child: ChoiceChip(
                          label: Text(
                            phrase,
                            style: TextStyle(
                              color: selected
                                  ? Colors.white
                                  : AppColors.text,
                              fontSize: 12,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          selected: selected,
                          selectedColor:
                              AppColors.primary,
                          backgroundColor:
                              Colors.white,
                          onSelected: (_) {
                            _changePhrase(
                              phrase,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 18),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      onPressed: _reset,
                      icon: const Icon(
                        Icons.refresh_rounded,
                      ),
                      label: const Text(
                        'إعادة العد',
                      ),
                      style: OutlinedButton
                          .styleFrom(
                        foregroundColor:
                            AppColors.primary,
                        backgroundColor:
                            Colors.white,
                        side: BorderSide.none,
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: _resetAll,
                      icon: const Icon(
                        Icons.restart_alt_rounded,
                      ),
                      label: const Text(
                        'تصفير الكل',
                      ),
                      style: OutlinedButton
                          .styleFrom(
                        foregroundColor:
                            Colors.red.shade700,
                        backgroundColor:
                            Colors.white,
                        side: BorderSide.none,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
