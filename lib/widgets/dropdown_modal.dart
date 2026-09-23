import 'package:flutter/material.dart';

class DropdownModal extends StatelessWidget {
  final Offset position; // Posición donde aparece
  final Widget child;
  final VoidCallback? onClose;
  final double width;
  final String alignment; // 'left', 'center', 'right'

  const DropdownModal({
    Key? key,
    required this.position,
    required this.child,
    this.onClose,
    this.width = 150,
    this.alignment = 'center',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final marginSide = 16.0; // Margen de los lados
    
    // Calcular posición X según alineación
    double leftPosition;
    if (alignment == 'left') {
      // Para botones de la izquierda, alinear a la izquierda respetando margen
      leftPosition = marginSide;
    } else if (alignment == 'right') {
      // Para botones de la derecha, alinear a la derecha respetando margen
      leftPosition = screenWidth - width - marginSide;
    } else {
      // Centro (default)
      leftPosition = position.dx - (width / 2);
      // Verificar que no se salga de los márgenes
      if (leftPosition < marginSide) {
        leftPosition = marginSide;
      } else if (leftPosition + width > screenWidth - marginSide) {
        leftPosition = screenWidth - width - marginSide;
      }
    }

    return Stack(
      children: [
        // Fondo oscuro que cierra al tocar
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              onClose?.call();
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        // Modal desplegable
        Positioned(
          left: leftPosition,
          top: position.dy,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}