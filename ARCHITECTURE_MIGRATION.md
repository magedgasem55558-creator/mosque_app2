# مسجدنا الذكي — Architecture Migration

تم نقل وتقسيم الشاشات الكبيرة إلى Feature-First modules مع الحفاظ على نفس كود الواجهة والمنطق الموجود.

## قاعدة 300 سطر
ملفات الدخول إلى الشاشات الرئيسية أصبحت أقل من 300 سطر. التفاصيل الكبيرة موجودة في part/mixin/widget files حتى لا تتضخم الشاشة الرئيسية.

## Features
- authentication
- home
- children
- quran
- adhkar
- qibla
- prayer_times
- leaderboard
- donations
- notifications
- khutbah

## Compatibility
تم الإبقاء على ملفات التصدير القديمة تحت `lib/screens`, `lib/services`, `lib/models`, و`lib/widgets` حتى تستمر الاستيرادات القديمة بدون تغيير.

## Build
شغّل:

```bash
flutter pub get
flutter analyze
flutter build apk --release
```
