import 'package:flutter/material.dart';

@override
Widget MainDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Text('RestWell Hotel', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          title: const Text('New Reservation'),
          onTap: () {
            // Update the state of the app.
            // ...

            Navigator.pop(context);
            // Navigator.restorablePopAndPushNamed(context, '/room_selection');
          },
        ),
        ListTile(
          title: const Text('Terms & Conditions'),
          onTap: () {
            // Update the state of the app.
            // ...
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Privacy Policy'),
          onTap: () {
            // Update the state of the app.
            // ...
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Frequently Asked Questions'),
          onTap: () {
            // Update the state of the app.
            // ...
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
