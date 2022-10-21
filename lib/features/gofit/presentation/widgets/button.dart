import 'package:flutter/material.dart';

MaterialButton buttonmaterial(
  Text text,
  Icon icon,
) {
  return MaterialButton(
    minWidth: 40,
    onPressed: () {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        text,
      ],
    ),
  );
}
