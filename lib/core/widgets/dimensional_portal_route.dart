import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../theme/spatial_tokens.dart';

/// Transisi Portal Dimensi 3D: Memperbesar kartu novel menjadi bingkai portal
/// dan menginterpolasi kamera meluncur masuk (zoom-in 3D) menuju Story Room.
class DimensionalPortalRoute<T> extends PageRouteBuilder<T> {
  DimensionalPortalRoute({
    required this.builder,
    this.portalOrigin = Alignment.center,
    this.portalColor = const Color(0xFF0F766E),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionDuration: const Duration(milliseconds: 650),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnim = CurvedAnimation(
              parent: animation,
              curve: SpatialCurves.portalZoom,
              reverseCurve: Curves.easeInOutCubic,
            );

            return AnimatedBuilder(
              animation: curvedAnim,
              builder: (context, _) {
                final t = curvedAnim.value;
                // Skala zoom kamera masuk ke dalam portal
                final scale = 0.85 + (t * 0.15);
                // Efek perspektif 3D kedalaman
                final depthOffset = (1.0 - t) * 60;
                final opacity = (t * 1.5).clamp(0.0, 1.0);

                final matrix = Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translateByDouble(0.0, (1.0 - t) * 20.0, -depthOffset, 1.0)
                  ..scaleByDouble(scale, scale, 1.0, 1.0);

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Lapisan kilau pendaran portal saat terbuka
                    if (t < 0.95)
                      Opacity(
                        opacity: math.sin(t * math.pi) * 0.6,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              center: portalOrigin,
                              radius: 1.2,
                              colors: [
                                portalColor.withValues(alpha: 0.8),
                                portalColor.withValues(alpha: 0.2),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                    // Konten layar tujuan yang muncul dari dalam portal
                    Transform(
                      alignment: portalOrigin,
                      transform: matrix,
                      child: Opacity(
                        opacity: opacity,
                        child: child,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );

  final WidgetBuilder builder;
  final Alignment portalOrigin;
  final Color portalColor;
}
