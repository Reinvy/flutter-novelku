import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart' show XFile;

import '../../../core/network/api_exception.dart';
import '../../../core/theme/app_spacing.dart';
import '../data/publisher_repository.dart';
import '../data/upload_repository.dart';
import '../presentation/publisher_controller.dart';

class PostNovelScreen extends ConsumerStatefulWidget {
  const PostNovelScreen({super.key});

  @override
  ConsumerState<PostNovelScreen> createState() => _PostNovelScreenState();
}

class _PostNovelScreenState extends ConsumerState<PostNovelScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _synopsisController = TextEditingController();
  String _status = 'ONGOING';
  XFile? _pickedImage;
  String? _coverUrl;
  bool _submitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _synopsisController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final file = await ref.read(uploadRepositoryProvider).pickImage();
    if (file != null && mounted) {
      setState(() => _pickedImage = file);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _submitting = true);
    try {
      String? coverUrl = _coverUrl;

      if (_pickedImage != null) {
        final uploaded = await ref.read(uploadRepositoryProvider).uploadCover(_pickedImage!);
        coverUrl = uploaded.url;
      }

      await ref.read(publisherRepositoryProvider).createNovel(
            title: _titleController.text.trim(),
            synopsis: _synopsisController.text.trim(),
            status: _status,
            coverUrl: coverUrl,
          );
      ref.invalidate(myNovelsControllerProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Novel berhasil dibuat')),
        );
        context.pop();
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Terjadi kesalahan. Coba lagi.')),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Novel')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: InkWell(
                  onTap: _pickImage,
                  borderRadius: BorderRadius.circular(12),
                  child: _pickedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(_pickedImage!.path),
                            width: 160,
                            height: 240,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          width: 160,
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: theme.colorScheme.outline,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 40,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Text(
                                'Pilih cover',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Judul novel',
                  prefixIcon: Icon(Icons.title_rounded),
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Judul wajib diisi' : null,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _synopsisController,
                minLines: 4,
                maxLines: 8,
                decoration: const InputDecoration(
                  labelText: 'Sinopsis',
                  alignLabelWithHint: true,
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Sinopsis wajib diisi' : null,
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: _status,
                decoration: const InputDecoration(labelText: 'Status'),
                items: const [
                  DropdownMenuItem(value: 'ONGOING', child: Text('Berlanjut')),
                  DropdownMenuItem(value: 'COMPLETED', child: Text('Selesai')),
                ],
                onChanged: (v) => setState(() => _status = v ?? 'ONGOING'),
              ),
              const SizedBox(height: AppSpacing.lg),
              FilledButton(
                onPressed: _submitting ? null : _submit,
                child: _submitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Terbitkan Novel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
