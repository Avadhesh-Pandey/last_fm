import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as img;
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/core/di/injection_getit.dart';
import 'package:last_fm/core/error/failure.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart';
import 'package:last_fm/features/presentation/bloc/get_top_albums_bloc/top_albums_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:last_fm/core/di/injection_getit.dart' as di;
import 'package:last_fm/features/presentation/pages/home/home_main_page.dart';

import '../../../../widget_test.dart';
import 'subpages/home_subpage_test.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  GetTopAlbumsBloc bloc=MockGetTopAlbumsBloc();
  sl.registerFactory(
        () => bloc,
  );
  testWidgets("Home Page test", (widgetTester) async {

    when(bloc.state).thenReturn(TopAlbumsRetrievedSuccessfullyStatus(Topalbums.fromJson({
      "topalbums": {
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
          }
        ],
        "@attr": {
          "artist": "Cher",
          "page": "1",
          "perPage": "50",
          "totalPages": "783",
          "total": "39103"
        }
      }
    })),);

    WidgetsFlutterBinding.ensureInitialized();
    await mockNetworkImages(() async {
      return await widgetTester.pumpWidget(
        createMaterialWidgetForTesting(child: const HomePage()),
      );
    });

    await widgetTester.pumpAndSettle();
    expect(find.byType(img.Image), findsAtLeastNWidgets(1));
    expect(find.byType(Scaffold), findsAtLeastNWidgets(1));
    expect(find.byType(AppBar), findsNWidgets(1));
    expect(find.byType(Text), findsAtLeastNWidgets(1));
  });
}
