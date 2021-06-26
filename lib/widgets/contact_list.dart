import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class ContactList extends StatelessWidget {
  final List<User> users;

  const ContactList({
    Key key,
    @required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              ),
              Icon(Icons.search, color: Colors.grey[600]),
              SizedBox(
                width: 8.0,
              ),
              Icon(Icons.more_horiz, color: Colors.grey[600])
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index];
                return UserIconAndName(user: user);
              },
            ),
          )
        ],
      ),
    );
  }
}

class UserIconAndName extends StatelessWidget {
  final User user;

  const UserIconAndName({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("pressed");
      },
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: ProfileAvatar(imageUrl: user.imageUrl),
          ),
          Flexible(
            child: Text(
              user.name,
              style: TextStyle(color: Colors.grey[600]),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
