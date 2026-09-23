import 'package:flutter/material.dart';
import 'dart:ui';

class CustomModal extends StatelessWidget {
  final String? title;
  final Widget child;
  final VoidCallback? onClose;
  final double? width;
  final double? height;

  const CustomModal({
    Key? key,
    this.title,
    required this.child,
    this.onClose,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      /* barrierColor: Colors.black.withOpacity(0.5),*/
      child: Stack(
        children: [
          // Fondo oscuro/borroso
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          // Modal
          Center(
            child: Container(
              width: width ?? 300,
              height: height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Contenido
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (title != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              title!,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        Expanded(child: child),
                      ],
                    ),
                  ),
                  // Botón cerrar (X)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 24),
                      onPressed: () {
                        onClose?.call();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}