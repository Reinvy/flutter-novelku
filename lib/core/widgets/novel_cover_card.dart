import 'package:flutter/material.dart';

import 'app_network_image.dart';

/// Kartu cover novel 2:3 dengan shadow lembut.
class NovelCoverCard extends StatelessWidget {
  const NovelCoverCard({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.onTap,
    this.borderRadius = 12,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    Widget child = Stack(
      fit: StackFit.expand,
      children: [
        AppNetworkImage(url: imageUrl, borderRadius: radius),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radius,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.55),
              ],
              stops: const [0.55, 1.0],
            ),
          ),
        ),
      ],
    );

    if (onTap != null) {
      child = InkWell(onTap: onTap, borderRadius: radius, child: child);
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
