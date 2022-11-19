import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizeable_textform_field/Utils/app_colors.dart';

/*
Title: DraggableTextFormFieldWidget
Purpose: DraggableTextFormFieldWidget
Created On : 19/11/2022
Last Updated On : 19/11/2022
Author : Kalpesh Khandla
*/

class DraggableTextFormFieldWidget extends StatefulWidget {
  final TextEditingController controllerName;
  final String hintTxt;
  final TextInputType keyboardType;
  final Color cursorColor;
  final double contentPadding;
  final Function(String) onChange;
  final Function(String) onSaved;
  final bool isObsure;
  final bool isReadOnly;
  final String? Function(String?)? validatorData;

  const DraggableTextFormFieldWidget({
    required this.controllerName,
    required this.hintTxt,
    required this.keyboardType,
    required this.cursorColor,
    required this.contentPadding,
    required this.onChange,
    required this.onSaved,
    this.isObsure = false,
    this.isReadOnly = false,
    required this.validatorData,
  });

  @override
  State<DraggableTextFormFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<DraggableTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            readOnly: widget.isReadOnly,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
            obscureText: widget.isObsure,
            cursorColor: widget.cursorColor,
            controller: widget.controllerName,
            keyboardType: widget.keyboardType,
            validator: (value) {
              // widget.validatorData!(value);

              return widget.validatorData!(value);
            },
            onChanged: (va) {
              widget.onChange(va);
            },
            onSaved: (val) {
              if (kDebugMode) {
                print(val);
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              // errorText: widget.errorMsg(""),
              //       labelText: widget.labelTxt,
              contentPadding: EdgeInsets.all(widget.contentPadding),

              // When user gets Error

              // errorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(5),
              //   borderSide: BorderSide(
              //     color: AppColors.greyColor,
              //   ),
              // ),

              // When user getting error and focuses on a textformfield
              // focusedErrorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(5),
              //   borderSide: BorderSide(
              //     color: AppColors.greyColor,
              //   ),
              // ),
              // When user Focuses on textformField widget
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(5),
              //   borderSide: BorderSide(
              //     color: AppColors.blueColor,
              //   ),
              // ),

              // Default TextformField Color
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(5),
              //   borderSide: BorderSide(
              //     color: AppColors.greyColor,
              //   ),
              // ),
              hintText: widget.hintTxt,
              hintStyle: Theme.of(context).textTheme.caption?.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
