import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/resources/loader_bloc_provider.dart';

class LoaderWidget extends StatelessWidget {
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
        ? new Align(
            child: new Container(
              width: 70.0,
              height: 70.0,
              child: new Padding(
                  padding: const EdgeInsets.all(5.0), child: new Center(child: new CircularProgressIndicator())),
            ),
            alignment: FractionalOffset.bottomCenter,
          )
        : new SizedBox(
            width: 0.0,
            height: 0.0,
          );
  }
}
