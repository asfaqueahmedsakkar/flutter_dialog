library flutter_dialog;

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

Widget _dialogView;
StreamController<bool> _controller;


class FlutterDialog extends StatefulWidget {
  final Widget child;
  final bool cancelable;
  final bool blurBackground;
  final double blueAmount;

  FlutterDialog(
      {this.child, this.cancelable = true, this.blurBackground = true, this.blueAmount = 4.0})
      : assert(child != null);

  @override
  FlutterDialogState createState() {
    FlutterDialogState state = new FlutterDialogState();
    return state;
  }

  void showCustomDialog({@required Widget dialog}) {
    _dialogView = Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2.0,
              blurRadius: 8.0,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: dialog,
        ),
    );
    _controller.add(true);
  }

  void showDialog({@required Text title,
    @required Text content,
    List<Widget> actions,
    Color dialogBoxColor: Colors.white,
    double height: 200.0,
    double width: 300.0}) {
    actions == null ? actions = actions = List() : actions = actions;
    _dialogView = Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2.0,
            blurRadius: 8.0,
          )
        ],
        color: dialogBoxColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Center(child: title),
            Expanded(child: Center(child: content)),
            actions.isEmpty
                ? SizedBox()
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: actions,
            )
          ],
        ),
      ),
    );
    _controller.add(true);
  }

  void hide() {
    _controller.add(false);
  }
}

class FlutterDialogState extends State<FlutterDialog> {

  Widget _dialogBox;

  @override
  void initState() {
    super.initState();
    _controller = new StreamController();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        StreamBuilder(
          stream: _controller.stream,
          initialData: false,
          builder: (context, dataSnapShot) {
            if (dataSnapShot.data == false)
              return SizedBox();
            else {
              _dialogBox = Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.transparent,
                child: Center(
                  child: GestureDetector(child: _dialogView, onTap: () {},),
                ),
              );
              return GestureDetector(
                  onTap: widget.cancelable
                      ? () {
                    widget.hide();
                  }
                      : null,
                  child: widget.blurBackground ? BackdropFilter(
                    child: _dialogBox,
                    filter: ImageFilter.blur(
                        sigmaX: widget.blueAmount, sigmaY: widget.blueAmount),
                  ) : _dialogBox
              );
            }
          },
        ),
      ],
    );
  }
}
