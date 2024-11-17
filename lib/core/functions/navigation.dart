import 'package:flutter/material.dart';

pushTo(BuildContext context, Widget newscreen) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) {
      return newscreen;
    }),
  );
}

pushWithReplacment(BuildContext context, Widget newscreen) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) {
      return newscreen;
    }),
  );
}


pushAndRemoveUntil(BuildContext context, Widget newscreen) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) {
      return newscreen;
    }), (route) =>false );
}
