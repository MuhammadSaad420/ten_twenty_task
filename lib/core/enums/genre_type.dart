import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'label')
enum GenreType {
  action('Action', Colors.red),
  adventure('Adventure', Colors.orange),
  animation('Animation', Colors.pink),
  comedy('Comedy', Colors.yellow),
  crime('Crime', Colors.brown),
  documentary('Documentary', Colors.grey),
  drama('Drama', Colors.purple),
  family('Family', Colors.green),
  fantasy('Fantasy', Colors.blue),
  history('History', Colors.amber),
  horror('Horror', Colors.deepPurple),
  music('Music', Colors.teal),
  mystery('Mystery', Colors.indigo),
  romance('Romance', Colors.pinkAccent),
  tvMovie('TV Movie', Colors.cyan),
  thriller('Thriller', Colors.deepOrange),
  war('War', Colors.redAccent),
  western('Western', Colors.brown),
  scienceFiction('Science Fiction', Color.fromARGB(255, 100, 63, 49));

  final String label;
  final Color color;
  const GenreType(this.label, this.color);
}
