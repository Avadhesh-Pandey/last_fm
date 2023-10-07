import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_fm/core/di/injection_getit.dart';
import 'package:last_fm/features/presentation/bloc/get_top_albums_bloc/top_albums_bloc.dart';
import 'package:last_fm/features/presentation/pages/home/subpages/home_subpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetTopAlbumsBloc>(),
      child: const HomeSubPage(),
    );
  }
}
