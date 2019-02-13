import 'package:flutter/material.dart';
import 'package:flutter_app/loader/ui/widgets/progress_indicator_widget.dart';

class LoaderWidget extends StatelessWidget {
  final bool _show;

  LoaderWidget(this._show);

  @override
  Widget build(BuildContext context) {
    return _show
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
