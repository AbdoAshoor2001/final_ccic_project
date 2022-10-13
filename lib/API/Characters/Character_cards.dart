import 'package:flutter/material.dart';
import 'character.dart';
import 'character_details.dart';

class CharactersCard extends StatelessWidget {
  const CharactersCard({Key? key, required this.character,}) : super(key: key);

final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
        CharacterDetails(charID: character.id)
          ,));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: Image.network(
                  character.image,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
               character.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                color: Colors.grey,
                spreadRadius: 1,
              )
            ]),
      ),
    );
  }
}
