import 'package:flutter/material.dart';

import 'text.dart';


class MessageDialogBox extends StatelessWidget {

  final String message;
  final String title;
  final Function () onOk;

  const MessageDialogBox(
    {
      super.key, 
      required this.message,
      required this.title,
      required this.onOk,
    }
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: HeaderText(
        text: title
      ),
      content: RegularText(
        text: message,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onOk,
          child: RegularText(
            text: "OK",
          ),
        ),
      ],
    );
  }
}


class ConfirmDialogBox extends StatelessWidget {

  final String message;
  final String title;
  final Function () onOk;

  const ConfirmDialogBox(
    {
      super.key, 
      required this.message,
      required this.title,
      required this.onOk,
    }
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: HeaderText(
        text: title
      ),
      content: RegularText(
        text: message,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onOk,
          child: RegularText(
            text: "OK",
          ),
        ),
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: RegularText(
            text: "Cancel",
          ),
        ),
      ],
    );
  }
}