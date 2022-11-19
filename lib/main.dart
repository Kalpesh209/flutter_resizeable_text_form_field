import 'package:flutter/material.dart';
import 'package:flutter_resizeable_textform_field/Presentation/Screen/Home/draggable_text_form_field_widget.dart';
import 'package:flutter_resizeable_textform_field/Utils/app_strings.dart';

/*
Title:  Entry Point of a App
Purpose:  Entry Point of a App
Created On : 19/11/2022
Last Updated On : 19/11/2022
Author : Kalpesh Khandla
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.draggableTextfieldHintTxt,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DraggableTextFormFieldScreen(),
    );
  }
}
