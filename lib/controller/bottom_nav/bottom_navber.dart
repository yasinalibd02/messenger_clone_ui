import 'package:get/get.dart';

import '../../screens/bottom_nav/dashboard_screen.dart';


class BTMNavController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final RxBool isRoutesIndex = false.obs;

  final List body = [
    DashboardScreen(),

  ];

  final List appTitleList = ['Home', 'More'];

  RxString appTitle = 'Touch & Send'.obs;
}
