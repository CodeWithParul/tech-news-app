import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:techastra/components/searchbar.dart';
import 'package:techastra/utils/key.dart';

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=' +
            Key.key +
            '&q= ' +
            SearchBar.searchController.text),
  );

  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}
