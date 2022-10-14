import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/API/login/login_view.dart';
import 'package:untitled/API/register/states.dart';


import '../Characters/View.dart';
import 'cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (context) => RegisterCubit(),
          child: BlocListener<RegisterCubit, RegisterStates>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => CharactersView()));
              } else if (state is RegisterErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Builder(
              builder: (context) {
                final cubit = BlocProvider.of<RegisterCubit>(context);
                return Form(
                  key: cubit.formkey,
                  child: ListView(
                    children: [
                      TextFormField(
                        onSaved: (v) => cubit.name = v,
                        decoration: InputDecoration(
                          hintText: 'name',
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return ('name can not empty');
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (v) => cubit.email = v,
                        decoration: InputDecoration(
                          hintText: 'email',
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return ('Email can not empty');
                          } else if (!v.contains('@')) {
                            return 'Email must be contain @';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (v) => cubit.phone = v,
                        decoration: InputDecoration(
                          hintText: 'phone',
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return ('phone can not empty');
                          } else if (!v.startsWith('+201')) {
                            return 'Phone must start with +20';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (v) => cubit.password = v,
                        decoration: InputDecoration(
                          hintText: 'password',
                        ),
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
                        height: 10,
                      ),
                      BlocBuilder<RegisterCubit, RegisterStates>(
                        builder: (context, state) {
                          if (state is RegisterLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                            onPressed: cubit.register,
                            child: Text('Register'),
                          );
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => LoginView()));
                          },
                          child:
                          Text(
                              'Log In To Existing Account'
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
