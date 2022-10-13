import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/API/Characters/controller.dart';
import '../register/register.dart';
import 'Character_cards.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({Key? key}) : super(key: key);
  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  bool isLoading = true;

  CharacterController characterController = CharacterController();

  @override
  void initState() {
    characterController.getAllCharacter().then((value) {
      isLoading = false;
      setState(() {});
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                final sp = await SharedPreferences.getInstance();
                sp.remove('token');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        RegisterView()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: characterController.error != null
          ? Center(
              child: Text(characterController.error!),
            )
          : isLoading
              ? Center(
                  child: CircularProgressIndicator(strokeWidth: 1.5),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemCount: characterController.characters.length,
                  itemBuilder: (context, index) => CharactersCard(
                    character: characterController.characters[index],
                  ),
                ),
    );
  }
}
