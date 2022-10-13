import 'package:untitled/API/Characters/character.dart';

class FullCharacter extends Character {
  final String birthday;
  final String status;
  final String nickname;
  FullCharacter({
    required super.name,
    required super.image,
    required super.id,
    required this.birthday,
    required this.status,
    required this.nickname,
  });
}
