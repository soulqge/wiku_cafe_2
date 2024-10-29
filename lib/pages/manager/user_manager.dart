import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_andi/components/admin/appbar_admin.dart';
import 'package:ukk_andi/components/manager/navbar_manager.dart';

class User {
  final String name;
  final String role;
  final int number;

  User({required this.name, required this.role, required this.number});
}

class UserManagerPage extends StatefulWidget {
  const UserManagerPage({super.key});

  @override
  _UserManagerPageState createState() => _UserManagerPageState();
}

class _UserManagerPageState extends State<UserManagerPage> {
  // Sample list of users
  List<User> users = [
    User(name: "Andi", role: "Kasir", number: 64),
    User(name: "Alek", role: "Manager", number: 23),
    User(name: "Nabil", role: "Manager", number: 32),
    User(name: "inad", role: "Admin", number: 33),
    User(name: "Aby", role: "Kasir", number: 7),
    User(name: "Githan", role: "Manager", number: 16),
    User(name: "Ata", role: "Admin", number: 23),
    User(name: "Asep", role: "Kasir", number: 8),
  ]; //data user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AppbarAdmin(title: "User"), // custom components
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              user.role,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "${user.number} x",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: 56),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.green,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text("Details"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavManager(selectedItem: 1),
    );
  }
}
