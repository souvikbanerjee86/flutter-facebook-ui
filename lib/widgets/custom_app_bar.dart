import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/custom_tabbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circle_button.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    Key key,
    @required this.currentUser,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                letterSpacing: -1.2,
                color: Palette.facebookBlue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 600,
            child: CustomTabBar(
                icons: icons,
                onTap: onTap,
                selectedIndex: selectedIndex,
                isBottomIndicator: true),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  onPressed: () {
                    print("Search");
                  },
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30.0,
                  onPressed: () {
                    print("Messanger");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
