import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/data.dart';

import 'gen/assets.gen.dart';
import 'main.dart';

class ProfileScreen extends StatelessWidget {
  var posts = AppDatabase.posts;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            titleSpacing: 32,
            title: Text('Profile'),
            actions: [Icon(Icons.more_horiz_rounded), SizedBox(width: 20)],
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 32, 32, 40),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(24, 24, 24, 32),
                    decoration: BoxDecoration(
                      color: colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.img.stories.story2
                                  .image(width: 86, height: 86),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('@joviedan'),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('Jovi Daniel'),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text('UX Designer')
                                ])
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text('About me'),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                            'Medison Blackstone is ad director of user experincing design, with experience managing global teams')
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(color: Colors.red, boxShadow: [
                      BoxShadow(blurRadius: 20, color: Colors.black45)
                    ]),
                  ),
                  bottom: 0,
                  left: 90,
                  right: 90,
                ),
                Positioned(
                  bottom: 0,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('52'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Post')
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('250'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Following')
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('4.5K'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Followers')
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('My Posts')),
                        SvgPicture.asset(Assets.img.icons.grid,
                            width: 24, height: 24),
                        SizedBox(
                          width: 16,
                        ),
                        SvgPicture.asset(Assets.img.icons.table,
                            width: 24, height: 24),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                        itemCount: posts.length,
                        shrinkWrap: true,
                        itemExtent: 160,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Post(
                            post: posts[index],
                          );
                        })
                  ],
                ),
              ),
            )
          ]))
        ],
      ),
    );
  }
}
