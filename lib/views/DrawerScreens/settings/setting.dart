import 'package:bab_e_ilm/provider/themeProvider.dart';

import 'package:bab_e_ilm/views/widget/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:googleapis/eventarc/v1.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context,listen: true);
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(30)),
                gradient: LinearGradient(colors: [
                  Color(0xffa029ff),
                  Color(0xff8304e5),
                  Color(0xff4d008c),
                ])),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                        Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Settings",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 20),
                    )),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(top: 25, right: 20),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )),
      body: Column(
        children: [
          SettingWidget(iconSize: 24, mainIcon:brightness == Brightness.light? Icons.dark_mode_outlined:Icons.light_mode, settingTitle: "Change Theme",onTap: (){if(brightness == Brightness.light){provider.setBrightness(Brightness.dark);}else{provider.setBrightness(Brightness.light) ;}print(brightness);},),
          SettingWidget(iconSize: 24, mainIcon: Icons.lock_reset, settingTitle: "Change Password", onTap: (){}),
          SettingWidget(iconSize: 24, mainIcon: Icons.notifications_active_outlined, settingTitle: "Notifications Settings", onTap: (){}),
          // SettingWidget(iconSize: 24, mainIcon:brightness == Brightness.light? Icons.dark_mode_outlined:Icons.light_mode, settingTitle: "Change Theme"),
        ],
      )
    );
  }
}
