import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Maida Saniyah Lutfi"),
            accountEmail: Text("maidasaniyah43@gmail.com"),
          ),
          DrawerListTile(
            iconData: Icons.home,
            title: "Homepage",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData : Icons.medication_outlined,
            title: "Vaksin",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData: Icons.info_outlined,
            title: "Informasi",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData: Icons.home_repair_service_outlined,
            title: "Layanan Pengguna",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData: Icons.money,
            title: "Donasi",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData: Icons.arrow_back_rounded,
            title: "Log out",
            onTilePressed: () {

            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData ;
  final String title;
  final VoidCallback onTilePressed;
  const DrawerListTile({Key? key, required this.iconData, required this.title, required this.onTilePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(title, style: TextStyle(fontSize: 16),),
    );
  }
}
