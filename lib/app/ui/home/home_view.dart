// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/colors.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/error_handler.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/authentication/authentication_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_app_bar.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_loading.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Size size;
  late AuthenticationBloc authenticationBloc;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(
      context,
      listen: true,
    );

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) async {
        switch (state.runtimeType) {
          case HomeError:
            state = state as HomeError;
            final code = state.code;
            final message = state.message;

            ErrorHandler.handler(context, code, message);
            break;
          case HomeSuccess:
            print('HOME');
            break;
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoading:
            return StandardLoading();
          default:
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: StandardAppBar(
                elevation: 0,
                background: MColor.blue,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: doUnauthenticated,
                      child: Icon(Icons.logout, color: Colors.white),
                    ),
                  ),
                ],
              ),
              body: Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: DefaultTabController(
                        length: 4,
                        child: TabBar(
                          tabs: [
                            Tab(
                              child: Text(
                                'Londres',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Singapur',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Toronto',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Contacto',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
        }
      },
    );
  }

  void doUnauthenticated() {
    authenticationBloc.add(DoUnauthenticated());
  }
}
