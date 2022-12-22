import 'package:caption/src/widgets/caption/caption_text.dart';
import 'package:caption/src/widgets/caption/caption_text_form.dart';
import 'package:caption/src/widgets/space.dart';
import 'package:flutter/material.dart';

class CaptionPage extends StatefulWidget {
  const CaptionPage({Key? key}) : super(key: key);

  @override
  State<CaptionPage> createState() => _CaptionPageState();
}

class _CaptionPageState extends State<CaptionPage> {
  final defaultTextStyle = const CaptionTextStyle();

  var _textData = const CaptionTextData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: CaptionText(
                  data: _textData,
                  defaultStyle: defaultTextStyle,
                ),
              ),
            ),
            HSpace.m,
            SizedBox(
              width: 250,
              child: Column(
                children: [
                  Expanded(
                    child: CaptionTextForm(
                      initialData: _textData,
                      onChanged: _onTextChanged,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTextChanged(CaptionTextData textData) {
    setState(() {
      _textData = textData;
    });
  }
}
