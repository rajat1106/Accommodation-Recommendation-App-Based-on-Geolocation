import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {

  return AppBar(
    leading: const BackButton(),
    foregroundColor: Colors.green,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}