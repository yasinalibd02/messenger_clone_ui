import 'package:flutter_template/core/custom_style/custom_style.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import '../../controller/bottom_nav/bottom_navber.dart';
import '../../core/dimentions/dimenstions.dart';
import '../../main.dart';
import '../../utils/sizes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({Key? key}) : super(key: key);

  final controller = Get.put(BTMNavController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: scaffoldKey,
      backgroundColor: CustomColor.primaryBGLightColor,
      drawer: const Drawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Obx(
            () => AppBar(
              scrolledUnderElevation: 0,
              leading: controller.selectedIndex.value == 0
                  ? InkWell(
                      onTap: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child: const Padding(
                          padding: EdgeInsets.all(13),
                          child: Icon(
                            MdiIcons.menu,
                            color: CustomColor.blackColor,
                          )),
                    )
                  : Container(),
              backgroundColor: CustomColor.primaryBGLightColor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Chats",
                style: CustomStyle.darkHeading1TextStyle,
              ),
            ),
          )),
      body: Obx(
        () => controller.body[controller.selectedIndex.value],
      ),
      bottomNavigationBar: _bottomNavBarWidget(),
    );
  }

  _bottomNavBarWidget() {
    return BottomAppBar(
        clipBehavior: Clip.antiAlias,
        surfaceTintColor: Colors.transparent,
        height: Dimensions.heightSize * 4.3,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 2,
        color: CustomColor.whiteColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.widthSize * 5,
          ),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: mainSpaceBet,
              children: [
                BottomItemWidget(
                    icon: Icons.access_alarm, label: "Home", index: 0),
                BottomItemWidget(
                    icon: Icons.access_alarm, label: "Home", index: 1),
              ]),
        ));
  }
}

class BottomItemWidget extends StatelessWidget {
  BottomItemWidget({super.key, this.icon, required this.label, this.index});
  final IconData? icon;
  final String label;
  final int? index;
  final controller = Get.put(BTMNavController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectedIndex.value = index!;
        controller.appTitle.value = controller.appTitleList[index!];
      },
      child: Obx(() => SizedBox(
            width: Dimensions.widthSize * 3,
            child: Column(
              children: [
                Icon(icon),
                // SvgPicture.asset(
                //   icon ?? "",
                //   height: 20,
                //   width: 20,
                //   color: controller.selectedIndex.value == index
                //       ? CustomColor.primaryLightColor
                //       : CustomColor.primaryLightColor.withOpacity(0.5),
                // ),
                verticalSpace(Dimensions.heightSize * 0.2),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize6 - 2,
                    color: controller.selectedIndex.value == index
                        ? CustomColor.primaryLightColor
                        : CustomColor.primaryLightColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
