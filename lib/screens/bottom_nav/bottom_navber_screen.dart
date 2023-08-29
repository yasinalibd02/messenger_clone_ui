import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../controller/bottom_nav/bottom_navber.dart';
import '../../core/dimentions/dimenstions.dart';
import '../../main.dart';
import '../../utils/sizes.dart';

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
      // drawer: const DrawerWidget(),
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
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: CustomColor.primaryLightColor,
                          child: CircleAvatar(
                            backgroundColor: Color(0xffCBF1FF),
                            radius: 13,
                            child: Icon(Icons.cloud_circle),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              backgroundColor: CustomColor.primaryBGLightColor,
              elevation: 0,
              centerTitle: true,
              title: const Text("sdf"),
              // actions: [
              //   controller.selectedIndex.value == 0
              //       ? Padding(
              //           padding: EdgeInsets.symmetric(
              //               horizontal: Dimensions.widthSize * 0.8),
              //           child: badges.Badge(
              //             position: badges.BadgePosition.topEnd(top: 4, end: 6),
              //             badgeContent: Container(
              //               margin: const EdgeInsets.only(
              //                 top: 2,
              //               ),
              //               alignment: Alignment.topCenter,
              //               height: 15,
              //               child: const TitleHeading5Widget(
              //                 text: '1',
              //                 color: CustomColor.whiteColor,
              //               ),
              //             ),
              //             child: IconButton(
              //                 onPressed: () {
              //                   Get.toNamed(Routes.notificationScreen);
              //                 },
              //                 icon: CustomImageWidget(
              //                     path: Assets.icon.notification)),
              //           ),
              //         )
              //       : Container(),
              // ],
            ),
          )),
      body: Obx(
        () => controller.body[controller.selectedIndex.value],
      ),
      bottomNavigationBar: _bottomNavBarWidget(),
      // floatingActionButton: _middleButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                horizontalSpace(Dimensions.widthSize * 1.5),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     alignment: Alignment.bottomCenter,
                //     child: const Text(
                //       "Send",
                //       color: CustomColor.primaryLightColor,
                //       fontSize: 10,
                //     ),
                //   ),
                // ),
                // horizontalSpace(Dimensions.widthSize * 1.5),
                BottomItemWidget(
                    icon: Icons.access_alarm, label: "Home", index: 1),
              ]),
        ));
  }

  // _middleButton(BuildContext context) {
  //   return Container(
  //     height: Dimensions.heightSize * 4,
  //     width: Dimensions.heightSize * 4,
  //     padding: const EdgeInsets.all(4),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(Dimensions.radius * 10),
  //         color: CustomColor.primaryLightColor.withOpacity(0.12)),
  //     child: SizedBox(
  //       height: Dimensions.heightSize * 4,
  //       width: Dimensions.heightSize * 4,
  //       child: InkWell(
  //         borderRadius: BorderRadius.circular(Dimensions.radius * 10),
  //         splashColor: CustomColor.whiteColor.withOpacity(0.5),
  //         focusColor: CustomColor.whiteColor.withOpacity(0.5),
  //         hoverColor: CustomColor.whiteColor.withOpacity(0.5),
  //         child: Align(
  //           alignment: Alignment.center,
  //           child: CircleAvatar(
  //               radius: 25,
  //               backgroundColor: CustomColor.whiteColor,
  //               child: SvgPicture.asset(
  //                 Assets.icon.send,
  //                 height: 25,
  //                 width: 25,
  //               )),
  //         ),
  //         onTap: () {
  //           // LocalStorage.saveSendMoneyRoutes(isSendMoney: true);
  //           // Get.toNamed(Routes.sendMoneyScreen);
  //         },
  //       ),
  //     ),
  //   );
  // }
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
