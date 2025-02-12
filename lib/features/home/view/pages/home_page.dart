import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/core/route/routes.dart';
import 'package:portfolio/core/utils/url_launcher.dart';
import 'package:portfolio/features/common/service/auth_service.dart';
import 'package:portfolio/features/home/view/pages/about_me_page.dart';
import 'package:portfolio/features/home/view/pages/projects_page.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

import '../../../../core/consts/images.dart';
import '../../../../core/consts/strings.dart';
import '../../../../core/utils/screen_size.dart'; // Ensure the extension is imported
import '../widgets/reusable_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> scaffoldKey =
        GlobalKey<ScaffoldState>(); // Initialize the key

    return Scaffold(
      key: scaffoldKey, // Assign the key to the Scaffold
      appBar: AppBar(
        toolbarHeight: 80,
        leading: context.isMobile
            ? IconButton(
                onPressed: () {
                  if (scaffoldKey.currentState != null) {
                    scaffoldKey.currentState!.openDrawer(); // Open the drawer
                  }
                },
                icon: Icon(LucideIcons.menu),
              )
            : Container(),
        title: Text(name),
        actions: [
          context.isDesktop || context.isTab
              ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ReusableButton(
                    label: "Youtube",
                    icon: LucideIcons.youtube,
                    onPressed: () {
                      UrlLauncher.launch(url: youtube);
                    },
                  ),
                  Gap(10),
                  ReusableButton(
                    label: "Github",
                    icon: LucideIcons.github,
                    onPressed: () {
                      UrlLauncher.launch(url: github);
                    },
                  ),
                  Gap(10),
                  ReusableButton(
                    label: "LinkedIn",
                    icon: LucideIcons.linkedin,
                    onPressed: () {
                      UrlLauncher.launch(url: linkedin);
                    },
                  ),
                  Gap(20),
                ])
              : SizedBox.shrink()
        ],
      ),
      body: DynMouseScroll(
        builder: (p0, p1, p2) {
          return ListView(
            controller: p1,
            physics: p2,
            children: [
              Gap(100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: context.isMobile
                    ? Column(
                  children: [
                    buildHeader(context),
                    const Gap(50),
                    buildImage(context),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: buildHeader(context),
                    ),
                    const Gap(20),
                    Expanded(
                      flex: 1,
                      child: buildImage(context),
                    ),
                  ],
                ),
              ),
              Divider(height: 0),
              Gap(20),
              AboutMePage(),
              Gap(20),
              Divider(height: 0),
              Gap(20),
              ProjectsPage(),
            ],
          );
        },
      ),
      drawer: buildDrawer(), // Add the drawer
    );
  }

  Widget buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        context.isDesktop ? Gap(100) : SizedBox.shrink(),
        Text(
          title,
          style: TextStyle(
            fontSize: context.isMobile ? 30 : 50, // Using extension
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(10),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: context.isMobile ? 18 : 25, // Using extension
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        Gap(20),
        ReusableButton(
                label: "Get Resume",
                onPressed: () {
                  UrlLauncher.launch(url: resume);
                }),
      ],
    );
  }

  Widget buildImage(BuildContext context) {
    return Container(
      height: context.isDesktop ? 700 : null,
      alignment: Alignment.bottomCenter, // Align image at the bottom
      child: Image.asset(
        myImage,
        fit: BoxFit.fitHeight, // Ensure the image scales properly
      ),
    );
  }

  Widget buildDrawer() {
    final authService = Get.find<AuthService>();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, size: 80),
              Text(name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(emailAddress,
                  style: TextStyle(fontSize: 14))
            ],
          )),
          ListTile(
            leading: Icon(LucideIcons.youtube),
            title: Text("Youtube"),
            subtitle: Text("Visit my youtube channel"),
            onTap: () {
              UrlLauncher.launch(url: youtube);
            },
          ),
          ListTile(
            leading: Icon(LucideIcons.github),
            title: Text("Github"),
            subtitle: Text("Visit my Github account"),
            onTap: () {
              UrlLauncher.launch(url: github);
            },
          ),
          ListTile(
            leading: Icon(LucideIcons.linkedin),
            title: Text("LinkedIn"),
            subtitle: Text("Visit my LinkedIn account"),
            onTap: () {
              UrlLauncher.launch(url: linkedin);
            },
          ),
          Obx(() {
            return !authService.isLoggedIn ? ListTile(
              leading: Icon(LucideIcons.logIn),
              title: Text("Log in"),
              subtitle: Text("Log in to your account"),
              onTap: () {
                Get.toNamed(Routes.loginPage);
              },
            ) : ListTile(
              title: Text("Logout"),
              subtitle: Text("Logout from your account"),
              leading: Icon(LucideIcons.logOut),
              onTap: () {
                authService.signOut();
              },
            );
          }),
        ],
      ),
    );
  }
}
