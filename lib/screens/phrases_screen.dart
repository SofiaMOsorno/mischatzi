import 'package:flutter/material.dart';
import 'home_screen.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreenContent(
      title: 'PHRASES',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContentSection(
            title: 'Saved phrases',
            child: Column(
              children: const [
                _PhraseTile(text: 'You make every day better.'),
                _PhraseTile(text: 'Our favorite memories are still ahead.'),
                _PhraseTile(text: 'Together is our favorite place.'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const ContentSection(
            title: 'Add a phrase',
            child: Text('This area is ready for creating a new shared phrase.'),
          ),
        ],
      ),
    );
  }
}

class _PhraseTile extends StatelessWidget {
  final String text;

  const _PhraseTile({required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        Icons.format_quote,
        color: Theme.of(context).colorScheme.tertiary,
      ),
      title: Text(text),
    );
  }
}
