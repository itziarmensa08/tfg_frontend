import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';

class UserList extends StatelessWidget {

  final List<UserModel> users;

  const UserList({
    Key? key,
    required this.users
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Text(
          'usersList'.tr,
          style: title1TextStyle,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ListView.builder(
          shrinkWrap: true,
          itemCount: users.length, 
          itemBuilder: (context, index) {
            return UserCard(
              name: '${users[index].name} ${users[index].surname}',
              username: '${users[index].username}',
              email: '${users[index].email}',
              role: '${users[index].role}',
              telephone: '${users[index].telephone}',
              dateBorn: '${users[index].dateBorn}',
              icon: Icons.person,
              onTap: () {

              },
            );
          },
        ),
      ],
    );
  }
}

class UserCard extends StatefulWidget {
  final String name;
  final String username;
  final String email;
  final String role;
  final String telephone;
  final String dateBorn;
  final IconData icon;
  final VoidCallback onTap;

  const UserCard({
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.telephone,
    required this.dateBorn,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          elevation: _isHovered ? 5 : 3,
          color: _isHovered ? gray : darkGray,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    widget.icon,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: textWhiteTextStyle
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.username,
                        style: textWhiteTextStyle
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.email,
                        style: textWhiteTextStyle
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.role,
                        style: textWhiteTextStyle
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.telephone,
                        style: textWhiteTextStyle
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.dateBorn,
                        style: textWhiteTextStyle
                      ),
                    ],
                  )
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}