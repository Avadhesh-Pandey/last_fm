import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as img;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart';
import 'package:last_fm/features/presentation/pages/home/widgets/top_albums_list_item_widget.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:last_fm/core/di/injection_getit.dart' as di;
import 'package:last_fm/features/presentation/pages/home/home_main_page.dart';

import '../../../../../widget_test.dart';


void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Albums list items widget test", (widgetTester) async {
    WidgetsFlutterBinding.ensureInitialized();
    await mockNetworkImages(() async {
      return await widgetTester.pumpWidget(
        createMaterialWidgetForTesting(child: TopAlbumsListItemWidget(Album.fromJson({
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
        }))),
      );
    });

    await widgetTester.pumpAndSettle();
    expect(find.byType(img.Image), findsNWidgets(1));
    expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    expect(find.byType(Column), findsNWidgets(1));
    expect(find.byType(Row), findsNWidgets(1));
    expect(find.byType(Icon), findsAtLeastNWidgets(1));
  });
}
