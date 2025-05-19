// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class StandardDialog extends StatelessWidget {
  const StandardDialog({
    Key? key,
    required this.content,
    this.padding = const EdgeInsets.all(15),
    this.elevation = 3.0,
    this.height = 200,
    this.isBarrierDismissible = true,
    this.onPressed,
  }) : super(key: key);

  final Widget content;
  final EdgeInsets? padding;
  final double? elevation;
  final double? height;
  final bool isBarrierDismissible;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: elevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isBarrierDismissible
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: onPressed ?? () => Navigator.of(context).pop(),
                        child: Container(
                          color: Colors.transparent,
                          child: const Icon(Icons.close, color: Colors.black),
                        ),
                      ),
                    ],
                  )
                  : const SizedBox(height: 20),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
