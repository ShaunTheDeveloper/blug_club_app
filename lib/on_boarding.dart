import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:untitled2/data.dart';
import 'package:untitled2/main.dart';

import 'gen/assets.gen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  var onBoardingData = AppDatabase.onBoarding;
  var page =0;

  @override
  void initState() {
    _pageController.addListener(() {
      if(_pageController.page!.round() ==onBoardingData.length-1 ) {
        setState(() {
          page =_pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
                child: Assets.img.background.onboarding.image(fit: BoxFit.fill),
              ),
            ),
            Container(
              height: 324,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(28),
                      topLeft: Radius.circular(28))),
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                          itemCount: onBoardingData.length,
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            var item = onBoardingData[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 32,right: 32,top: 45),
                              child: Column(
                                children: [
                                  Text(item.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  const SizedBox(height: 16),
                                  Text(
                                    item.Description,
                                    style:
                                        Theme.of(context).textTheme.displaySmall,
                                  ),
                                ],
                              ),
                            );
                          })),
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32,right: 32,bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                              controller: _pageController,
                              count: onBoardingData.length,
                              effect: ExpandingDotsEffect(
                                  activeDotColor: Colors.blue,
                                  dotColor: Colors.blue.withOpacity(0.1),
                              dotWidth: 8,
                              dotHeight: 8)),
                          InkWell(
                            onTap: (){
                              if(page == onBoardingData.length-1){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MyHomePage()));
                              }else{
                                _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                              }

                            },
                            child: Container(
                              width: 88,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Icon(page!=onBoardingData.length-1?
                                Icons.arrow_forward_rounded:Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
