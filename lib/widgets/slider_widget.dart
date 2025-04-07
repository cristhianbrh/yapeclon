import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void disponse() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int page) => {
    setState(() {
      _currentPage = page;
    }),
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(children: [Text("data")]),
      ),
    );
  }
}
