import 'package:babing_cubit/logic/bloc/color/color_bloc.dart';
import 'package:babing_cubit/logic/bloc/score/score_bloc.dart';
import 'package:babing_cubit/logic/bloc/theme/theme.bloc.dart';
import 'package:babing_cubit/logic/bloc/theme/theme.state.dart';
import 'package:babing_cubit/logic/cubit/bloc_cubit.dart';
import 'package:babing_cubit/logic/cubit/color/color_cubit.dart';
import 'package:babing_cubit/logic/cubit/score/score_cubit.dart';
import 'package:babing_cubit/presentation/routes/app_router.dart';
import 'package:babing_cubit/presentation/screens/counter_screen.dart';
import 'package:babing_cubit/presentation/screens/cubit_communication.dart';
import 'package:babing_cubit/presentation/screens/next_screen.dart';
import 'package:babing_cubit/presentation/screens/payload_screen.dart';
import 'package:babing_cubit/presentation/screens/third_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubit/score/score_state.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();
  ThemeData darkTheme = ThemeData.from(
    colorScheme: ColorScheme.dark(),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    appRouter.dispose();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>ColorBloc()),
          BlocProvider(create: (context)=>ScoreBloc(colorBloc: context.read<ColorBloc>()))
        ], child:  MaterialApp(
            title: 'CubitCommunications',
            debugShowCheckedModeBanner: false,
           //onGenerateRoute: appRouter.onGenerateRoute,
            home: CubitsCommunication(),
    ),

    );
  }
}
