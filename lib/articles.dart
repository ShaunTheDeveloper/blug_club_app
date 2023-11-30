import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'gen/assets.gen.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    var colorSceme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorSceme.background,
      floatingActionButton: InkWell(
        onTap: () {
          showSnackBar(context, "FAB clicked");
        },
        child: Container(
          width: 111,
          height: 48,
          decoration: BoxDecoration(
              color: colorSceme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20, color: colorSceme.primary.withOpacity(0.5))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.img.icons.thumbs,
                color: colorSceme.onSurface,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                '2.1k',
                style: TextStyle(color: colorSceme.onSurface),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  title: Text('Articles'),
                  titleSpacing: 32,
                  actions: [
                    Icon(Icons.more_horiz_rounded),
                    SizedBox(
                      width: 16,
                    )
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    Padding(
                      padding: EdgeInsets.only(
                          left: 32, top: 32, right: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Four Things Every Woman Needs To Know',
                            style: style.titleMedium,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.story1
                                      .image(width: 48, height: 48)),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Mohammad Heidari',
                                      style: style.labelMedium,
                                    ),
                                    Text(
                                      '2m ago',
                                      style: style.labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(CupertinoIcons.share),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(CupertinoIcons.bookmark)
                            ],
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(26),
                            topLeft: Radius.circular(26)),
                        child: Assets.img.background.singlePost.image()),
                    Padding(
                      padding: EdgeInsets.only(left: 32, right: 32, top: 32),
                      child: Column(
                        children: [
                          Text(
                            "A man’s sexuality is never your mind responsibility.",
                            style: style.titleSmall!
                                .copyWith(fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                              'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.')
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.white70, Colors.white70.withOpacity(0)])),
            ),
            bottom: 0,
            left: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context, String messsage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(messsage)));
}
