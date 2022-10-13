

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/API/login/state.dart';

import '../Characters/View.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  String? name;
  String? password;

  final formkey = GlobalKey<FormState>();
  Future<void> login(context) async {
    if (!formkey.currentState!.validate()) {
      return;
    }
    emit(LoginLoadingState());
    formkey.currentState!.save();
    try {
      final response = await Dio().post(
        'https://student.valuxapps.com/api/login',
      );
      print(response.data);
      if (name == "jemi@jemi.com" && password == "123456") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CharactersView(),
            ));
      }
    } catch (e) {
      print(e);
    }
  }
}
