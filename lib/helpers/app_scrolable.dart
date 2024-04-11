import 'package:flutter/material.dart';

class AppScrollableText extends StatefulWidget {

  final String text;
  final ScrollController? scrollController;
  final TextAlign align;
  final TextStyle? style;
  final int speed;
  final bool scrollableByDefault;

  const AppScrollableText(
    this.text, {
      this.scrollController,
      this.align = TextAlign.left,
      this.style,
      this.speed = 20,
      this.scrollableByDefault = true,
    }
  );

  @override
  State<AppScrollableText> createState() => _AppScrollableTextState();
}

class _AppScrollableTextState extends State<AppScrollableText> {

  late final ScrollController controller;

  void animateText() async {
    if (controller.hasClients) {
      await controller.animateTo(
        controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000 * controller.position.maxScrollExtent ~/ widget.speed,),
        curve: Curves.linear,
      );
    }

    await Future.delayed(const Duration(seconds: 1));

    if(controller.hasClients) controller.jumpTo(0);

    await Future.delayed(const Duration(seconds: 1));

    if(controller.hasClients) animateText();
  }

  @override
  void initState() {
    controller = widget.scrollController ?? ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => animateText(),);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.hasBoundedWidth) {
          final painter = TextPainter(
            text: TextSpan(text: widget.text, style: widget.style),
            maxLines: 1,
            textAlign: widget.align,
            textScaleFactor: MediaQuery.textScaleFactorOf(context),
            textDirection: Directionality.of(context),
          );

          painter.layout(maxWidth: constraints.maxWidth);

          if (painter.didExceedMaxLines || widget.scrollableByDefault) {
            return SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Text(widget.text, textAlign: widget.align, style: widget.style,),
            );
          }
        }

        return Text(
          widget.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: widget.align,
          style: widget.style,
        );
      },
    );
  }
}
