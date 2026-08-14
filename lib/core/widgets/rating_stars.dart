import 'package:flutter/material.dart';

/// Deretan bintang rating (interaktif atau statis).
class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.onChanged,
    this.size = 22,
  });

  /// Nilai 0..5. Bisa desimal untuk tampilan statis.
  final double rating;
  final ValueChanged<int>? onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1;
        final icon = rating >= starValue
            ? Icons.star_rounded
            : (rating > index ? Icons.star_half_rounded : Icons.star_outline_rounded);
        return InkWell(
          onTap: onChanged == null ? null : () => onChanged!(starValue),
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Icon(icon, size: size, color: onChanged == null ? color : null),
          ),
        );
      }),
    );
  }
}
