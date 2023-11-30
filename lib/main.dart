import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled2/ThemeClass.dart';
import 'package:untitled2/articles.dart';
import 'package:untitled2/data.dart';
import 'package:untitled2/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Locale _locale = const Locale('en');
  final ThemeMode _themeMode = ThemeMode.light;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [Locale('en'), Locale('fa')],
      locale: _locale,
      theme: _themeMode == ThemeMode.dark
          ? ThemeApp(_locale).DarkTheme
          : ThemeApp(_locale).LightTheme,
/*      home: Stack(
        children: [
          Positioned.fill(child: MyHomePage()),
          Positioned(left: 0, right: 0, bottom: 0, child: BottomNavigation())
        ],
      ),*/
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 65,
            child: IndexedStack(
              index: selectedIndex,
              children: [
                MyHomePage(),
                Articles(),
                Articles(),
                ProfileScreen(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigation(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  Function(int index) onTap;
  BottomNavigation({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned.fill(
            child: AlertDialog(
              backgroundColor: Colors.transparent,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 65,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomNavigationItem(
                      iconFileName: 'Home.png',
                      title: "Home",
                      onTap: () {
                        onTap(0);
                      },
                    ),
                    BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      title: "Articles",
                      onTap: () {
                        onTap(1);
                      },
                    ),
                    const SizedBox(width: 10),
                    BottomNavigationItem(
                      iconFileName: 'Search.png',
                      title: "Search",
                      onTap: () {
                        onTap(2);
                      },
                    ),
                    BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      title: "Menu",
                      onTap: () {
                        onTap(3);
                      },
                    )
                  ],
                ),
              )),
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37),
                  color: const Color(0xff376AED),
                  border: Border.all(color: Colors.white, width: 3)),
              child: Image.asset('assets/img/icons/plus.png'),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  String iconFileName;
  String title;
  Function() onTap;
  BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.title,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/icons/$iconFileName',
            color: const Color(0xff376AED),
          ),
          const SizedBox(height: 8),
          Text(title, style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(40, 100, 40, 100),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                      "dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"))
            ],
          )
        ],
      ),
    ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var stories = AppDatabase.stories;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 20, 32, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localizations.hi, style: themeData.textTheme.titleSmall),
                  Image.asset('assets/img/icons/notification.png',
                      width: 40, height: 40)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 8, 32, 20),
              child: Text(
                localizations.explor,
                style: themeData.textTheme.titleMedium,
              ),
            ),
            StoryList(stories: stories),
            const SizedBox(height: 26),
            const CategoryList(),
            PostList()
          ],
        ),
      ),
    ));
  }
}

class PostList extends StatelessWidget {
  var posts = AppDatabase.posts;

  PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 15, 32, 100),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Latest News",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                "More",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: const Color(0xff376AED)),
              )
            ],
          ),
          const SizedBox(height: 16),
          ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: posts.length,
            itemExtent: 149,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Post(post: posts[index]);
            },
          )
        ],
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Color(0xffCDCDCD), blurRadius: 10)
          ]),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child:
                  Image.asset('assets/img/posts/small/${post.imageFileName}')),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    post.caption,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: const Color(0xff376AED)),
                  ),
                  const SizedBox(height: 12),
                  Text(post.title,
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 18),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        const Icon(CupertinoIcons.hand_thumbsup, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          post.likes,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(width: 10),
                        const Icon(CupertinoIcons.clock, size: 16),
                        const SizedBox(width: 4),
                        Text(post.time,
                            style: Theme.of(context).textTheme.labelSmall),
                        Expanded(
                            child: Container(
                          alignment: Alignment.bottomRight,
                          child: const Icon(
                            CupertinoIcons.bookmark,
                            size: 16,
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return CategoryItem(
            category: categories[index],
            index: index,
            endIndex: categories.length - 1);
      },
      options: CarouselOptions(
          disableCenter: true,
          padEnds: false,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          aspectRatio: 1.2,
          viewportFraction: 0.8,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollPhysics: const BouncingScrollPhysics()),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;
  final int endIndex;

  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
    required this.endIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          index == 0 ? 32 : 8, 0, index == endIndex ? 32 : 8, 0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(32)),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      colors: [Color(0xff0D253C), Color(0x000D253C)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center)),
              child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
              bottom: 30,
              left: 20,
              child: Text(category.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.white)))
        ],
      ),
    );
  }
}

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(32, 2, 32, 0),
          itemCount: stories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var story = stories[index];
            return Story(story: story);
          }),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !story.isViewed ? imageProfileUnseen() : imageProfileViewed(),
        const SizedBox(
          height: 6,
        ),
        Text(
          story.name,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }

  Widget imageProfileUnseen() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          width: 68,
          height: 68,
          decoration: BoxDecoration(
              gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
                Color(0xff376AED),
                Color(0xff49B0E2),
                Color(0xff9CECFB),
              ]),
              borderRadius: BorderRadius.circular(24)),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: imageProfile(),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/img/icons/${story.iconFileName}',
            height: 24,
            width: 24,
          ),
        )
      ],
    );
  }

  Widget imageProfileViewed() {
    return SizedBox(
      height: 68,
      width: 68,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(24),
              dashPattern: const [10, 3],
              color: const Color(0xff7B8BB2),
              strokeWidth: 2,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: imageProfile(),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/img/icons/${story.iconFileName}',
              height: 24,
              width: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget imageProfile() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Image.asset(
          'assets/img/stories/${story.imageFileName}',
          height: 54,
          width: 54,
        ));
  }
}
