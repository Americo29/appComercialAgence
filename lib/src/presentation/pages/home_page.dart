import 'package:agencedb/src/blocs/filtered/filtered_bloc.dart';
import 'package:agencedb/src/blocs/tab/tab_bloc.dart';
import 'package:agencedb/src/model/app_tab.dart';
import 'package:agencedb/src/presentation/pages/splash_page.dart';
import 'package:agencedb/src/presentation/widgets/extra_actions.dart';
import 'package:agencedb/src/presentation/widgets/filter_button.dart';
import 'package:agencedb/src/presentation/widgets/filtered.dart';
import 'package:agencedb/src/presentation/widgets/stats.dart';
import 'package:agencedb/src/presentation/widgets/tab_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agencedb/src/blocs/blocs.dart';
import 'package:agencedb/src/model/permissao_s.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Agence home'),
            actions: [
              FilterButton(visible: activeTab == AppTab.todos),
              ExtraActions(),
            ],
          ),
          body: activeTab == AppTab.todos ? FilteredConsultores() : Stats(),
             bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
          // BlocProvider<FilteredTodosBloc>(
          //   create: (context) => FilteredTodosBloc(
          //     todosBloc: BlocProvider.of<ConsultoresBloc>(context),
          //   ),
          //   child: 
          // )
          // body: BlocListener<ConsultoresBloc, ConsultoresState>(
          //   listener: (context, state){
          //     if (state is ConsultoresFailureState) {
          //       Scaffold.of(context).showSnackBar(SnackBar(
          //         content: Text('error desconocido: ${state.error}'),
          //         backgroundColor: Colors.red,
          //       ));
          //     }
          //   },
          //   child: BlocBuilder<ConsultoresBloc, ConsultoresState>(
          //     builder: (context, state){
          //       if (state is ConsultoresInitializedState) {
          //         return ListView(
          //           children: _listItem(state.datalist, context),
          //         );
          //       }
          //     },
          //   ),
          // )
          );
    });
  }

  List<Widget> _listItem(List<PermissaoSistema> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text('${opt.coUsuario}'),
        // subtitle: Text('${opt.nuCep}'),
        // leading: Icon(Icons.data_usage),
        // trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {},
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
