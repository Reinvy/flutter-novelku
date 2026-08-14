import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/theme/app_spacing.dart';
import '../data/publisher_repository.dart';
import '../presentation/publisher_controller.dart';

class PostChapterScreen extends ConsumerStatefulWidget {
  const PostChapterScreen({super.key, required this.novelId});

  final String novelId;

  @override
  ConsumerState<PostChapterScreen> createState() => _PostChapterScreenState();
}

class _PostChapterScreenState extends ConsumerState<PostChapterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _submitting = true);
    try {
      await ref.read(publisherRepositoryProvider).createChapter(
            novelId: widget.novelId,
            title: _titleController.text.trim(),
            content: _contentController.text.trim(),
          );
      ref.invalidate(myNovelsControllerProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bab berhasil ditambahkan')),
        );
        context.pop();
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Bab')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Judul bab',
                  prefixIcon: Icon(Icons.title_rounded),
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Judul bab wajib diisi' : null,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _contentController,
                minLines: 10,
                maxLines: 30,
                decoration: const InputDecoration(
                  labelText: 'Isi cerita',
                  alignLabelWithHint: true,
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Isi cerita wajib diisi' : null,
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
                    : const Text('Simpan Bab'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
