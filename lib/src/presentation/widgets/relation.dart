import 'package:agencedb/src/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:agencedb/src/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelationScreen extends StatelessWidget {
  const RelationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelationBloc, RelationState>(
      builder: (context, state) {
        if (state is RelationLoading) {
          return LoadingIndicator();
        } else if (state is RelationLoaded) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: dataTable(context, state.consultoresActivos),
              ),
            ),
          );
        }
      },
    );
  }
}
