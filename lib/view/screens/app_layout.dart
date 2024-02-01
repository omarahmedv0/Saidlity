import 'package:flutter/material.dart';
import 'package:saidlity/core/manager/assets_manager.dart';
import 'package:saidlity/core/styles/app_colors.dart';
import 'package:saidlity/view/screens/home_screen.dart';
import 'package:saidlity/view/screens/profile_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];
  int selectedIndex = 0;
  List<String> mainOutlinedicons = [
    AssetsManager.homeOutLinedIcon,
    AssetsManager.profileOutLinedIcon,
  ];
  List<String> mainSolidicons = [
    AssetsManager.homeSolidIcon,
    AssetsManager.profileSolidIcon,
  ];
  changeCurrentPage(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 15,
              left: screenSize.width * .2,
              right: screenSize.width * .2,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    screens.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: IconButton(
                        padding: const EdgeInsets.all(15),
                        style: selectedIndex == index
                            ? const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Colors.white,
                                ),
                              )
                            : null,
                        onPressed: () {
                          changeCurrentPage(index);
                        },
                        icon: Image.asset(
                          selectedIndex == index
                              ? mainSolidicons[index]
                              : mainOutlinedicons[index],
                          width: screenSize.width * .06,
                          height: screenSize.width * .06,
                          color: selectedIndex == index
                              ? AppColors.primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: screens[selectedIndex],
      ),
    );
  }
}
