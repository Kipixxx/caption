import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CaptionText extends StatelessWidget {
  const CaptionText({
    Key? key,
    required this.data,
    required this.defaultStyle,
  }) : super(key: key);

  final CaptionTextData data;
  final CaptionTextStyle defaultStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: data.style?.size ?? defaultStyle.size,
      color: data.style?.backgroundColor ?? defaultStyle.backgroundColor,
      child: MarkdownBody(
        data: data.text,
      ),
    );
  }
}

class CaptionTextData {
  const CaptionTextData({
    this.text = '',
    this.style = const CaptionTextStyle(),
  });

  final String text;
  final CaptionTextStyle? style;
}

class CaptionTextStyle {
  const CaptionTextStyle({
    this.size,
    this.backgroundColor,
  });

  final double? size;
  final Color? backgroundColor;
}
