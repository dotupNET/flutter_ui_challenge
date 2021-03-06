import 'package:flutter/material.dart';
import 'package:ui_challenges/io/data/menu_data.dart';
import 'package:ui_challenges/menu/menu_item.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class MenuScreen extends StatefulWidget {

  MenuScreen(this.tap);

  Function(int) tap;

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final data = MenuData().menu;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: <Widget>[
            _AvatarListTile(),
            SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final model = data[index];
                return GestureDetector(
                    onTap: () => widget.tap(index),
                    child: model.path.isEmpty ? _Divider() : ItemMenu(path: model.path, name: model.name));
              },
            )),
          ],
        ),
      )));
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 15, bottom: 15),
        child: Container(
          height: 2.0,
          color: Colors.grey[300],
        ),
      );
}

class _AvatarListTile extends StatelessWidget {
  const _AvatarListTile();

  @override
  Widget build(BuildContext context) => ListTile(
      leading:
          CircleAvatar(radius: 25.0, child: Image.asset('assets/images/avatars/user_image.png', fit: BoxFit.contain)),
      title: Text('Roman Bova', style: MyTextTheme().getGrey().copyWith(fontSize: 24, fontWeight: FontWeight.w600)),
      subtitle: Text('UI/UX Designer',
          style: MyTextTheme().getSmallBlue().copyWith(fontSize: 20, fontWeight: FontWeight.w400)));
}
