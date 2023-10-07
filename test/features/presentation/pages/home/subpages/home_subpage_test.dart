import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as img;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart';
import 'package:last_fm/features/presentation/bloc/get_top_albums_bloc/top_albums_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:last_fm/core/di/injection_getit.dart' as di;
import 'package:last_fm/features/presentation/pages/home/subpages/home_subpage.dart';

import '../../../../../widget_test.dart';
import 'home_subpage_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetTopAlbumsBloc>()])
void main() async {
  await di.init();
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Home Sub Page test", (widgetTester) async {
    GetTopAlbumsBloc bloc = MockGetTopAlbumsBloc();

    // Stub the listen with a fake Stream
    // when(bloc.state).thenReturnInOrder([
    //   GettingTopAlbumsInitialStatus(),
    //   LoadingTopAlbumsStatus(),
    //   TopAlbumsRetrievedSuccessfullyStatus(Topalbums.fromJson({
    //     "topalbums": {
    //       "album": [
    //         {
    //           "name": "Believe",
    //           "playcount": 5038588,
    //           "mbid": "63b3a8ca-26f2-4e2b-b867-647a6ec2bebd",
    //           "url": "https://www.last.fm/music/Cher/Believe",
    //           "artist": {
    //             "name": "Cher",
    //             "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
    //             "url": "https://www.last.fm/music/Cher"
    //           },
    //           "image": [
    //             {
    //               "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3b54885952161aaea4ce2965b2db1638.png",
    //               "size": "small"
    //             },
    //             {
    //               "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3b54885952161aaea4ce2965b2db1638.png",
    //               "size": "medium"
    //             },
    //             {
    //               "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3b54885952161aaea4ce2965b2db1638.png",
    //               "size": "large"
    //             },
    //             {
    //               "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png",
    //               "size": "extralarge"
    //             }
    //           ]
    //         }
    //       ],
    //       "@attr": {
    //         "artist": "Cher",
    //         "page": "1",
    //         "perPage": "50",
    //         "totalPages": "783",
    //         "total": "39103"
    //       }
    //     }
    //   }))
    // ]);

    when(bloc.state).thenReturn(
      TopAlbumsRetrievedSuccessfullyStatus(Topalbums.fromJson({
        "album": [
          {
            "name": "Believe",
            "playcount": 5038588,
            "mbid": "63b3a8ca-26f2-4e2b-b867-647a6ec2bebd",
            "url": "https://www.last.fm/music/Cher/Believe",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3b54885952161aaea4ce2965b2db1638.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3b54885952161aaea4ce2965b2db1638.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3b54885952161aaea4ce2965b2db1638.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "The Very Best of Cher",
            "playcount": 1745991,
            "mbid": "a7e2dad7-e733-4bee-9db1-b31e3183eaf5",
            "url": "https://www.last.fm/music/Cher/The+Very+Best+of+Cher",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0fd942f7e629a01ec2d067e41464ff5d.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0fd942f7e629a01ec2d067e41464ff5d.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0fd942f7e629a01ec2d067e41464ff5d.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0fd942f7e629a01ec2d067e41464ff5d.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Heart of Stone",
            "playcount": 1675593,
            "mbid": "7468fc70-9cba-4bad-a2a8-4201221f54fe",
            "url": "https://www.last.fm/music/Cher/Heart+of+Stone",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e8f76af3d702f7850ba5a4c9fa055030.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e8f76af3d702f7850ba5a4c9fa055030.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e8f76af3d702f7850ba5a4c9fa055030.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e8f76af3d702f7850ba5a4c9fa055030.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "It's a Man's World",
            "playcount": 686550,
            "mbid": "e4e7db8a-2622-47d3-80a5-91534d523ac5",
            "url": "https://www.last.fm/music/Cher/It%27s+a+Man%27s+World",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0b094c3f712039f9b83d95a20f4419b4.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0b094c3f712039f9b83d95a20f4419b4.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0b094c3f712039f9b83d95a20f4419b4.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0b094c3f712039f9b83d95a20f4419b4.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Cher's Greatest Hits: 1965-1992",
            "playcount": 605281,
            "url": "https://www.last.fm/music/Cher/Cher%27s+Greatest+Hits:+1965-1992",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/1dbe42fcbdbf3d444d42feb18d76897a.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/1dbe42fcbdbf3d444d42feb18d76897a.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/1dbe42fcbdbf3d444d42feb18d76897a.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/1dbe42fcbdbf3d444d42feb18d76897a.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Love Hurts",
            "playcount": 703280,
            "mbid": "d52885f4-5444-4361-a1f3-ac4d079b603d",
            "url": "https://www.last.fm/music/Cher/Love+Hurts",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/f0c8b6840a1ad44b095dc9e68384d0e4.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/f0c8b6840a1ad44b095dc9e68384d0e4.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/f0c8b6840a1ad44b095dc9e68384d0e4.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/f0c8b6840a1ad44b095dc9e68384d0e4.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Living Proof",
            "playcount": 876436,
            "mbid": "182a2ec8-f717-4e06-a88e-604db80ab4aa",
            "url": "https://www.last.fm/music/Cher/Living+Proof",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3c84e9ba3b7757328d2d954c3452fd6a.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3c84e9ba3b7757328d2d954c3452fd6a.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3c84e9ba3b7757328d2d954c3452fd6a.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3c84e9ba3b7757328d2d954c3452fd6a.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "The Greatest Hits",
            "playcount": 567606,
            "mbid": "023af53b-2a8f-467e-aadc-307b3372ecc2",
            "url": "https://www.last.fm/music/Cher/The+Greatest+Hits",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/2563ce273c65e39dfe7ea691752237fe.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/2563ce273c65e39dfe7ea691752237fe.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/2563ce273c65e39dfe7ea691752237fe.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/2563ce273c65e39dfe7ea691752237fe.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Dancing Queen",
            "playcount": 986837,
            "url": "https://www.last.fm/music/Cher/Dancing+Queen",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/6a1e5db8a6831635bcba07652d48431f.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/6a1e5db8a6831635bcba07652d48431f.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/6a1e5db8a6831635bcba07652d48431f.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/6a1e5db8a6831635bcba07652d48431f.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Gypsys, Tramps & Thieves",
            "playcount": 358750,
            "mbid": "ac1d49a5-611e-4895-921d-83cbec6d1df6",
            "url": "https://www.last.fm/music/Cher/Gypsys,+Tramps+&+Thieves",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/78851f1f73d714f213d2d8ca54b773e7.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/78851f1f73d714f213d2d8ca54b773e7.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/78851f1f73d714f213d2d8ca54b773e7.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/78851f1f73d714f213d2d8ca54b773e7.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Half Breed",
            "playcount": 176045,
            "mbid": "95945817-ebd8-4d3e-bb5f-fcb22de001ca",
            "url": "https://www.last.fm/music/Cher/Half+Breed",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/75bfb65988650dd70014a64dc1c60380.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/75bfb65988650dd70014a64dc1c60380.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/75bfb65988650dd70014a64dc1c60380.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/75bfb65988650dd70014a64dc1c60380.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Cher",
            "playcount": 459548,
            "mbid": "368fc15c-e01c-4ad8-8fb3-26c44c695c84",
            "url": "https://www.last.fm/music/Cher/Cher",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/00d51d34b6113534ebb1748d527dc1a2.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/00d51d34b6113534ebb1748d527dc1a2.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/00d51d34b6113534ebb1748d527dc1a2.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/00d51d34b6113534ebb1748d527dc1a2.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "The Best of Cher",
            "playcount": 73234,
            "mbid": "0128541a-3b4e-4bb9-8b82-344ab851c6de",
            "url": "https://www.last.fm/music/Cher/The+Best+of+Cher",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3ce954554b1c669cb7a8e22344ccd855.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3ce954554b1c669cb7a8e22344ccd855.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3ce954554b1c669cb7a8e22344ccd855.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3ce954554b1c669cb7a8e22344ccd855.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Burlesque Original Motion Picture Soundtrack",
            "playcount": 205524,
            "url": "https://www.last.fm/music/Cher/Burlesque+Original+Motion+Picture+Soundtrack",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4c74915a7be542ad84673b8ac9d98905.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4c74915a7be542ad84673b8ac9d98905.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4c74915a7be542ad84673b8ac9d98905.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4c74915a7be542ad84673b8ac9d98905.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Gimme! Gimme! Gimme! (A Man After Midnight)",
            "playcount": 186353,
            "url": "https://www.last.fm/music/Cher/Gimme%21+Gimme%21+Gimme%21+(A+Man+After+Midnight)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/720c2418d2c2c67d060ba600a18d72de.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/720c2418d2c2c67d060ba600a18d72de.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/720c2418d2c2c67d060ba600a18d72de.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/720c2418d2c2c67d060ba600a18d72de.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Take Me Home & Prisoner",
            "playcount": 52160,
            "url": "https://www.last.fm/music/Cher/Take+Me+Home+&+Prisoner",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/007759bbe10642db8f023e4c276ba6f3.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/007759bbe10642db8f023e4c276ba6f3.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/007759bbe10642db8f023e4c276ba6f3.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/007759bbe10642db8f023e4c276ba6f3.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Gold",
            "playcount": 213465,
            "mbid": "9880981e-90ba-4767-9473-4d058bcd099f",
            "url": "https://www.last.fm/music/Cher/Gold",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/006f407fc9e04060d2d4ec0cc567e4e6.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/006f407fc9e04060d2d4ec0cc567e4e6.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/006f407fc9e04060d2d4ec0cc567e4e6.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/006f407fc9e04060d2d4ec0cc567e4e6.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Greatest Hits",
            "playcount": 119568,
            "mbid": "ec3f4f8d-1852-4407-9969-7baba18e6e37",
            "url": "https://www.last.fm/music/Cher/Greatest+Hits",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/2442686feafc9454f13028e81dc4edc8.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/2442686feafc9454f13028e81dc4edc8.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/2442686feafc9454f13028e81dc4edc8.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/2442686feafc9454f13028e81dc4edc8.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Closer to the Truth",
            "playcount": 835597,
            "url": "https://www.last.fm/music/Cher/Closer+to+the+Truth",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4eed0361b0916ddb22ed26b511f61d82.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4eed0361b0916ddb22ed26b511f61d82.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4eed0361b0916ddb22ed26b511f61d82.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4eed0361b0916ddb22ed26b511f61d82.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Strong Enough",
            "playcount": 83392,
            "mbid": "92aa86fd-f1c9-4b74-b2d7-711f9765e936",
            "url": "https://www.last.fm/music/Cher/Strong+Enough",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/f84c7c1a7f0040b2ac7e8554ab60e0d4.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/f84c7c1a7f0040b2ac7e8554ab60e0d4.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/f84c7c1a7f0040b2ac7e8554ab60e0d4.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/f84c7c1a7f0040b2ac7e8554ab60e0d4.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Take Me Home",
            "playcount": 192417,
            "mbid": "9cd2ad21-ad13-4490-bc58-22943cd89380",
            "url": "https://www.last.fm/music/Cher/Take+Me+Home",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/d202553ca6f12009f36678f86237bdee.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/d202553ca6f12009f36678f86237bdee.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/d202553ca6f12009f36678f86237bdee.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/d202553ca6f12009f36678f86237bdee.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "(null)",
            "playcount": 170147,
            "url": "https://www.last.fm/music/Cher/(null)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "",
                "size": "small"
              },
              {
                "#text": "",
                "size": "medium"
              },
              {
                "#text": "",
                "size": "large"
              },
              {
                "#text": "",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Closer To the Truth (Deluxe Version)",
            "playcount": 490917,
            "mbid": "4003e2bb-e868-431f-a086-f53d557606c9",
            "url": "https://www.last.fm/music/Cher/Closer+To+the+Truth+(Deluxe+Version)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/60cb3aa538f918b5251210ce41578cd8.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/60cb3aa538f918b5251210ce41578cd8.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/60cb3aa538f918b5251210ce41578cd8.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/60cb3aa538f918b5251210ce41578cd8.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "All I Really Want to Do",
            "playcount": 149078,
            "mbid": "5e37a247-b02f-4c29-8349-0655091051ac",
            "url": "https://www.last.fm/music/Cher/All+I+Really+Want+to+Do",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/42fff15cfd6ce40dbc921e3b6c2bf089.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/42fff15cfd6ce40dbc921e3b6c2bf089.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/42fff15cfd6ce40dbc921e3b6c2bf089.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/42fff15cfd6ce40dbc921e3b6c2bf089.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Closer to the Truth (Deluxe Edition)",
            "playcount": 147418,
            "url": "https://www.last.fm/music/Cher/Closer+to+the+Truth+(Deluxe+Edition)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/39218b7f49f849f1833732dfc48f623b.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/39218b7f49f849f1833732dfc48f623b.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/39218b7f49f849f1833732dfc48f623b.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/39218b7f49f849f1833732dfc48f623b.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "The Best of Cher (The Imperial Recordings: 1965-1968)",
            "playcount": 87546,
            "url": "https://www.last.fm/music/Cher/The+Best+of+Cher+(The+Imperial+Recordings:+1965-1968)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/a71d30221df988721bdee846ea87161a.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/a71d30221df988721bdee846ea87161a.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/a71d30221df988721bdee846ea87161a.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/a71d30221df988721bdee846ea87161a.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Dark Lady",
            "playcount": 179115,
            "mbid": "aa119742-4d13-408a-a453-be54bc79ba61",
            "url": "https://www.last.fm/music/Cher/Dark+Lady",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/28fe29bb838bbbc910b326a37e7018de.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/28fe29bb838bbbc910b326a37e7018de.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/28fe29bb838bbbc910b326a37e7018de.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/28fe29bb838bbbc910b326a37e7018de.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "20th Century Masters: The Millennium Collection: Best Of Cher",
            "playcount": 63801,
            "url": "https://www.last.fm/music/Cher/20th+Century+Masters:+The+Millennium+Collection:+Best+Of+Cher",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/03018d6665472a64d7e5fd1bceb8f221.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/03018d6665472a64d7e5fd1bceb8f221.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/03018d6665472a64d7e5fd1bceb8f221.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/03018d6665472a64d7e5fd1bceb8f221.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Love Hurts (UK Mid Price)",
            "playcount": 34897,
            "url": "https://www.last.fm/music/Cher/Love+Hurts+(UK+Mid+Price)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0e462b0a71bfc5aa4d3ea7ed388df518.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0e462b0a71bfc5aa4d3ea7ed388df518.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0e462b0a71bfc5aa4d3ea7ed388df518.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0e462b0a71bfc5aa4d3ea7ed388df518.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Greatest Hits: If I Could Turn Back Time",
            "playcount": 19531,
            "mbid": "2fba163f-011f-4c8e-a133-78b397443e78",
            "url": "https://www.last.fm/music/Cher/Greatest+Hits:+If+I+Could+Turn+Back+Time",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/b9206389bebc2cd12eafaa549ba6e0b3.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/b9206389bebc2cd12eafaa549ba6e0b3.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/b9206389bebc2cd12eafaa549ba6e0b3.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/b9206389bebc2cd12eafaa549ba6e0b3.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Bang Bang: The Early Years",
            "playcount": 52446,
            "url": "https://www.last.fm/music/Cher/Bang+Bang:+The+Early+Years",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e2655b999d0a4b0e993b31479bf23dd0.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e2655b999d0a4b0e993b31479bf23dd0.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e2655b999d0a4b0e993b31479bf23dd0.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e2655b999d0a4b0e993b31479bf23dd0.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "The Sonny Side of Chér",
            "playcount": 61329,
            "mbid": "555c4b26-a6f8-4fcb-8407-3909e035f003",
            "url": "https://www.last.fm/music/Cher/The+Sonny+Side+of+Ch%C3%A9r",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/c2e5b3651662a2504b345602496e9c0d.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/c2e5b3651662a2504b345602496e9c0d.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/c2e5b3651662a2504b345602496e9c0d.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/c2e5b3651662a2504b345602496e9c0d.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Burlesque",
            "playcount": 164589,
            "url": "https://www.last.fm/music/Cher/Burlesque",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0a2760c4699a483086c8eba8ebc5eca1.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0a2760c4699a483086c8eba8ebc5eca1.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0a2760c4699a483086c8eba8ebc5eca1.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0a2760c4699a483086c8eba8ebc5eca1.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Fernando (From \"Mamma Mia! Here We Go Again\")",
            "playcount": 40167,
            "url": "https://www.last.fm/music/Cher/Fernando+(From+%22Mamma+Mia%21+Here+We+Go+Again%22)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/a1f4e8c6fd31f2c333d510b097ce40f0.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/a1f4e8c6fd31f2c333d510b097ce40f0.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/a1f4e8c6fd31f2c333d510b097ce40f0.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/a1f4e8c6fd31f2c333d510b097ce40f0.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "3614 Jackson Highway",
            "playcount": 100164,
            "mbid": "a67bf28f-d1f5-4fcc-b408-4ef625402dc2",
            "url": "https://www.last.fm/music/Cher/3614+Jackson+Highway",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4ff33ca218f3b0e3095d675ea5a68084.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4ff33ca218f3b0e3095d675ea5a68084.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4ff33ca218f3b0e3095d675ea5a68084.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4ff33ca218f3b0e3095d675ea5a68084.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "If I Could Turn Back Time - Cher's Greatest Hits",
            "playcount": 61281,
            "url": "https://www.last.fm/music/Cher/If+I+Could+Turn+Back+Time+-+Cher%27s+Greatest+Hits",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ff9b25b827134d87b5dee238f8e8c922.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ff9b25b827134d87b5dee238f8e8c922.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ff9b25b827134d87b5dee238f8e8c922.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ff9b25b827134d87b5dee238f8e8c922.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Half-Breed",
            "playcount": 84579,
            "url": "https://www.last.fm/music/Cher/Half-Breed",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e867b775fa350be3ae4cec7c2c40de4f.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e867b775fa350be3ae4cec7c2c40de4f.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e867b775fa350be3ae4cec7c2c40de4f.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e867b775fa350be3ae4cec7c2c40de4f.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "The Very Best of Cher [Warner Bros #1]",
            "playcount": 79537,
            "url": "https://www.last.fm/music/Cher/The+Very+Best+of+Cher+%5BWarner+Bros+%231%5D",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3642566fa36747fba307b0fbcd916bb7.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3642566fa36747fba307b0fbcd916bb7.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3642566fa36747fba307b0fbcd916bb7.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3642566fa36747fba307b0fbcd916bb7.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Song for the Lonely",
            "playcount": 18160,
            "mbid": "cd4de50c-905a-4045-89a3-6576cc2f4f5b",
            "url": "https://www.last.fm/music/Cher/Song+for+the+Lonely",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/11b14ef18e1d4dacb2f58d42287e1cc0.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/11b14ef18e1d4dacb2f58d42287e1cc0.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/11b14ef18e1d4dacb2f58d42287e1cc0.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/11b14ef18e1d4dacb2f58d42287e1cc0.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "All Or Nothing",
            "playcount": 20974,
            "mbid": "28e23680-1c42-4d87-83ae-d74752538d3c",
            "url": "https://www.last.fm/music/Cher/All+Or+Nothing",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/5ab99d48a9dd91ec9bc3f1861932c5e3.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/5ab99d48a9dd91ec9bc3f1861932c5e3.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/5ab99d48a9dd91ec9bc3f1861932c5e3.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/5ab99d48a9dd91ec9bc3f1861932c5e3.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "A Different Kind of Love Song",
            "playcount": 16757,
            "mbid": "f8912620-c18c-446b-9183-c558935b7689",
            "url": "https://www.last.fm/music/Cher/A+Different+Kind+of+Love+Song",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/043c5e02bac471e8e23d1e55145079c0.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/043c5e02bac471e8e23d1e55145079c0.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/043c5e02bac471e8e23d1e55145079c0.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/043c5e02bac471e8e23d1e55145079c0.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Mamma Mia! Here We Go Again (Original Motion Picture Soundtrack)",
            "playcount": 43267,
            "url": "https://www.last.fm/music/Cher/Mamma+Mia%21+Here+We+Go+Again+(Original+Motion+Picture+Soundtrack)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/95b24a325896087b372e7f64832a4ead.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/95b24a325896087b372e7f64832a4ead.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/95b24a325896087b372e7f64832a4ead.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/95b24a325896087b372e7f64832a4ead.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "SOS",
            "playcount": 39922,
            "url": "https://www.last.fm/music/Cher/SOS",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/69dc16655f09609fe2eb558c30f1da1b.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/69dc16655f09609fe2eb558c30f1da1b.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/69dc16655f09609fe2eb558c30f1da1b.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/69dc16655f09609fe2eb558c30f1da1b.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Burlesque (Original Motion Picture Soundtrack)",
            "playcount": 90717,
            "url": "https://www.last.fm/music/Cher/Burlesque+(Original+Motion+Picture+Soundtrack)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/9ef4eaedbae04430bfc78e23c5d3ee2b.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/9ef4eaedbae04430bfc78e23c5d3ee2b.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/9ef4eaedbae04430bfc78e23c5d3ee2b.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/9ef4eaedbae04430bfc78e23c5d3ee2b.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Believe (Remixes)",
            "playcount": 24985,
            "url": "https://www.last.fm/music/Cher/Believe+(Remixes)",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/a71b70cced42876de6ff3715eebeebe6.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/a71b70cced42876de6ff3715eebeebe6.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/a71b70cced42876de6ff3715eebeebe6.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/a71b70cced42876de6ff3715eebeebe6.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "If I Could Turn Back Time: Cher's Greatest Hits",
            "playcount": 58409,
            "url": "https://www.last.fm/music/Cher/If+I+Could+Turn+Back+Time:+Cher%27s+Greatest+Hits",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/715456b0eae34bd5cbc66de82b57164c.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/715456b0eae34bd5cbc66de82b57164c.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/715456b0eae34bd5cbc66de82b57164c.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/715456b0eae34bd5cbc66de82b57164c.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "The Music's No Good Without You",
            "playcount": 14887,
            "mbid": "efbb6230-96ce-4820-b8ca-ac5fc73300c2",
            "url": "https://www.last.fm/music/Cher/The+Music%27s+No+Good+Without+You",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/d76f74c6deffd8a96733c74877e6816f.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/d76f74c6deffd8a96733c74877e6816f.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/d76f74c6deffd8a96733c74877e6816f.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/d76f74c6deffd8a96733c74877e6816f.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Woman's World",
            "playcount": 61022,
            "mbid": "5c3a4ee5-3add-4b87-abb3-d4ab7fa50f69",
            "url": "https://www.last.fm/music/Cher/Woman%27s+World",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/c175ef57aa5a4c338817df9ea83add31.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/c175ef57aa5a4c338817df9ea83add31.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/c175ef57aa5a4c338817df9ea83add31.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/c175ef57aa5a4c338817df9ea83add31.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "Prisoner",
            "playcount": 71290,
            "mbid": "5c064064-ca5f-4efd-9ff1-ef3c10e622b4",
            "url": "https://www.last.fm/music/Cher/Prisoner",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/8d28f3c740074513f1ef4d6f602fea70.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/8d28f3c740074513f1ef4d6f602fea70.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/8d28f3c740074513f1ef4d6f602fea70.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/8d28f3c740074513f1ef4d6f602fea70.png",
                "size": "extralarge"
              }
            ]
          },
          {
            "name": "The Ultimate Collection",
            "playcount": 35309,
            "url": "https://www.last.fm/music/Cher/The+Ultimate+Collection",
            "artist": {
              "name": "Cher",
              "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
              "url": "https://www.last.fm/music/Cher"
            },
            "image": [
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/921e01612db09e7981ff3d265def2fea.png",
                "size": "small"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/921e01612db09e7981ff3d265def2fea.png",
                "size": "medium"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/921e01612db09e7981ff3d265def2fea.png",
                "size": "large"
              },
              {
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/921e01612db09e7981ff3d265def2fea.png",
                "size": "extralarge"
              }
            ]
          }
        ],
        "@attr": {
          "artist": "Cher",
          "page": "1",
          "perPage": "50",
          "totalPages": "783",
          "total": "39103"
        }
      })),
    );

    WidgetsFlutterBinding.ensureInitialized();
    await mockNetworkImages(() async {
      return await widgetTester.pumpWidget(
        createMaterialWidgetForTesting(
            child: BlocProvider(
          create: (context) => bloc,
          child: const HomeSubPage(),
        )),
      );
    });

    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
    // await widgetTester.pump(const Duration(milliseconds: 500));
    expect(find.byType(img.Image), findsAtLeastNWidgets(1));
    expect(find.byType(Scaffold), findsAtLeastNWidgets(1));
    expect(find.byType(AppBar), findsNWidgets(1));
    expect(find.byType(Text), findsAtLeastNWidgets(1));
  });
}
