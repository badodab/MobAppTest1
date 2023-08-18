import 'package:flutter/material.dart';
import 'package:jaehub/config/constant.dart';
import 'package:jaehub/util/bottom_nav.dart';
import 'package:transparent_image/transparent_image.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Session sess = Session();
    // sess.startClient().then((value) async => {
    // 	await sess.login('juanmiguel.galang22@gmail.com', 'qweasdzxc')
    // });

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.settings),
        title: const Text("Settings"),
      ),
      bottomNavigationBar: const BottomNav1(),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const GetTitle(str: 'Name Here'),
              getHeader('Account Settings'),
              getItems('Edit Profile'),
              getItems('Change Password'),
              getItems('Push Notifications'),
              const BrightnessModeItem(),
              getHeader('More'),
              getItemLast('Logout'),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeader(str) {
    return Builder(builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: DecoratedBox(
            decoration: BoxDecoration(
              // color: Theme.of(context).appBarTheme.foregroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 8, left: 16, right: 16),
              child: Text(
                str,
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                  fontSize: 14,
                ),
              ),
            )),
      );
    });
  }

  Widget getItems(str) {
    return Builder(builder: (context) {
      return ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        // tileColor: Theme.of(context).appBarTheme.foregroundColor,
        trailing: const Icon(Icons.chevron_right),
        title: Text(
          str,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      );
    });
  }

  Widget getItemLast(str) {
    return Builder(
      builder: (context) {
        return ListTile(
          onTap: () {},
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          // tileColor: Theme.of(context).appBarTheme.foregroundColor,
          trailing: const Icon(Icons.chevron_right),
          title: Text(
            str,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        );
      }
    );
  }
}

class GetTitle extends StatelessWidget {
  const GetTitle({super.key, required this.str});
  final String str;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // tileColor: Theme.of(context).appBarTheme.foregroundColor,
      autofocus: true,
      leading: getProfile(),
      title: Text(str),
    );
  }

  Widget getProfile() {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(999)),
        child: FadeInImage.memoryNetwork(
          fit: BoxFit.contain,
          placeholder: kTransparentImage,
          image: 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541',
        ),
      ),
    );
  }
}

class BrightnessModeItem extends StatelessWidget {
  const BrightnessModeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notif.darkModeNotifier,
      builder: (context, value, child) {
        return ListTile(
          onTap: () {
            notif.darkModeNotifier.value = !notif.darkModeNotifier.value;
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          // tileColor: Theme.of(context).appBarTheme.foregroundColor,
          trailing: Switch(
            onChanged: (bool? value) {
              notif.darkModeNotifier.value = value ?? false;
            },
            value: value,
          ),
          title: Text(
            value ? 'Dark Mode' : 'Dark Mode',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
