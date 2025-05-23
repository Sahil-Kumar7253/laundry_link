import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../Services/auth/admin_auth_service.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    bool isDarkMode = false;
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DrawerHeader(
                    child: Center(
                      child: Icon(
                        Icons.message,
                        color: Colors.grey,
                        size: 40,
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    title: const Text(
                      "H O M E",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Icon(
                      Icons.home,
                      color: isDarkMode? Colors.white : Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    title: const Text(
                      "S E T T I N G",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                          context,
                          AppRoutes.setting
                      );
                    },
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                title: const Text(
                  "L O G O U T",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.grey,
                ),
                onTap: () async {
                  final authService = AdminAuthService();
                  await authService.adminSignOut();
                  Navigator.pushReplacementNamed(context, AppRoutes.admingate);
                },
              ),
            ),
          ],
        )
    );
  }
}