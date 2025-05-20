// ignore_for_file: must_be_immutable, type_literal_in_constant_pattern

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/assets.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/language/language_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_language_item.dart';

class StandardAppBar extends StatelessWidget implements PreferredSize {
  StandardAppBar({
    super.key,
    required this.elevation,
    this.background,
    this.title,
    this.actions,
  });

  final Color? background;
  final double elevation;
  final Widget? title;
  final List<Widget>? actions;

  late LanguageBloc bloc;
  late HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<LanguageBloc>(context, listen: true);
    homeBloc = BlocProvider.of<HomeBloc>(context, listen: true);

    return AppBar(
      backgroundColor: background,
      elevation: elevation,
      title: title,
      titleTextStyle: const TextStyle(fontSize: 16),
      centerTitle: false,
      actions: [
        BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case LanguageSuccess:
                homeBloc.add(DoGetWeather(lang: context.locale.languageCode));
                break;
            }
          },
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: PopupMenuButton<String>(
              icon: Icon(Icons.menu, color: Colors.white),
              onSelected: (String item) {
                bloc.add(DoChangeLanguage(context: context, value: item));
              },
              itemBuilder:
                  (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'es',
                      child: StandardLanguageItem(
                        image: Assets.appSpanishIcon,
                        title: 'ES',
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'en',
                      child: StandardLanguageItem(
                        image: Assets.appEnglishIcon,
                        title: 'EN',
                      ),
                    ),
                  ],
            ),
          ),
        ),
        if (actions != null) ...actions!,
      ],
    );
  }

  @override
  Widget get child => const SizedBox.shrink();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
