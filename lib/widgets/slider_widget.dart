import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  PageController _pageController = PageController(viewportFraction: 0.8);
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
    return Column(
      children: [
        Container(
          height: 110,
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,

            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/promotions/promo1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ), // Example content
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/promotions/promo2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ), // Example content
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/promotions/promo3.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ), // Example content
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
