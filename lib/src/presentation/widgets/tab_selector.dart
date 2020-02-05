import 'package:agencedb/src/model/app_tab.dart';
import 'package:flutter/material.dart';



class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,      
      currentIndex: AppTab.values.indexOf(activeTab),      
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(            
            tab == AppTab.todos ? Icons.list : 
            tab == AppTab.stats ? Icons.shuffle :
            tab == AppTab.relation ? Icons.storage : 
            tab == AppTab.graphbar ? Icons.sort : Icons.timelapse,            
          ),
          title: Text(
            tab == AppTab.stats ? 'Stats': 
            tab == AppTab.todos ? 'Todos': 
            tab == AppTab.relation ? 'Relación': 
            tab == AppTab.graphbar ? 'Barras': 'Circular',
          ),
        );
      }).toList(),
    );
  }
}