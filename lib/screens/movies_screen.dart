import 'package:flutter/material.dart';
import 'home_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreenContent(
      title: 'MOVIES',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContentSection(
            title: 'Movie night',
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.45,
              children: const [
                _MovieCard(title: 'To watch'),
                _MovieCard(title: 'Watching'),
                _MovieCard(title: 'Favorites'),
                _MovieCard(title: 'Watched'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const ContentSection(
            title: 'Add a movie',
            child: Text('This area is ready for your next movie-night choice.'),
          ),
        ],
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final String title;

  const _MovieCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: Text(title, textAlign: TextAlign.center)),
    );
  }
}
