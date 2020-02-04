import 'package:agencedb/src/blocs/filtered/filtered_bloc.dart';
import 'package:agencedb/src/blocs/tab/tab_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:agencedb/src/blocs/bloc_consultores/consultores_bloc.dart';
import 'package:agencedb/src/blocs/bloc_delegate.dart';
import 'package:agencedb/src/presentation/pages/home_page.dart';
import 'package:agencedb/src/presentation/pages/splash_page.dart';
import 'package:agencedb/src/repositories/agence_repository.dart';
import 'package:agencedb/src/presentation/widgets/loading_indicator.dart';

 
void main() { 
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final agenceRepository = AgenceRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ConsultoresBloc>(
          create: (context) => ConsultoresBloc(agenceRepository: agenceRepository)
                  ..add(AppStartedEvent()),
        ),  
         BlocProvider<TabBloc>(
                create: (context) => TabBloc(),
              ),
        BlocProvider<FilteredTodosBloc>(
                create: (context) => FilteredTodosBloc(
                  todosBloc: BlocProvider.of<ConsultoresBloc>(context),
                ),
              ),      
      ], 
      child: MyApp(agenceRepository: agenceRepository,),
    ),
  );    

}
 
class MyApp extends StatelessWidget {
  final AgenceRepository agenceRepository;


  MyApp({Key key, @required this.agenceRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agence Comercial',
      home: BlocBuilder<ConsultoresBloc, ConsultoresState>(
        builder: (context, state){
          if ( state is ConsultoresUninitializedState ) {
            return SplashPage();
          }
          if ( state is TodosLoaded ) {
            return HomePage();
          }
          if ( state is ConsultoresLoadingState ) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}