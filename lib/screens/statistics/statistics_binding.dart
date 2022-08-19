import 'package:get/instance_manager.dart';
import 'package:project_one/screens/statistics/statistic_controller.dart';

class StatisticsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StatisticController());
  }
}
