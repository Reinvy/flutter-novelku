import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novelku/view_models/novel_view_model.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_view_model.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordController2,
    required this.authViewModel,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordController2;
  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    final novelViewModel = Provider.of<NovelViewModel>(context);
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Register',
              style: GoogleFonts.comfortaa(fontSize: 40),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                hintText: "Masukan Nama",
                labelText: "Nama",
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Silahkan masukan nama';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                hintText: "Masukan Email",
                labelText: "Email",
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Silahkan masukan email';
                }
                if (!value.contains(".") || !value.contains("@")) {
                  return 'Silahkan masukan email yang valid';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              obscureText: true,
              autocorrect: false,
              controller: passwordController,
              decoration: InputDecoration(
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                hintText: "Masukan password",
                labelText: "Password",
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Silahkan masukan password';
                } else if (value.length < 2) {
                  return 'password terlalu pendek';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              obscureText: true,
              autocorrect: false,
              controller: passwordController2,
              decoration: InputDecoration(
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                hintText: "Masukan password",
                labelText: "Repeat Password",
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Silahkan masukan password';
                } else if (value.length < 8) {
                  return 'password terlalu pendek';
                } else if (value != passwordController.text) {
                  return 'password harus sama';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  minimumSize: const Size(double.infinity, 40)),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await authViewModel.signUp(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                  novelViewModel.updateMyNovels(authViewModel.user.nama);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Berhasil Membuat Akun')),
                  );
                }
              },
              child: const Text('SignUp'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have account?',
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                    onPressed: () {
                      authViewModel.onChangeAuthView();
                    },
                    child: const Text('Sign In')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
