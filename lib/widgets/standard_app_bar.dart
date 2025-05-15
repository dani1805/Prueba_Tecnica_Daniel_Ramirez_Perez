// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/assets.dart';
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

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<LanguageBloc>(context, listen: true);

    return AppBar(
      backgroundColor: background,
      elevation: elevation,
      title: title,
      titleTextStyle: const TextStyle(fontSize: 16),
      centerTitle: false,
      actions: [
        PopupMenuButton<String>(
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
      ],
    );
  }

  @override
  Widget get child => const SizedBox.shrink();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
