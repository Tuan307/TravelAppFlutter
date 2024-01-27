import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  Widget baseBody;

  BaseScaffold({Key? key, required this.baseBody}) : super(key: key);

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: widget.baseBody,
        ),
      ),
    );
  }
}
