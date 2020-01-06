import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:testlayout_app/LvRandom.dart';

class LvRandomState extends State<LvRandom>{
  final _wordPair = <WordPair>[];
  final _checkwords = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _onPressed)
          ],
          title: Text("Welllcome back", style: TextStyle(fontSize: 30.0),),),

        body: ListView.builder(itemBuilder: (context, index ) {
          if(index >= _wordPair.length){ _wordPair.addAll(generateWordPairs().take(10));}
          return _Row(_wordPair[index], index);
        }),
      );
  }
  

  Widget _onPressed(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        final Iterable<ListTile> titles = _checkwords.map((WordPair pair){
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: TextStyle(fontSize: 20.0),
              ),
            );
        });
        final List<Widget> device = ListTile.divideTiles(tiles: titles, context: context).toList();

        return Scaffold(
          appBar: AppBar(title: Text("Words Favorite", style: TextStyle(fontSize: 30.0),),),
          body: ListView(children: device,),
        );
      })
    );
  }


  Widget _Row(WordPair wordPair, int Index){
    final colos = Index%2==0? Colors.red : Colors.blue;
    final _isChecked = _checkwords.contains(wordPair);
    return ListTile(
      title: Text(wordPair.asPascalCase, style: TextStyle(color: colos, fontSize: 20.0), ),
      leading: Icon(_isChecked ? Icons.check_box : Icons.check_box_outline_blank, color: colos,),
      trailing: Icon(_isChecked ? Icons.favorite : Icons.favorite_border, color: colos ),
      onTap: (){
        setState(() {
          if(_isChecked){
            _checkwords.remove(wordPair);
          }else{
            _checkwords.add(wordPair);
          }
        });
      },

    );
  }

}





