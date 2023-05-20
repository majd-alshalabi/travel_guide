import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_guide/core/constants/app_constant.dart';
import 'package:travel_guide/feature/main_page/presentation/main_page_screen.dart';
import 'package:travel_guide/feature/other_feature/theme/presentation/blocs/theme_bloc/theme_cubit.dart';

class SettAlKolMaterialApp extends StatelessWidget {
  const SettAlKolMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (_) => ThemeCubit()..getCurrentTheme(),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              if (state is ThemeLoadedState) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: AppConstant.appName,
                  theme: state.theme,
                  home: const SettAlKolMainPage(),
                );
              }
              return const Offstage();
            },
          ),
        );
      },
    );
  }
}
