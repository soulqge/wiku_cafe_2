import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_andi/components/admin/appbar_admin.dart';
import 'package:ukk_andi/components/admin/bottom_sheet_admin.dart';
import 'package:ukk_andi/components/admin/navbar_admin.dart';

class User {
  final String name;
  final String role;

  User({required this.name, required this.role});
}

class UserAdminPage extends StatefulWidget {
  const UserAdminPage({super.key});

  @override
  _UserAdminPageState createState() => _UserAdminPageState();
}

class _UserAdminPageState extends State<UserAdminPage> {
  List<User> users = [
    User(name: "Andi", role: "Kasir"),
    User(name: "Alek", role: "Manager"),
    User(name: "Nabil", role: "Manager"),
    User(name: "Inad", role: "Admin"),
    User(name: "Aby", role: "Kasir"),
    User(name: "Githan", role: "Manager"),
    User(name: "Ata", role: "Admin"),
    User(name: "Asep", role: "Admin"),
  ]; // data user

  // Method to delete a user
  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User deleted')),
    );
  }

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
                            ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      BottomSheetAdmin(title: "Update User"), // custom components
                                ); 
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text("Update"),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                _deleteUser(index); // custom function
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text("Delete"),
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
      bottomNavigationBar: BottomNavAdmin(selectedItem: 1), // custom navbar
    );
  }
}
