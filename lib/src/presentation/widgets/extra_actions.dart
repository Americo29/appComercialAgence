import 'package:agencedb/src/blocs/blocs.dart';
import 'package:agencedb/src/model/extra_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ExtraActions extends StatelessWidget {
  ExtraActions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConsultoresBloc, ConsultoresState>(
      builder: (context, state) {
        if (state is TodosLoaded) {
          bool allComplete =
              (BlocProvider.of<ConsultoresBloc>(context).state as TodosLoaded)
                  .todos
                  .every((todo) => todo.filtered);
          return PopupMenuButton<ExtraAction>(
            // key: FlutterTodosKeys.extraActionsPopupMenuButton,
            onSelected: (action) {
              switch (action) {
                case ExtraAction.clearCompleted:
                  BlocProvider.of<ConsultoresBloc>(context).add(ClearCompleted());
                  break;
                case ExtraAction.toggleAllComplete:
                  BlocProvider.of<ConsultoresBloc>(context).add(ToggleAll());
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
              PopupMenuItem<ExtraAction>(
                // key: ArchSampleKeys.toggleAll,
                value: ExtraAction.toggleAllComplete,
                child: Text(
                  allComplete
                      ? 'Marcar todos inactivos'//ArchSampleLocalizations.of(context).markAllIncomplete
                      : 'Marcar todos activos',
                ),
              ),
            ],
          );
        }
        return Container();//key: FlutterTodosKeys.extraActionsEmptyContainer);
      },
    );
  }
}

