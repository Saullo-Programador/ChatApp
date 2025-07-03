import 'package:flutter/material.dart';
import 'package:flutter_app/service/auth/auth_service.dart';
import 'package:flutter_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  
  void logout() async {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 10.0, left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "User Name", // Replace with actual user name
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Home List
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ListTile(
                  title: Text(
                    "H O M E", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface, 
                      fontWeight: FontWeight.bold
                    )
                  ),
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // Settings list
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ListTile(
                  title: Text(
                    "S E T T I N G S",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface, 
                      fontWeight: FontWeight.bold
                    )
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage()
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Logout list
          Padding(
            padding: const EdgeInsets.only(left: 24.0, bottom: 25.0),
            child: ListTile(
              title: Text(
                "L O G O U T",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface, 
                  fontWeight: FontWeight.bold
                )
              ),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.onSurface
              ),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
