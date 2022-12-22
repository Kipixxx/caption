import 'package:caption/src/l10n/app_localizations_extensions.dart';
import 'package:caption/src/styles.dart';
import 'package:caption/src/widgets/caption/caption_text.dart';
import 'package:caption/src/widgets/color_field.dart';
import 'package:caption/src/widgets/label.dart';
import 'package:caption/src/widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaptionTextForm extends StatefulWidget {
  const CaptionTextForm({
    Key? key,
    required this.initialData,
    required this.onChanged,
  }) : super(key: key);

  final CaptionTextData initialData;
  final ValueChanged<CaptionTextData> onChanged;

  @override
  State<CaptionTextForm> createState() => _CaptionTextFormState();
}

class _CaptionTextFormState extends State<CaptionTextForm> with TickerProviderStateMixin {
  late final TabController _tabController;
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    _textController = TextEditingController(text: widget.initialData.text);
    _textController.addListener(_onChanged);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: theme.primaryColor,
          labelColor: theme.primaryColor,
          unselectedLabelColor: theme.disabledColor,
          isScrollable: true,
          tabs: [
            Tab(text: context.loc.contentTab),
            Tab(text: context.loc.styleTab),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            _ContentTab(
              textController: _textController,
            ),
            _StyleTab(),
          ],
        )),
      ],
    );
  }

  void _onChanged() {
    widget.onChanged(CaptionTextData(
      text: _textController.text,
    ));
  }
}

class _ContentTab extends StatelessWidget {
  const _ContentTab({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.m),
      child: InfoLabel(
        label: context.loc.textLabel,
        child: TextField(
          controller: textController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
      ),
    );
  }
}

class _StyleTab extends StatelessWidget {
  const _StyleTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.m),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InfoLabel(
              label: context.loc.sizeLabel,
              child: TextField(),
            ),
            VSpace.m,
            InfoLabel(
              label: context.loc.backgroundColorLabel,
              child: ColorField(),
            ),
          ],
        ),
      ),
    );
  }
}
