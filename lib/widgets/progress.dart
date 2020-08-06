import 'package:flutter/material.dart';

Container linearProgress(){
  return Container(
    padding: EdgeInsets.only(bottom:10.0),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.purple),
    ),
  );
}