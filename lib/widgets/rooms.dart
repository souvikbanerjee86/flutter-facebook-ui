import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, @required this.onlineUsers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: isDesktop
          ? EdgeInsets.symmetric(horizontal: 5.0)
          : EdgeInsets.symmetric(horizontal: 0.0),
      elevation: isDesktop ? 1.0 : null,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _createRoomButton(),
                );
              }
              User user = onlineUsers[index - 1];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }),
      ),
    );
  }
}

class _createRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Video Record Pressed");
      },
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 3.0,
            color: Colors.blueAccent[100],
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.purpleAccent,
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              'Create\nRoom',
              style: TextStyle(color: Palette.facebookBlue),
            )
          ],
        ),
      ),
    );
  }
}
