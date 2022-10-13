import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/API/login/cubit.dart';
import 'package:untitled/API/login/state.dart';
import '../Characters/View.dart';
import '../register/register.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {




  @override


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: BlocListener<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              print('NAVIGATE TO HOME');
            } else if (state is LoginErrorState) {
              print('ERROR');
            }
          },
          child: Builder(
            builder: (context) {
              final cubit = BlocProvider.of<LoginCubit>(context);
              return Form(
                key: cubit.formkey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          Image.asset('assets/images/icons8-male-user-64.png'),
                          SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            onSaved: (v) => cubit.name = v,
                            decoration: InputDecoration(
                                hintText: 'Username',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return ('Username can not empty');
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onSaved: (v) => cubit.password = v,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return ('Password can not empty');
                              } else if (v.length < 6) {
                                return 'Password must at lest 6 character';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<LoginCubit, LoginStates>(
                            builder: (context, state) {
                              if (state is LoginLoadingState) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              return ElevatedButton(
                                  onPressed: ()=>cubit.login(context),
                                child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ));},
                          ),
                          TextButton(onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    RegisterView()));
                          }, child: Text('Create New Account'))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
