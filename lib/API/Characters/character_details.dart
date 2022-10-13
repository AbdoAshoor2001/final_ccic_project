import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/API/Characters/full_character.dart';

class CharacterDetails extends StatefulWidget {
  const CharacterDetails({Key? key, required this.charID}) : super(key: key);

  final int  charID;

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {

  bool isLoading =true;
  FullCharacter? fullCharacter;
  @override
  void initState(){
   getDate();
    super.initState();
  }
  void getDate() async{
    final response = await Dio().get('https://www.breakingbadapi.com/api/characters/${widget.charID}');
    fullCharacter = FullCharacter(
      name: response.data[0]['name'],
      image: response.data[0]['img'],
      id: response.data[0]['char_id'],
      birthday: response.data[0]['birthday'],
      status: response.data[0]['status'],
      nickname: response.data[0]['nickname'],
    );
    isLoading =false;
    setState(() {});
  }

  Widget build(BuildContext context) {
    print('CHAR ID : ${widget.charID}');
    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? Center(child: CircularProgressIndicator()) :ListView(
        children: [
          Image.network(fullCharacter!.image),
          Text(fullCharacter!.name),
          Text(fullCharacter!.nickname),
          Text(fullCharacter!.birthday),
          Text(fullCharacter!.status),
        ],
      ),
    );
  }
}
