import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paygo_sdk_example/commons/widgets/style/application_style.dart';
import 'package:paygo_sdk_example/infrastructure/routes/pages.dart';
import 'package:paygo_sdk_example/presentation/application/application_bindings.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationStyle.applicationThemeData,
      getPages: Pages.data,
      initialRoute: Pages.initialRoute,
      initialBinding: ApplicationBinding(),
    );
  }
}
