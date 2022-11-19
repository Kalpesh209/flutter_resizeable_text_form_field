import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_resizeable_textform_field/Presentation/Widgets/draggable_text_form_field_widget.dart';
import 'package:flutter_resizeable_textform_field/Utils/app_colors.dart';
import 'package:flutter_resizeable_textform_field/Utils/app_strings.dart';

/*
Title:  DraggableTextFormFieldScreen
Purpose:  DraggableTextFormFieldScreen
Created On : 19/11/2022
Last Updated On : 19/11/2022
Author : Kalpesh Khandla
*/

class DraggableTextFormFieldScreen extends StatefulWidget {
  @override
  State<DraggableTextFormFieldScreen> createState() =>
      _DraggableTextFormFieldScreenState();
}

class _DraggableTextFormFieldScreenState
    extends State<DraggableTextFormFieldScreen> {
  TextEditingController wordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DraggableWidget(),
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

TextEditingController wordController = TextEditingController();
const ballDiameter = 7.5;

class _DraggableWidgetState extends State<DraggableWidget> {
  double height = 70;
  double width = 250;

  double topPosition = 250;
  double leftPosition = 70;

  void onDrag(double dx, double dy) {
    var newHeight = height + dy;
    var newWidth = width + dx;

    setState(() {
      height = newHeight > 0 ? newHeight : 0;
      width = newWidth > 0 ? newWidth : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              topPosition += details.delta.dy;
              leftPosition += details.delta.dx;
            });
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                top: topPosition,
                left: leftPosition,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(
                      color: AppColors.textfieldBorderColor.withOpacity(0.7),
                    ),
                  ),
                  child: Center(
                    child: DraggableTextFormFieldWidget(
                      controllerName: wordController,
                      hintTxt: AppStrings.textfieldHintTxt,
                      keyboardType: TextInputType.text,
                      cursorColor: AppColors.textfieldBorderColor,
                      contentPadding: 25,
                      onChange: (p0) {},
                      onSaved: (p0) {},
                      validatorData: (p0) {},
                    ),
                  ),
                ),
              ),
              // top left
              Positioned(
                top: topPosition - ballDiameter / 2,
                left: leftPosition - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var mid = (dx + dy) / 2;
                    var newHeight = height - 2 * mid;
                    var newWidth = width - 2 * mid;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      width = newWidth > 0 ? newWidth : 0;
                      topPosition = topPosition + mid;
                      leftPosition = leftPosition + mid;
                    });
                  },
                ),
              ),
              // top middle
              Positioned(
                top: topPosition - ballDiameter / 2,
                left: leftPosition + width / 2 - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var newHeight = height - dy;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      topPosition = topPosition + dy;
                    });
                  },
                ),
              ),
              // top right
              Positioned(
                top: topPosition - ballDiameter / 2,
                left: leftPosition + width - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var mid = (dx + (dy * -1)) / 2;

                    var newHeight = height + 2 * mid;
                    var newWidth = width + 2 * mid;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      width = newWidth > 0 ? newWidth : 0;
                      topPosition = topPosition - mid;
                      leftPosition = leftPosition - mid;
                    });
                  },
                ),
              ),
              // center right
              Positioned(
                top: topPosition + height / 2 - ballDiameter / 2,
                left: leftPosition + width - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var newWidth = width + dx;

                    setState(() {
                      width = newWidth > 0 ? newWidth : 0;
                    });
                  },
                ),
              ),
              // bottom right
              Positioned(
                top: topPosition + height - ballDiameter / 2,
                left: leftPosition + width - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var mid = (dx + dy) / 2;

                    var newHeight = height + 2 * mid;
                    var newWidth = width + 2 * mid;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      width = newWidth > 0 ? newWidth : 0;
                      topPosition = topPosition - mid;
                      leftPosition = leftPosition - mid;
                    });
                  },
                ),
              ),
              // bottom center
              Positioned(
                top: topPosition + height - ballDiameter / 2,
                left: leftPosition + width / 2 - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var newHeight = height + dy;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                    });
                  },
                ),
              ),
              // bottom left
              Positioned(
                top: topPosition + height - ballDiameter / 2,
                left: leftPosition - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var mid = ((dx * -1) + dy) / 2;

                    var newHeight = height + 2 * mid;
                    var newWidth = width + 2 * mid;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      width = newWidth > 0 ? newWidth : 0;
                      topPosition = topPosition - mid;
                      leftPosition = leftPosition - mid;
                    });
                  },
                ),
              ),
              //left center
              Positioned(
                top: topPosition + height / 2 - ballDiameter / 2,
                left: leftPosition - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var newWidth = width - dx;

                    setState(() {
                      width = newWidth > 0 ? newWidth : 0;
                      leftPosition = leftPosition + dx;
                    });
                  },
                ),
              ),
              //  center center
            ],
          ),
        ),
      ),
    );
  }
}

class SelectorWidget extends StatefulWidget {
  SelectorWidget({
    required this.onDrag,
  });

  final Function onDrag;

  @override
  _SelectorWidgetState createState() => _SelectorWidgetState();
}

class _SelectorWidgetState extends State<SelectorWidget> {
  late double initX;
  late double initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppColors.whiteColor,
          border: Border.all(
            width: 1.5,
            color: AppColors.textfieldBorderColor.withOpacity(0.9),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('X Cordinates', initX));
  }
}
