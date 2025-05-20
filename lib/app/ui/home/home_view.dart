// ignore_for_file: type_literal_in_constant_pattern

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/weather_response_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/colors.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/dialog.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/error_handler.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/authentication/authentication_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/form_contact.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/weather_screen.dart';
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
  late HomeBloc homeBloc;
  late WeatherResponseModel weatherResponseModel;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(handleTabControllerSelection);
  }

  void handleTabControllerSelection() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          doGetWeather(51.6195, -0.3337);
          break;
        case 1:
          doGetWeather(1.3963, 103.8009);
          break;
        case 2:
          doGetWeather(43.7677, -79.4659);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(
      context,
      listen: true,
    );
    homeBloc = BlocProvider.of<HomeBloc>(context, listen: true);
    weatherResponseModel = homeBloc.weatherResponseModel;

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
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: MColor.blue,
              tabs: [
                Tab(
                  child: Text(
                    'home-page.title-tab-london'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                Tab(
                  child: Text(
                    'home-page.title-tab-singapur'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                Tab(
                  child: Text(
                    'home-page.title-tab-toronto'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                Tab(
                  child: Text(
                    'home-page.title-tab-contact'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          body: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) async {
              switch (state.runtimeType) {
                case HomeError:
                  state = state as HomeError;
                  final code = state.code;
                  final message = state.message;

                  ErrorHandler.handler(context, code, message);
                  break;
                case HomeSuccess:
                  doShowDialog();
                  break;
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case HomeLoading:
                  return StandardLoading();
                default:
                  return TabBarView(
                    controller: tabController,
                    children: [
                      WeatherScreen(weatherResponseModel: weatherResponseModel),
                      WeatherScreen(weatherResponseModel: weatherResponseModel),
                      WeatherScreen(weatherResponseModel: weatherResponseModel),
                      FormContact(),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  void doUnauthenticated() {
    authenticationBloc.add(DoUnauthenticated());
  }

  Future<void> doShowDialog() async {
    MDialog.show(
      context: context,
      content: Text('form-contact.text-dialog-sent-to'.tr()),
    );
  }

  void doGetWeather(double lat, double lon) {
    homeBloc.add(
      DoGetWeather(lat: lat, lon: lon, lang: context.locale.languageCode),
    );
  }
}
