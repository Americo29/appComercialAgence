import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:agencedb/src/presentation/widgets/graphcircular.dart';
import 'package:agencedb/src/model/models.dart';
import 'package:agencedb/src/blocs/tab/tab_bloc.dart';
import 'package:agencedb/src/presentation/widgets/widgets.dart';

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
          body: activeTab == AppTab.todos ? FilteredConsultores() : 
                activeTab == AppTab.stats ? Stats() : 
                activeTab == AppTab.relation ? RelationScreen() :
                activeTab == AppTab.graphbar ? GraphBarScreen.withSampleData() : GraphCircularScreen.withSampleData(),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
      );
    });
  }

}
