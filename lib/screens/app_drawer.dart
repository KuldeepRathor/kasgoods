import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [

            ListTile(
              title: const Text('Categories'),
              onTap: () {

              },
            ),
            ListTile(
              title: const Text('Cart'),
              onTap: () {
                //goto cart screen
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {

              },
            ),
            ListTile(
              title: const Text('Cart'),
              onTap: () {
                //goto cart screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
