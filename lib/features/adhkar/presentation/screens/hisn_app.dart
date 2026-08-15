part of 'hisn_el_muslim_page.dart';

class HisnAlMuslimApp extends StatelessWidget {
  const HisnAlMuslimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'حصن المسلم',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
      ),
      home: const HisnElMuslimPage(),
    );
  }
}
