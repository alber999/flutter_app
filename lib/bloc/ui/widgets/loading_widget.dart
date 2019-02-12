import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/resources/loader_bloc_provider.dart';
import 'package:flutter_app/bloc/ui/widgets/progress_indicator_widget.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loaderBloc = LoaderBlocProvider.of(context);

    return StreamBuilder(
        stream: loaderBloc.load,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return _loader(snapshot.hasData ? snapshot.data : false);
        });
  }

  Widget _loader(bool isLoading) {
    return isLoading
        ? Align(
            child: Container(
              width: 70.0,
              height: 70.0,
              child: Padding(padding: const EdgeInsets.all(5.0), child: ProgressIndicatorWidget()),
            ),
            alignment: FractionalOffset.bottomCenter,
          )
        : SizedBox(
            width: 0.0,
            height: 0.0,
          );
  }
}
