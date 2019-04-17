<!-- vscode-markdown-toc -->
* 1. [正在热映](#in_theater)
* 2. [即将上映](#coming)
* 3. [本周口碑榜](#weekly)
* 4. [新片榜](#new)
* 5. [北美票房榜](#us_box)
* 6. [top250 榜单](#top250)
* 7. [电影搜索](#search)
* 8. [影片详情](#movie)
* 9. [影片剧照](#movie_photo)
* 10. [演员详细信息](#actor)
* 11. [演员相册](#actor_photo)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

#  <a name='api'></a>豆瓣电影公开api

由于豆瓣不再公开开放注册开发者，因此无法再获得 apikey，如果你需要使用apikey，请到公众号「**嗜码**」回复 apikey 获取。

 没 key 一分钟限制 10 次访问，带 key 有 40 次。

**如有侵权，请联系作者删除！**

##  1. <a name='in_theater'></a>正在热映 
URL: http://api.douban.com/v2/movie/nowplaying?apikey=**********

返回数据格式：
```json
{
    "title": "正在上映的电影",
    "total": 20,
    "entries": [
        {
            "rating": "7.1",
            "pubdate": "2019-03-08",
            "title": "惊奇队长",
            "wish": 124586,
            "original_title": "Captain Marvel",
            "collection": 78417,
            "orignal_title": "Captain Marvel",
            "stars": "35",
            "images": {
                "large": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2548870813.jpg",
                "small": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2548870813.jpg",
                "medium": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2548870813.jpg"
            },
            "id": "26213252"
        },
        {
          ...
        }
    ]
}
```
##  2. <a name='coming'></a>即将上映 
URL： http://api.douban.com/v2/movie/coming?apikey=********&start=0&count=1

返回数据格式：
```json
{
    "title": "即将上映的电影",
    "total": 60,
    "entries": [
        {
            "rating": "",
            "pubdate": "2019-03-12",
            "title": "小石头下乡记",
            "wish": 99,
            "original_title": "小石头下乡记",
            "collection": 8,
            "orignal_title": "小石头下乡记",
            "stars": "00",
            "images": {
                "large": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2548772681.jpg",
                "small": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2548772681.jpg",
                "medium": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2548772681.jpg"
            },
            "id": "30461812"
        },
        {
            ...
        }
    ]
}
```
##  3. <a name='weekly'></a>本周口碑榜
URL： http://api.douban.com/v2/movie/weekly?apikey=*********

返回数据格式：
```json
{
    "subjects": [
        {
            "subject": {
                "rating": {
                    "max": 10,
                    "average": 9.1,
                    "details": {
                        "1": 15,
                        "2": 40,
                        "3": 796,
                        "4": 4041,
                        "5": 8686
                    },
                    "stars": "45",
                    "min": 0
                },
                "genres": [
                    "纪录片"
                ],
                "title": "徒手攀岩",
                "casts": [
                    {
                        "avatars": {
                            "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1549054956.41.jpg",
                            "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1549054956.41.jpg",
                            "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1549054956.41.jpg"
                        },
                        "name_en": "Alex Honnold",
                        "name": "亚历克斯·霍诺尔德",
                        "alt": "https://movie.douban.com/celebrity/1362721/",
                        "id": "1362721"
                    },
                    {
                        "avatars": {
                            "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1441133528.13.jpg",
                            "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1441133528.13.jpg",
                            "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1441133528.13.jpg"
                        },
                        "name_en": "Jimmy Chin",
                        "name": "金国威",
                        "alt": "https://movie.douban.com/celebrity/1351391/",
                        "id": "1351391"
                    },
                    {
                        "avatars": null,
                        "name_en": "",
                        "name": "Dierdre Wolownick",
                        "alt": null,
                        "id": null
                    }
                ],
                "durations": [
                    "100分钟"
                ],
                "collect_count": 18250,
                "mainland_pubdate": "",
                "has_video": false,
                "original_title": "Free Solo",
                "subtype": "movie",
                "directors": [
                    {
                        "avatars": {
                            "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1441133528.13.jpg",
                            "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1441133528.13.jpg",
                            "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1441133528.13.jpg"
                        },
                        "name_en": "Jimmy Chin",
                        "name": "金国威",
                        "alt": "https://movie.douban.com/celebrity/1351391/",
                        "id": "1351391"
                    },
                    {
                        "avatars": {
                            "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1461655388.51.jpg",
                            "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1461655388.51.jpg",
                            "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1461655388.51.jpg"
                        },
                        "name_en": "Elizabeth Chai Vasarhelyi",
                        "name": "伊丽莎白·柴·瓦沙瑞莉",
                        "alt": "https://movie.douban.com/celebrity/1353324/",
                        "id": "1353324"
                    }
                ],
                "pubdates": [
                    "2018-09-28(美国)"
                ],
                "year": "2018",
                "images": {
                    "small": "http://img3.doubanio.com/view/photo/s_ratio_poster/public/p2547994176.jpg",
                    "large": "http://img3.doubanio.com/view/photo/s_ratio_poster/public/p2547994176.jpg",
                    "medium": "http://img3.doubanio.com/view/photo/s_ratio_poster/public/p2547994176.jpg"
                },
                "alt": "https://movie.douban.com/subject/30167509/",
                "id": "30167509"
            },
            "rank": 1,
            "delta": 10
        },
        {
            ...
        }
    ],
    "title": "豆瓣电影本周口碑榜"
}
```
##  4. <a name='new'></a>新片榜 
URL： http://api.douban.com/v2/movie/new_movies?apikey=********

返回数据格式：
```json
{
    "subjects": [
        {
            "rating": {
                "max": 10,
                "average": 8.6,
                "details": {
                    "1": 537,
                    "2": 925,
                    "3": 11129,
                    "4": 48684,
                    "5": 49907
                },
                "stars": "45",
                "min": 0
            },
            "genres": [
                "剧情",
                "喜剧",
                "同性"
            ],
            "title": "谁先爱上他的",
            "casts": [
                {
                    "avatars": {
                        "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1371176283.85.jpg",
                        "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1371176283.85.jpg",
                        "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1371176283.85.jpg"
                    },
                    "name_en": "Roy Chiu",
                    "name": "邱泽",
                    "alt": "https://movie.douban.com/celebrity/1266497/",
                    "id": "1266497"
                },
                {
                    "avatars": {
                        "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1469842110.75.jpg",
                        "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1469842110.75.jpg",
                        "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1469842110.75.jpg"
                    },
                    "name_en": "Ying-Hsuan Hsieh",
                    "name": "谢盈萱",
                    "alt": "https://movie.douban.com/celebrity/1360505/",
                    "id": "1360505"
                },
                {
                    "avatars": {
                        "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/pcCH7xVGmMHIcel_avatar_uploaded1503809835.83.jpg",
                        "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/pcCH7xVGmMHIcel_avatar_uploaded1503809835.83.jpg",
                        "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/pcCH7xVGmMHIcel_avatar_uploaded1503809835.83.jpg"
                    },
                    "name_en": "Spark Chen",
                    "name": "陈如山",
                    "alt": "https://movie.douban.com/celebrity/1380032/",
                    "id": "1380032"
                }
            ],
            "durations": [
                "100分钟"
            ],
            "collect_count": 140946,
            "mainland_pubdate": "",
            "has_video": false,
            "original_title": "誰先愛上他的",
            "subtype": "movie",
            "directors": [
                {
                    "avatars": {
                        "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p37044.jpg",
                        "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p37044.jpg",
                        "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p37044.jpg"
                    },
                    "name_en": "Mag Hsu",
                    "name": "徐誉庭",
                    "alt": "https://movie.douban.com/celebrity/1316646/",
                    "id": "1316646"
                },
                {
                    "avatars": {
                        "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1538396366.36.jpg",
                        "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1538396366.36.jpg",
                        "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1538396366.36.jpg"
                    },
                    "name_en": "Chih-Yen Hsu",
                    "name": "许智彦",
                    "alt": "https://movie.douban.com/celebrity/1395674/",
                    "id": "1395674"
                }
            ],
            "pubdates": [
                "2018-04-22(乌迪内远东电影节)",
                "2018-11-02(台湾)"
            ],
            "year": "2018",
            "images": {
                "small": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2546961193.jpg",
                "large": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2546961193.jpg",
                "medium": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2546961193.jpg"
            },
            "alt": "https://movie.douban.com/subject/27119586/",
            "id": "27119586"
        },
        {
            ...
        }
    ],
    "title": "豆瓣电影新片榜"
}
```

##  5. <a name='us_box'></a>北美票房榜
URL： http://api.douban.com/v2/movie/us_box?apikey=********

返回数据格式：
```json
{
    "date": "3月1日 - 3月3日",
    "subjects": [
        {
            "box": 30046000,
            "new": false,
            "rank": 1,
            "subject": {
                "rating": {
                    "max": 10,
                    "average": 7.6,
                    "details": {
                        "1": 39,
                        "2": 484,
                        "3": 4797,
                        "4": 6696,
                        "5": 2760
                    },
                    "stars": "40",
                    "min": 0
                },
                "genres": [
                    "动画",
                    "奇幻",
                    "冒险"
                ],
                "title": "驯龙高手3",
                "casts": [
                    {
                        "avatars": {
                            "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p893.jpg",
                            "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p893.jpg",
                            "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p893.jpg"
                        },
                        "name_en": "Jay Baruchel",
                        "name": "杰伊·巴鲁切尔",
                        "alt": "https://movie.douban.com/celebrity/1002664/",
                        "id": "1002664"
                    },
                    {
                        "avatars": {
                            "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p28644.jpg",
                            "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p28644.jpg",
                            "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p28644.jpg"
                        },
                        "name_en": "America Ferrera",
                        "name": "亚美莉卡·费雷拉",
                        "alt": "https://movie.douban.com/celebrity/1000055/",
                        "id": "1000055"
                    },
                    {
                        "avatars": {
                            "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1425119644.17.jpg",
                            "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1425119644.17.jpg",
                            "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1425119644.17.jpg"
                        },
                        "name_en": "F. Murray Abraham",
                        "name": "F·默里·亚伯拉罕",
                        "alt": "https://movie.douban.com/celebrity/1055073/",
                        "id": "1055073"
                    }
                ],
                "durations": [
                    "104分钟"
                ],
                "collect_count": 87704,
                "mainland_pubdate": "2019-03-01",
                "has_video": false,
                "original_title": "How To Train Your Dragon: The Hidden World",
                "subtype": "movie",
                "directors": [
                    {
                        "avatars": {
                            "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p18169.jpg",
                            "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p18169.jpg",
                            "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p18169.jpg"
                        },
                        "name_en": "Dean DeBlois",
                        "name": "迪恩·德布洛斯",
                        "alt": "https://movie.douban.com/celebrity/1018302/",
                        "id": "1018302"
                    }
                ],
                "pubdates": [
                    "2019-01-03(澳大利亚)",
                    "2019-02-22(美国)",
                    "2019-03-01(中国大陆)"
                ],
                "year": "2019",
                "images": {
                    "small": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2546335362.jpg",
                    "large": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2546335362.jpg",
                    "medium": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2546335362.jpg"
                },
                "alt": "https://movie.douban.com/subject/19899707/",
                "id": "19899707"
            }
        },
        {
            ...
        }
    ],
    "title": "豆瓣电影北美票房榜"
}
```
##  6. <a name='top250'></a>top250 榜单
URL: http://api.douban.com/v2/movie/top250?apikey=********&start=249&count=4

返回数据格式：
```json
{
    "count": 4,
    "start": 249,
    "total": 250,
    "subjects": [
        {
            "rating": {
                "max": 10,
                "average": 8.9,
                "details": {
                    "1": 197,
                    "2": 567,
                    "3": 6983,
                    "4": 27365,
                    "5": 43025
                },
                "stars": "45",
                "min": 0
            },
            "genres": [
                "剧情",
                "运动",
                "家庭"
            ],
            "title": "勇士",
            "casts": [
                {
                    "avatars": {
                        "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p5110.jpg",
                        "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p5110.jpg",
                        "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p5110.jpg"
                    },
                    "name_en": "Tom Hardy",
                    "name": "汤姆·哈迪",
                    "alt": "https://movie.douban.com/celebrity/1049489/",
                    "id": "1049489"
                },
                {
                    "avatars": {
                        "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1393134707.77.jpg",
                        "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1393134707.77.jpg",
                        "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1393134707.77.jpg"
                    },
                    "name_en": "Joel Edgerton",
                    "name": "乔尔·埃哲顿",
                    "alt": "https://movie.douban.com/celebrity/1010631/",
                    "id": "1010631"
                },
                {
                    "avatars": {
                        "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p22372.jpg",
                        "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p22372.jpg",
                        "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p22372.jpg"
                    },
                    "name_en": "Nick Nolte",
                    "name": "尼克·诺特",
                    "alt": "https://movie.douban.com/celebrity/1006989/",
                    "id": "1006989"
                }
            ],
            "durations": [
                "140分钟"
            ],
            "collect_count": 124747,
            "mainland_pubdate": "",
            "has_video": true,
            "original_title": "Warrior",
            "subtype": "movie",
            "directors": [
                {
                    "avatars": {
                        "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1481409552.4.jpg",
                        "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1481409552.4.jpg",
                        "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1481409552.4.jpg"
                    },
                    "name_en": "Gavin O'Connor",
                    "name": "加文·欧康诺",
                    "alt": "https://movie.douban.com/celebrity/1293387/",
                    "id": "1293387"
                }
            ],
            "pubdates": [
                "2011-09-09(美国)"
            ],
            "year": "2011",
            "images": {
                "small": "http://img3.doubanio.com/view/photo/s_ratio_poster/public/p1145536386.jpg",
                "large": "http://img3.doubanio.com/view/photo/s_ratio_poster/public/p1145536386.jpg",
                "medium": "http://img3.doubanio.com/view/photo/s_ratio_poster/public/p1145536386.jpg"
            },
            "alt": "https://movie.douban.com/subject/3217169/",
            "id": "3217169"
        }
        {
          ...
        }
    ],
    "title": "豆瓣电影Top250"
}
```

##  7. <a name='search'></a>电影搜索
URL： https://api.douban.com/v2/movie/search?q=keyword&tag=tag&count=20&start=1&apikey=********

返回数据格式：
```json
{
    "count": 1,
    "start": 1,
    "total": 200,
    "subjects": [
        {
            "rating": {
                "max": 10,
                "average": 9.3,
                "stars": "50",
                "min": 0
            },
            "genres": [
                "剧情",
                "科幻",
                "悬疑"
            ],
            "title": "盗梦空间",
            "casts": [
                {
                    "alt": "https://movie.douban.com/celebrity/1041029/",
                    "avatars": {
                        "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p814.jpg",
                        "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p814.jpg",
                        "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p814.jpg"
                    },
                    "name": "莱昂纳多·迪卡普里奥",
                    "id": "1041029"
                },
                {
                    "alt": "https://movie.douban.com/celebrity/1101703/",
                    "avatars": {
                        "small": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p3517.jpg",
                        "large": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p3517.jpg",
                        "medium": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p3517.jpg"
                    },
                    "name": "约瑟夫·高登-莱维特",
                    "id": "1101703"
                },
                {
                    "alt": "https://movie.douban.com/celebrity/1012520/",
                    "avatars": {
                        "small": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p118.jpg",
                        "large": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p118.jpg",
                        "medium": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p118.jpg"
                    },
                    "name": "艾伦·佩吉",
                    "id": "1012520"
                }
            ],
            "collect_count": 1516405,
            "original_title": "Inception",
            "subtype": "movie",
            "directors": [
                {
                    "alt": "https://movie.douban.com/celebrity/1054524/",
                    "avatars": {
                        "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p673.jpg",
                        "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p673.jpg",
                        "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p673.jpg"
                    },
                    "name": "克里斯托弗·诺兰",
                    "id": "1054524"
                }
            ],
            "year": "2010",
            "images": {
                "small": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p513344864.jpg",
                "large": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p513344864.jpg",
                "medium": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p513344864.jpg"
            },
            "alt": "https://movie.douban.com/subject/3541415/",
            "id": "3541415"
        }
    ],
    "title": "带有标签 \"科幻\" 的条目"
}
```
##  8. <a name='movie'></a>影片详情
URL：https://api.douban.com/v2/movie/subject/:movieId?apikey=********

返回数据格式：
```json
{
    "rating": {
        "max": 10,
        "average": 0,
        "details": {
            "1": 0,
            "2": 0,
            "3": 0,
            "4": 0,
            "5": 0
        },
        "stars": "00",
        "min": 0
    },
    "reviews_count": 0,
    "videos": [],
    "wish_count": 102,
    "original_title": "小石头下乡记",
    "blooper_urls": [
        "http://vt1.doubanio.com/201903092043/5464d5b3c129777ac66acfe26b449ec7/view/movie/M/302430498.mp4",
        "http://vt1.doubanio.com/201903092043/0d4338c7061e5fdcb8979e7554cf3131/view/movie/M/302430497.mp4"
    ],
    "collect_count": 8,
    "images": {
        "small": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2548772681.jpg",
        "large": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2548772681.jpg",
        "medium": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2548772681.jpg"
    },
    "douban_site": "",
    "year": "2019",
    "popular_comments": [
        {
            "rating": {
                "max": 5,
                "value": 1,
                "min": 0
            },
            "useful_count": 0,
            "author": {
                "uid": "182146934",
                "avatar": "https://img1.doubanio.com/icon/user_normal.jpg",
                "signature": "",
                "alt": "https://www.douban.com/people/182146934/",
                "id": "182146934",
                "name": "看潮起潮落"
            },
            "subject_id": "30461812",
            "content": "看到海报，我以为又是三俗网络电影，第一印象1星，后期实际看后再来追评或改评",
            "created_at": "2019-03-06 18:07:10",
            "id": "1705964941"
        },
        {
            "rating": {
                "max": 5,
                "value": 1,
                "min": 0
            },
            "useful_count": 0,
            "author": {
                "uid": "74651408",
                "avatar": "https://img3.doubanio.com/icon/u74651408-11.jpg",
                "signature": "",
                "alt": "https://www.douban.com/people/74651408/",
                "id": "74651408",
                "name": "清水一郎"
            },
            "subject_id": "30461812",
            "content": "呵呵🙃脱贫攻坚",
            "created_at": "2019-03-09 12:08:46",
            "id": "1709151577"
        },
        {
            "rating": {
                "max": 5,
                "value": 1,
                "min": 0
            },
            "useful_count": 0,
            "author": {
                "uid": "54667438",
                "avatar": "https://img1.doubanio.com/icon/user_normal.jpg",
                "signature": "",
                "alt": "https://www.douban.com/people/54667438/",
                "id": "54667438",
                "name": "shuoshiwoshuai"
            },
            "subject_id": "30461812",
            "content": "华为人士展现爱国情怀的快去看吧！",
            "created_at": "2019-03-08 20:09:47",
            "id": "1708361597"
        }
    ],
    "alt": "https://movie.douban.com/subject/30461812/",
    "id": "30461812",
    "mobile_url": "https://movie.douban.com/subject/30461812/mobile",
    "photos_count": 12,
    "pubdate": "2019-03-12",
    "title": "小石头下乡记",
    "do_count": null,
    "has_video": false,
    "share_url": "https://m.douban.com/movie/subject/30461812",
    "seasons_count": null,
    "languages": [
        "汉语普通话"
    ],
    "schedule_url": "",
    "writers": [
        {
            "avatars": {
                "small": "https://img1.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png",
                "large": "https://img3.doubanio.com/f/movie/63acc16ca6309ef191f0378faf793d1096a3e606/pics/movie/celebrity-default-large.png",
                "medium": "https://img1.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png"
            },
            "name_en": "",
            "name": "王海琴 ",
            "alt": "https://movie.douban.com/celebrity/1411201/",
            "id": "1411201"
        }
    ],
    "pubdates": [
        "2019-03-12(中国大陆)"
    ],
    "website": "",
    "tags": [
        "励志",
        "动作",
        "喜剧"
    ],
    "has_schedule": false,
    "durations": [
        "100分钟"
    ],
    "genres": [
        "剧情"
    ],
    "collection": null,
    "trailers": [
        {
            "medium": "https://img3.doubanio.com/img/trailer/medium/2548773831.jpg?1550742157",
            "title": "预告片",
            "subject_id": "30461812",
            "alt": "https://movie.douban.com/trailer/243496/",
            "small": "https://img3.doubanio.com/img/trailer/small/2548773831.jpg?1550742157",
            "resource_url": "http://vt1.doubanio.com/201903092043/bd4986f305a41029dbd873a9aae5438a/view/movie/M/302430496.mp4",
            "id": "243496"
        }
    ],
    "episodes_count": null,
    "trailer_urls": [
        "http://vt1.doubanio.com/201903092043/bd4986f305a41029dbd873a9aae5438a/view/movie/M/302430496.mp4"
    ],
    "has_ticket": false,
    "bloopers": [
        {
            "medium": "https://img3.doubanio.com/img/trailer/medium/2548774020.jpg?",
            "title": "其它花絮 (中文字幕)",
            "subject_id": "30461812",
            "alt": "https://movie.douban.com/trailer/243498/",
            "small": "https://img3.doubanio.com/img/trailer/small/2548774020.jpg?",
            "resource_url": "http://vt1.doubanio.com/201903092043/5464d5b3c129777ac66acfe26b449ec7/view/movie/M/302430498.mp4",
            "id": "243498"
        },
        {
            "medium": "https://img3.doubanio.com/img/trailer/medium/2548773942.jpg?1550742141",
            "title": "其它花絮",
            "subject_id": "30461812",
            "alt": "https://movie.douban.com/trailer/243497/",
            "small": "https://img3.doubanio.com/img/trailer/small/2548773942.jpg?1550742141",
            "resource_url": "http://vt1.doubanio.com/201903092043/0d4338c7061e5fdcb8979e7554cf3131/view/movie/M/302430497.mp4",
            "id": "243497"
        }
    ],
    "clip_urls": [],
    "current_season": null,
    "casts": [
        {
            "avatars": {
                "small": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735863.47.jpg",
                "large": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735863.47.jpg",
                "medium": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735863.47.jpg"
            },
            "name_en": "Yalong Zheng",
            "name": "郑亚龙",
            "alt": "https://movie.douban.com/celebrity/1388267/",
            "id": "1388267"
        },
        {
            "avatars": {
                "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735879.26.jpg",
                "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735879.26.jpg",
                "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735879.26.jpg"
            },
            "name_en": "",
            "name": "宋铁梁",
            "alt": "https://movie.douban.com/celebrity/1411202/",
            "id": "1411202"
        },
        {
            "avatars": {
                "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735937.93.jpg",
                "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735937.93.jpg",
                "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735937.93.jpg"
            },
            "name_en": "Yue Li",
            "name": "李月",
            "alt": "https://movie.douban.com/celebrity/1388266/",
            "id": "1388266"
        },
        {
            "avatars": {
                "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735955.52.jpg",
                "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735955.52.jpg",
                "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735955.52.jpg"
            },
            "name_en": "",
            "name": "郭王军",
            "alt": "https://movie.douban.com/celebrity/1411203/",
            "id": "1411203"
        }
    ],
    "countries": [
        "中国大陆"
    ],
    "mainland_pubdate": "2019-03-12",
    "photos": [
        {
            "thumb": "https://img1.doubanio.com/view/photo/m/public/p2548772697.jpg",
            "image": "https://img1.doubanio.com/view/photo/l/public/p2548772697.jpg",
            "cover": "https://img1.doubanio.com/view/photo/sqs/public/p2548772697.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772697/",
            "id": "2548772697",
            "icon": "https://img1.doubanio.com/view/photo/s/public/p2548772697.jpg"
        },
        {
            "thumb": "https://img3.doubanio.com/view/photo/m/public/p2548772696.jpg",
            "image": "https://img3.doubanio.com/view/photo/l/public/p2548772696.jpg",
            "cover": "https://img3.doubanio.com/view/photo/sqs/public/p2548772696.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772696/",
            "id": "2548772696",
            "icon": "https://img3.doubanio.com/view/photo/s/public/p2548772696.jpg"
        },
        {
            "thumb": "https://img3.doubanio.com/view/photo/m/public/p2548772695.jpg",
            "image": "https://img3.doubanio.com/view/photo/l/public/p2548772695.jpg",
            "cover": "https://img3.doubanio.com/view/photo/sqs/public/p2548772695.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772695/",
            "id": "2548772695",
            "icon": "https://img3.doubanio.com/view/photo/s/public/p2548772695.jpg"
        },
        {
            "thumb": "https://img3.doubanio.com/view/photo/m/public/p2548772694.jpg",
            "image": "https://img3.doubanio.com/view/photo/l/public/p2548772694.jpg",
            "cover": "https://img3.doubanio.com/view/photo/sqs/public/p2548772694.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772694/",
            "id": "2548772694",
            "icon": "https://img3.doubanio.com/view/photo/s/public/p2548772694.jpg"
        },
        {
            "thumb": "https://img3.doubanio.com/view/photo/m/public/p2548772692.jpg",
            "image": "https://img3.doubanio.com/view/photo/l/public/p2548772692.jpg",
            "cover": "https://img3.doubanio.com/view/photo/sqs/public/p2548772692.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772692/",
            "id": "2548772692",
            "icon": "https://img3.doubanio.com/view/photo/s/public/p2548772692.jpg"
        },
        {
            "thumb": "https://img3.doubanio.com/view/photo/m/public/p2548772691.jpg",
            "image": "https://img3.doubanio.com/view/photo/l/public/p2548772691.jpg",
            "cover": "https://img3.doubanio.com/view/photo/sqs/public/p2548772691.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772691/",
            "id": "2548772691",
            "icon": "https://img3.doubanio.com/view/photo/s/public/p2548772691.jpg"
        },
        {
            "thumb": "https://img3.doubanio.com/view/photo/m/public/p2548772690.jpg",
            "image": "https://img3.doubanio.com/view/photo/l/public/p2548772690.jpg",
            "cover": "https://img3.doubanio.com/view/photo/sqs/public/p2548772690.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772690/",
            "id": "2548772690",
            "icon": "https://img3.doubanio.com/view/photo/s/public/p2548772690.jpg"
        },
        {
            "thumb": "https://img1.doubanio.com/view/photo/m/public/p2548772689.jpg",
            "image": "https://img1.doubanio.com/view/photo/l/public/p2548772689.jpg",
            "cover": "https://img1.doubanio.com/view/photo/sqs/public/p2548772689.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772689/",
            "id": "2548772689",
            "icon": "https://img1.doubanio.com/view/photo/s/public/p2548772689.jpg"
        },
        {
            "thumb": "https://img1.doubanio.com/view/photo/m/public/p2548772688.jpg",
            "image": "https://img1.doubanio.com/view/photo/l/public/p2548772688.jpg",
            "cover": "https://img1.doubanio.com/view/photo/sqs/public/p2548772688.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772688/",
            "id": "2548772688",
            "icon": "https://img1.doubanio.com/view/photo/s/public/p2548772688.jpg"
        },
        {
            "thumb": "https://img1.doubanio.com/view/photo/m/public/p2548772687.jpg",
            "image": "https://img1.doubanio.com/view/photo/l/public/p2548772687.jpg",
            "cover": "https://img1.doubanio.com/view/photo/sqs/public/p2548772687.jpg",
            "alt": "https://movie.douban.com/photos/photo/2548772687/",
            "id": "2548772687",
            "icon": "https://img1.doubanio.com/view/photo/s/public/p2548772687.jpg"
        }
    ],
    "summary": "《小石头下乡记》是一部以脱贫攻坚为题材的电影。影片主要讲述主人公小石头下乡扶贫过程中发生的一系列的故事，来展示全市脱贫攻坚伟大战役和向贫困宣战的决心，展示党委政府不忘初心、让人民群众过上幸福生活的不懈追求，展示扶贫干部勇于担当、敢于奉献，舍小家顾大家的公仆情怀。",
    "clips": [],
    "subtype": "movie",
    "directors": [
        {
            "avatars": {
                "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735641.06.jpg",
                "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735641.06.jpg",
                "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1550735641.06.jpg"
            },
            "name_en": "Lei Zhang",
            "name": "张雷",
            "alt": "https://movie.douban.com/celebrity/1388265/",
            "id": "1388265"
        }
    ],
    "comments_count": 3,
    "popular_reviews": [],
    "ratings_count": 7,
    "aka": [
        "A Little Stone Goes Down to the Countryside"
    ]
}
```

##  9. <a name='movie_photo'></a>影片剧照
URL：http://api.douban.com/v2/movie/subject/:movieId/photos?apikey=********

返回数据格式：(很奇怪，这里的 count 又有 end 的意思:dizzy_face:)
```json
{
    "count": 20,
    "photos": [
        {
            "photos_count": 42,
            "thumb": "https://img3.doubanio.com/view/photo/m/public/p2533230253.jpg",
            "icon": "https://img3.doubanio.com/view/photo/s/public/p2533230253.jpg",
            "author": {
                "uid": "155724691",
                "avatar": "http://img1.doubanio.com/icon/u155724691-5.jpg",
                "signature": "",
                "alt": "https://www.douban.com/people/155724691/",
                "id": "155724691",
                "name": "ham093"
            },
            "created_at": "2018-09-04 22:02:24",
            "album_id": "1677402657",
            "cover": "https://img3.doubanio.com/view/photo/sqs/public/p2533230253.jpg",
            "id": "2533230253",
            "prev_photo": "2533230259",
            "album_url": "https://movie.douban.com/subject/27624661/photos",
            "comments_count": 9,
            "image": "https://img3.doubanio.com/view/photo/l/public/p2533230253.jpg",
            "recs_count": 0,
            "position": 39,
            "alt": "https://movie.douban.com/photos/photo/2533230253/",
            "album_title": "比悲伤更悲伤的故事(27624661)",
            "next_photo": "2533230249",
            "subject_id": "27624661",
            "desc": ""
        },
    ],
        "durations": [
            "105分钟"
        ],
        "collect_count": 1467,
        "mainland_pubdate": "2019-03-14",
        "has_video": false,
        "original_title": "比悲傷更悲傷的故事",
        "subtype": "movie",
        "directors": [
            {
                "avatars": {
                    "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p44818.jpg",
                    "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p44818.jpg",
                    "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p44818.jpg"
                },
                "name_en": "Hsiao Chien Lin",
                "name": "林孝谦",
                "alt": "https://movie.douban.com/celebrity/1312860/",
                "id": "1312860"
            }
        ],
        "pubdates": [
            "2018-11-30(台湾)",
            "2019-03-14(中国大陆)"
        ],
        "year": "2018",
        "images": {
            "small": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2549523952.jpg",
            "large": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2549523952.jpg",
            "medium": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2549523952.jpg"
        },
        "alt": "https://movie.douban.com/subject/27624661/",
        "id": "27624661"
    }
}
```

##  10. <a name='actor'></a>演员详细信息
URL：http://api.douban.com/v2/movie/celebrity/:actorId?apikey=********

返回数据格式：
```json
{
    "website": "",
    "mobile_url": "https://movie.douban.com/celebrity/1274242/mobile",
    "aka_en": [
        ""
    ],
    "name": "黄渤",
    "works": [
        {
            "roles": [
                "演员"
            ],
            "subject": {
                "rating": {
                    "max": 10,
                    "average": 9.5,
                    "details": {
                        "1": 14,
                        "2": 19,
                        "3": 163,
                        "4": 896,
                        "5": 3952
                    },
                    "stars": "50",
                    "min": 0
                },
                "genres": [
                    "剧情"
                ],
                "title": "生存之民工",
                "casts": [
                    {
                        "avatars": {
                            "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p6619.jpg",
                            "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p6619.jpg",
                            "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p6619.jpg"
                        },
                        "name_en": "Zeru Tao",
                        "name": "陶泽如",
                        "alt": "https://movie.douban.com/celebrity/1039767/",
                        "id": "1039767"
                    },
                    {
                        "avatars": {
                            "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1466056207.9.jpg",
                            "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1466056207.9.jpg",
                            "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1466056207.9.jpg"
                        },
                        "name_en": "Yongdai Ding",
                        "name": "丁勇岱",
                        "alt": "https://movie.douban.com/celebrity/1314975/",
                        "id": "1314975"
                    },
                    {
                        "avatars": {
                            "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p38286.jpg",
                            "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p38286.jpg",
                            "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p38286.jpg"
                        },
                        "name_en": "Shaohua Ma",
                        "name": "马少骅",
                        "alt": "https://movie.douban.com/celebrity/1274966/",
                        "id": "1274966"
                    }
                ],
                "durations": [
                    "42分钟"
                ],
                "collect_count": 7839,
                "mainland_pubdate": "2005-02-20",
                "has_video": true,
                "original_title": "生存之民工",
                "subtype": "tv",
                "directors": [
                    {
                        "avatars": {
                            "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p8171.jpg",
                            "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p8171.jpg",
                            "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p8171.jpg"
                        },
                        "name_en": "Hu Guan",
                        "name": "管虎",
                        "alt": "https://movie.douban.com/celebrity/1274919/",
                        "id": "1274919"
                    },
                    {
                        "avatars": {
                            "small": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p55965.jpg",
                            "large": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p55965.jpg",
                            "medium": "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p55965.jpg"
                        },
                        "name_en": "Ning Kang",
                        "name": "康宁",
                        "alt": "https://movie.douban.com/celebrity/1323003/",
                        "id": "1323003"
                    }
                ],
                "pubdates": [
                    "2005-02-20(中国大陆)"
                ],
                "year": "2005",
                "images": {
                    "small": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2455605610.jpg",
                    "large": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2455605610.jpg",
                    "medium": "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2455605610.jpg"
                },
                "alt": "https://movie.douban.com/subject/2259815/",
                "id": "2259815"
            }
        },
    ],
    "name_en": "Bo Huang",
    "gender": "男",
    "professions": [
        "",
        "",
        "",
        "导演",
        "编剧"
    ],
    "avatars": {
        "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1656.jpg",
        "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1656.jpg",
        "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1656.jpg"
    },
    "summary": "　　黄渤不但具有专业的表演素质，在他身上更散发着来自内心的真实与质朴。他曾经做过歌手、节目主持人和舞蹈编导，后来又经过了专业的配音学习，这些丰富的人生经历，使他更具备了优于其他演艺新人的专业素质。\r\n　　黄渤毕业于北京电影学院配音专业。在就读电影学院之前就参加过管虎导演的作品演出，包括大家熟悉的电视电影《上车，走吧》、电视剧《黑洞》。其中《上车，走吧》不但获得了该年度的金鸡奖最佳电视电影奖，黄渤更凭片中的出色演出，受到了业内人士及广大观众对其演技的认可。《生存之民工》是黄渤与导演管虎的第三次合作，两人已默契十足，管虎在黄渤身上发掘出更深层的潜质。剧中他朴实、自然的表演受到了导演和前辈演员们的大力肯定。他还曾为《海底总动员》、《加勒比海盗》、《绿巨人》、《谁陷害了兔子罗杰》等大片做中文配音。\r\n　　2006年，黄渤出演的两部电影都在暑期上映，一部是《新街口》，另一部是《疯狂的石头》，后者受到票房和口碑的双重好评，而黄渤主演的黑皮更是博得大多数观众的喝彩，在电影方面可以说上了一个新的台阶。\r\n　　之后黄渤作品不断，两部《大电影》、《大灌篮》、与香港电影人合作的《每当变幻时》、《高兴》等等，都见证着黄渤演技的日益精进。2009年黄渤更是一口气推出《疯狂的赛车》、《斗牛》、《铁人》、《倔强萝卜》等多部影片，风头无两。并凭借在《斗牛》中的精彩表现，获得第46届台湾电影金马奖影帝桂冠。",
    "photos": [
        {
            "thumb": "https://img1.doubanio.com/view/photo/m/public/p2220782208.jpg",
            "image": "https://img1.doubanio.com/view/photo/l/public/p2220782208.jpg",
            "cover": "https://img1.doubanio.com/view/photo/sqs/public/p2220782208.jpg",
            "alt": "https://movie.douban.com/celebrity/1274242/photo/2220782208/",
            "id": "2220782208",
            "icon": "https://img1.doubanio.com/view/photo/s/public/p2220782208.jpg"
        },
    ],
    "birthday": "1974-08-26",
    "aka": [
        "渤哥"
    ],
    "alt": "https://movie.douban.com/celebrity/1274242/",
    "born_place": "中国,山东,青岛",
    "constellation": "处女座",
    "id": "1274242"
}
```

##  11. <a name='actor_photo'></a>演员相册
URL：http://api.douban.com/v2/movie/celebrity/:actorId/photos?apikey=********

返回数据(很奇怪，这里的 count 又有 end 的意思:dizzy_face:)：
```json
{
    "count": 20,
    "photos": [
        {
            "photos_count": 249,
            "thumb": "https://img1.doubanio.com/view/photo/m/public/p2220782208.jpg",
            "icon": "https://img1.doubanio.com/view/photo/s/public/p2220782208.jpg",
            "author": {
                "uid": "54840470",
                "avatar": "http://img1.doubanio.com/icon/u54840470-13.jpg",
                "signature": "",
                "alt": "https://www.douban.com/people/54840470/",
                "id": "54840470",
                "name": "Jamais"
            },
            "created_at": "2015-01-06 15:25:24",
            "album_id": "47045143",
            "cover": "https://img1.doubanio.com/view/photo/sqs/public/p2220782208.jpg",
            "id": "2220782208",
            "prev_photo": "2221661327",
            "album_url": "https://movie.douban.com/celebrity/1274242/photos/",
            "comments_count": 56,
            "image": "https://img1.doubanio.com/view/photo/l/public/p2220782208.jpg",
            "recs_count": 2,
            "position": 76,
            "alt": "https://movie.douban.com/celebrity/1274242/photo/2220782208/",
            "album_title": "影人图片:黄渤  Bo Huang",
            "next_photo": "2220107865",
            "subject_id": "1274242",
            "desc": "黑冰摄影创建人严蓉晖在微博晒演员黄渤为某网站拍摄的大片"
        },
    ],
    "celebrity": {
        "avatars": {
            "small": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1656.jpg",
            "large": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1656.jpg",
            "medium": "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1656.jpg"
        },
        "name_en": "Bo Huang",
        "name": "黄渤",
        "alt": "https://movie.douban.com/celebrity/1274242/",
        "id": "1274242"
    },
    "total": 249,
    "start": 0
}

```