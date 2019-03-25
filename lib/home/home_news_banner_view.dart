import 'package:flutter/material.dart';

import 'package:movie_recommend/public.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsBannerView extends StatelessWidget {
  final List<NewsBanner> banners;

  NewsBannerView(this.banners);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CarouselSlider(
        items: banners.map((banner) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  AppNavigator.pushWeb(context, banner.news.link,banner.news.title);
                },
                child: Container(
                  width: Screen.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: Screen.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(banner.news.cover),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: Screen.width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        width: Screen.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              banner.news.title,
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16, 
                                fontWeight: FontWeight.bold,),
                            ),
                            Text(banner.news.summary,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                                style: TextStyle(
                                    color: AppColor.white,)),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              );
            },
          );
        }).toList(),
        aspectRatio: 2,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: true,

      ),
    );
  }
}

class NewsBanner {
  MovieNews news;

  NewsBanner(this.news);
}