import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:system_delivery_admin_ui/widgets/layout/window_buttons.dart';

class PageLayout extends StatefulWidget {
  const PageLayout({
    super.key,
    this.body,
    this.navigation,
    this.windowWidth = 300,
    this.windowHeight = 300,
  });

  final Widget? navigation;
  final Widget? body;
  final double windowWidth;
  final double windowHeight;

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  @override
  void initState() {
    super.initState();
    doWhenWindowReady(() {
      var initialSize = Size(widget.windowWidth, widget.windowHeight);
      appWindow.size = initialSize;
      appWindow.minSize = initialSize;
      appWindow.maxSize = initialSize;
      appWindow.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Colors.black,
        width: 1,
        child: Row(
          children: [
            SizedBox(
              width: 250,
              child: Column(
                children: [
                  WindowTitleBarBox(
                    child: MoveWindow(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: widget.navigation ?? Container(),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFF3F2F7),
                child: Column(
                  children: [
                    WindowTitleBarBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: MoveWindow(
                              child: Container(
                                color: const Color(0xFFF3F2F7),
                              ),
                            ),
                          ),
                          const WindowButtons(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: widget.body ?? Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
