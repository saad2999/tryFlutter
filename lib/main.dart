import "package:flutter/material.dart";
import 'package:english_words/english_words.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget
{
 @override
  Widget build(BuildContext context) {
   final wordpair=RandomWordState();
    return MaterialApp(
        title:'this is my app of flutter',
        home: Scaffold(
        appBar: AppBar(
          title: Text('welcome to my app'),

        ),
          body: wordpair.BuildSuggestion()

        ),
    );


  }
}

class RandomWordState extends State<RandomWords>{
  final _suggestion=<WordPair>[];
  final bigger=TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Generator'),
      ),
      body: BuildSuggestion(),
    );


  }
  Widget BuildSuggestion() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i)
      {
        if (i.isOdd) return Divider();
        final index=i~/2;
        if(index >= _suggestion.length){
          _suggestion.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestion[index]);
      },
    );
  }
  Widget _buildRow(WordPair pair)
  {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: bigger,
      ),

    );
  }
}

class RandomWords extends StatefulWidget
{
  @override
  RandomWordState createState()=> new RandomWordState();

}