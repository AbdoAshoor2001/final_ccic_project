
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/API/register/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());

  String? name;
  String? email;
  String? phone;
  String? password;


  final formkey = GlobalKey<FormState>();
  
  Future<void> register() async {
    if (!formkey.currentState!.validate()) {
      return;
    }
    emit(RegisterLoadingState());
    formkey.currentState!.save();
    try{
      final response = await Dio().post(
          'https://student.valuxapps.com/api/register',
          data: {
            "name": name,
            "phone": phone,
            "email": email,
            "password": password
          }
      );
       print(response.data);
      if (response.data['status']){
        SharedPreferences sp =await SharedPreferences.getInstance();
        sp.setString('token', response.data['data']['token']);
        emit(RegisterSuccessState());

      }else {
        emit(RegisterErrorState(
          message: response.data['message'],
        ));
      }
    }catch (e){
      emit(RegisterErrorState(
        message: e.toString(),
     ));
    }
  }

  }