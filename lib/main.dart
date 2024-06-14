import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://xbfyanvbizrtapcbtzvt.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhiZnlhbnZiaXpydGFwY2J0enZ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgyNzMxNzEsImV4cCI6MjAzMzg0OTE3MX0.lAKhUMghUDSSZFu_wgSZjFAFFiDxkFcLTSt9KyTGkt8',
  );

  runApp(ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          home: child,
        );
      }));
}

final supabase = Supabase.instance.client;
