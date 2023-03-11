import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ApplicationController extends GetxController {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );
}
