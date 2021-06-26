import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptions extends StatelessWidget {
  final List<List> _moreOptions = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Tracker'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Market Place'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: ListView.builder(
        itemCount: _moreOptions.length,
        itemBuilder: (context, index) {
          List option = _moreOptions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: OptionDetail(option: option),
          );
        },
      ),
    );
  }
}

class OptionDetail extends StatelessWidget {
  final List option;

  const OptionDetail({
    Key key,
    @required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('Left Side'),
      child: Row(
        children: [
          Icon(
            option[0],
            color: option[1],
            size: 32,
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              option[2],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
