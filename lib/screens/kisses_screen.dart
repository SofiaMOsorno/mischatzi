import 'package:flutter/material.dart';

import 'home_screen.dart';
import '../widgets/custom_modal.dart';

class KissesScreen extends StatefulWidget {
  const KissesScreen({Key? key}) : super(key: key);

  @override
  State<KissesScreen> createState() => _KissesScreenState();
}

class _KissesScreenState extends State<KissesScreen> {
  int _kissesCount = 0;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '0');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showConfirmationModal(bool isAdding) {
    final amount = int.tryParse(_controller.text) ?? 0;

    if (amount <= 0) {
      return;
    }

    final action = isAdding ? 'add' : 'subtract';

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return CustomModal(
          title: 'Confirm',
          onClose: () => Navigator.pop(context),
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you sure you want to $action $amount kisses?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),

                  const SizedBox(width: 15),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (isAdding) {
                          _kissesCount += amount;
                        } else {
                          _kissesCount -= amount;

                          if (_kissesCount < 0) {
                            _kissesCount = 0;
                          }
                        }

                        _controller.text = '0';
                      });

                      Navigator.pop(context);
                    },
                    child: const Text('Accept'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScreenContent(
      title: 'KISSES',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Número grande centrado
          Center(
            child: Text(
              '$_kissesCount',
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Controlador: - [input] +
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 0.0,
                      spreadRadius: 0.5,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () => _showConfirmationModal(false),
                  icon: const Icon(Icons.add),
                  iconSize: 46,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                width: 10,
              ),

              Container(
                width: 180,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 0.0,
                      spreadRadius: 0.5,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '0',
                  ),
                ),
              ),

              const SizedBox(
                width: 10,
              ),

              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 0.0,
                      spreadRadius: 0.5,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () => _showConfirmationModal(true),
                  icon: const Icon(Icons.remove_rounded),
                  iconSize: 46,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}