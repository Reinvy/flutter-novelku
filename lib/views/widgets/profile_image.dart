import 'package:flutter/material.dart';
import 'package:novelku/view_models/publish_view_model.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../view_models/auth_view_model.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final publishViewModel = Provider.of<PublishViewModel>(context);

    return Stack(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage(authViewModel.user.profileImage),
        ),
        Positioned(
          right: 1,
          bottom: 1,
          child: Center(
              child: InkWell(
                  onTap: () async {
                    await publishViewModel.uploadProfile(
                      authViewModel.user.key,
                      authViewModel.user.uId,
                      authViewModel.user.nama,
                      authViewModel.user.email,
                      authViewModel.user.coverImage,
                    );
                    authViewModel.getUserData(authViewModel.user.uId);
                  },
                  child: const CircleAvatar(
                    // radius: 30,
                    backgroundColor: colorPrimary4,
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                    ),
                  ))),
        )
      ],
    );
  }
}
