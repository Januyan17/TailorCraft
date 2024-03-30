// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      BigUserCard(
                        backgroundColor: Colors.deepPurpleAccent,
                        userName: "Uzumaki Naruto",
                        userProfilePic: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyXXkiqJLhMZE69a4dTnH4Qd6GyzyFmqcmHu8EAhx8DQ&s"),
                        cardActionWidget: SettingsItem(
                          icons: Icons.edit,
                          iconStyle: IconStyle(
                            withBackground: true,
                            borderRadius: 50,
                            backgroundColor: Colors.yellow[600],
                          ),
                          title: "Modify",
                          subtitle: "Tap to change your data",
                          onTap: () {
                            print("OK");
                          },
                        ),
                      ),
                      SettingsGroup(
                        items: [
                          SettingsItem(
                            backgroundColor: Colors.amber,
                            onTap: () {},
                            icons: CupertinoIcons.pencil_outline,
                            iconStyle: IconStyle(),
                            title: 'Appearance',
                            subtitle: "Make Tailor Craft App yours",
                          ),
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.dark_mode_rounded,
                            iconStyle: IconStyle(
                              iconsColor: Colors.white,
                              withBackground: true,
                              backgroundColor: Colors.red,
                            ),
                            title: 'Dark mode',
                            subtitle: "Automatic",
                            trailing: Switch.adaptive(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      SettingsGroup(
                        items: [
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.info_rounded,
                            iconStyle: IconStyle(
                              backgroundColor: Colors.purple,
                            ),
                            title: 'About',
                            subtitle: "Learn more about Tailor Crafts'App",
                          ),
                        ],
                      ),
                      // You can add a settings title
                      SettingsGroup(
                        settingsGroupTitle: "Account",
                        items: [
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.exit_to_app_rounded,
                            title: "Sign Out",
                          ),
                          SettingsItem(
                            onTap: () {},
                            icons: CupertinoIcons.delete_solid,
                            title: "Delete account",
                            titleStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
