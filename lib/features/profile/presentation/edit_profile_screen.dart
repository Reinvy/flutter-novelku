import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart' show XFile;

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../auth/presentation/auth_controller.dart';
import '../../publisher/data/upload_repository.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  XFile? _avatarImage;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final user = ref.read(currentUserProvider).value;
    _nameController.text = user?.name ?? '';
    _bioController.text = user?.bio ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final file = await ref.read(uploadRepositoryProvider).pickImage();
    if (file != null && mounted) {
      setState(() => _avatarImage = file);
    }
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama tidak boleh kosong')),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      String? avatarUrl;
      if (_avatarImage != null) {
        final uploaded = await ref.read(uploadRepositoryProvider).uploadCover(_avatarImage!);
        avatarUrl = uploaded.url;
      }

      final api = ref.read(apiClientProvider);
      await api.dio.patch<Map<String, dynamic>>(
        '/users/me',
        data: {
          'name': name,
          'bio': _bioController.text.trim(),
          if (avatarUrl != null) 'coverUrl': avatarUrl,
        },
      );

      ref.invalidate(currentUserProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil diperbarui')),
        );
        context.pop();
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = ref.watch(currentUserProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: InkWell(
                onTap: _pickAvatar,
                customBorder: const CircleBorder(),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    _avatarImage != null
                        ? CircleAvatar(
                            radius: 48,
                            backgroundImage: FileImage(File(_avatarImage!.path)),
                          )
                        : AppNetworkImage(
                            url: user?.avatarUrl,
                            width: 96,
                            height: 96,
                            borderRadius: BorderRadius.circular(48),
                            errorIcon: Icons.person_rounded,
                          ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt_rounded, size: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _bioController,
              minLines: 3,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Bio',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            FilledButton(
              onPressed: _saving ? null : _save,
              child: _saving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
