import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as img;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart';
import 'package:last_fm/features/presentation/bloc/get_top_albums_bloc/top_albums_bloc.dart';
import 'package:last_fm/features/presentation/pages/home/widgets/top_albums_list_item_widget.dart';

class HomeSubPage extends StatefulWidget {
  const HomeSubPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeSubPageState();
}

class _HomeSubPageState extends State<HomeSubPage> {
  int pageKey = 1;
  final PagingController<int, Album> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      this.pageKey = pageKey;
      debugPrint("getTopAlbums : PAGE - $pageKey , albumSize : ${_pagingController.itemList?.length}" );
      BlocProvider.of<GetTopAlbumsBloc>(context).add(GetTopAlbumsEvent(page: pageKey));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: img.Image.asset(
          'assets/lastfm_logo.png',
          height: 28.h,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<GetTopAlbumsBloc>(context),
        builder: (context, state) {
          if (state is TopAlbumsRetrievedSuccessfullyStatus) {
            if (_pagingController.itemList==null && (state.topalbums.album == null || state.topalbums.album!.isEmpty)) {
              return Center(
                child: Text(
                  "No album(s) found",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                ),
              );
            }

            /// initializing _pagingController.value
            if(_pagingController.itemList==null)
              {
                _pagingController.value = PagingState(
                  nextPageKey: pageKey+1,
                  error: Text(
                    "Some error occurred",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                  itemList: state.topalbums.album??[],
                );
              }
            else
              {
                /// restricting further api call for next page
                if((state.topalbums.album??[]).length < 20)
                  {
                    _pagingController.appendLastPage(state.topalbums.album??[]);
                  }
                else
                  {
                    _pagingController.appendPage(state.topalbums.album??[], pageKey+1);
                  }
              }
          }
          return CustomScrollView(
            slivers: <Widget>[
              PagedSliverGrid<int, Album>(
                pagingController: _pagingController,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.w,
                  mainAxisExtent: 200.h,
                  childAspectRatio: 100 / 150,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                ),
                builderDelegate: PagedChildBuilderDelegate<Album>(
                  itemBuilder: (context, item, index) => TopAlbumsListItemWidget(item),
                ),
                showNewPageErrorIndicatorAsGridChild: false,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
