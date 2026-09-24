import 'package:flutter/material.dart';
import 'home_screen.dart';

class BucketListScreen extends StatelessWidget {
  const BucketListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreenContent(
      title: 'BUCKET LIST',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContentSection(
            title: 'Things to do together',
            child: Column(
              children: const [
                _BucketListItem(label: 'Plan a weekend trip'),
                _BucketListItem(label: 'Cook a new recipe'),
                _BucketListItem(label: 'Take a picture in a new place'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const ContentSection(
            title: 'Add to the list',
            child: Text('This area is ready for your next shared goal.'),
          ),
        ],
      ),
    );
  }
}

class _BucketListItem extends StatelessWidget {
  final String label;

  const _BucketListItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: false,
      onChanged: (_) {},
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(label),
    );
  }
}
