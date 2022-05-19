import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_view_model.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Container(
      color: Colors.grey,
      child: Image.network(
        authViewModel.user.coverImage,
        width: double.infinity,
        height: 240,
        fit: BoxFit.cover,
      ),
    );
  }
}
