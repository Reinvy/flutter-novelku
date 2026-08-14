import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Gambar jaringan dengan cache, placeholder, dan fallback.
class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.errorIcon = Icons.menu_book_rounded,
  });

  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final IconData errorIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final placeholder = Container(
      color: theme.colorScheme.surfaceContainerHighest,
      child: Icon(errorIcon, color: theme.colorScheme.onSurfaceVariant, size: 32),
    );

    Widget image;
    final u = url;
    if (u == null || u.isEmpty) {
      image = placeholder;
    } else {
      image = CachedNetworkImage(
        imageUrl: u,
        fit: fit,
        width: width,
        height: height,
        placeholder: (_, __) => placeholder,
        errorWidget: (_, __, ___) => placeholder,
      );
    }

    if (borderRadius == null) return image;
    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}
