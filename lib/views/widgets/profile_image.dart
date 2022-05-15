import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 80,
      backgroundColor: Colors.black,
      backgroundImage: AssetImage('assets/images/logo.png'),
    );
  }
}
