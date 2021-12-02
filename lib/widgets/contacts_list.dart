import 'package:facebook_responsive_ui/models/models.dart';
import 'package:facebook_responsive_ui/widgets/user_card.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key, required this.users}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              )),
              Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final User user = users[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: UserCard(user: user));
                }),
          )
        ],
      ),
    );
  }
}
