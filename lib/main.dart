import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/data/providers/doctorProvider.dart';
import 'package:medika/app/data/providers/treatmentProvider.dart';
import 'package:provider/provider.dart';
import 'app/routes/app_pages.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DoctorProvider>(create: (_) => DoctorProvider()),
        ChangeNotifierProvider<TreatmentProvider>(
            create: (_) => TreatmentProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ), // Your main app widget
    ),
  );
}
