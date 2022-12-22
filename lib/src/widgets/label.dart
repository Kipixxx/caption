import 'package:caption/src/styles.dart';
import 'package:caption/src/widgets/space.dart';
import 'package:flutter/widgets.dart';

class InfoLabel extends StatelessWidget {
  const InfoLabel({
    Key? key,
    required this.label,
    this.isHeader = true,
    this.child,
  }) : super(key: key);

  final String label;
  final bool isHeader;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: isHeader ? Axis.vertical : Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isHeader ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        if (isHeader)
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.s),
            child: Text(label),
          ),
        if (child != null) Flexible(child: child!),
        if (!isHeader)
          Padding(
            padding: const EdgeInsets.only(left: Insets.s),
            child: Text(label),
          )
      ],
    );
  }
}
