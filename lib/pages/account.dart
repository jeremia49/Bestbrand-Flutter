import 'package:bestbrand/main.dart';
import 'package:bestbrand/pages/bookmark.dart';
import 'package:bestbrand/pages/setting.dart';
import 'package:flutter/material.dart';

const List<String> list = [
  'Pengaturan',
  'Bookmark',
  'Keluar',
  'Reset',
];

void action(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingPage(),
        ),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookmarkPage(productList),
        ),
      );
      break;
    case 2:
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Mohon maaf, fitur ini masih dalam pengembangan')));
      break;
    case 3:
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Mohon maaf, fitur ini masih dalam pengembangan')));
      break;
    default:
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: 20,
            color: Colors.black,
          ),
          itemBuilder: (context, item) => ListTile(
            onTap: () {
              action(context, item);
            },
            title: Text(list[item]),
            trailing: IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {
                action(context, item);
              },
            ),
          ),
          itemCount: list.length,
        ))
      ],
    );
  }
}
