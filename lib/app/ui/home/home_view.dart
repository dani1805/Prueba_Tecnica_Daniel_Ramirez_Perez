// ignore_for_file: type_literal_in_constant_pattern

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/colors.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/error_handler.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/authentication/authentication_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/form_contact.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_app_bar.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_loading.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late Size size;
  late AuthenticationBloc authenticationBloc;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
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
              body: DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      indicatorColor: MColor.blue,
                      labelColor: MColor.blue,
                      tabs: [
                        Tab(
                          child: Text(
                            'home-page.title-tab-london'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'home-page.title-tab-singapur'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'home-page.title-tab-toronto'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'home-page.title-tab-contact'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    //controller: tabController,
                    children: [
                      SizedBox.shrink(), //TODO
                      SizedBox.shrink(), //TODO
                      SizedBox.shrink(), //TODO
                      FormContact(),
                    ],
                  ),
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
