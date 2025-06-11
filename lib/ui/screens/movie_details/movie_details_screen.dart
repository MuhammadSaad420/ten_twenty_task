import 'package:flutter/material.dart';

import 'components/movie_description.dart';
import 'components/movie_header.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieHeader(),
            MovieDecription(),
          ],
        ),
      ),
    );
  }
}
