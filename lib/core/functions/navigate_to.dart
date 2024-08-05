import 'package:flutter/material.dart';

navigateTo(context, view) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return view;
    },
  ));
}
