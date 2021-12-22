import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/constants/widgets.dart';

class FutureBuilderData extends GetWidget {
  final bool? conditions;
  final Future future;
  final Widget pageContent;
  const FutureBuilderData(
      {Key? key,
      this.conditions,
      required this.future,
      required this.pageContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return conditions!
        ? FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return pageContent;
              } else if (snapshot.hasError) {
                return buildErrorPage();
              } else {
                return Center(child: ConstantWidgets.circularProgressIndicator);
              }
            },
          )
        : pageContent;
  }

  buildErrorPage() {
    return Container(
      child: Center(
        child: Text(
          "An Error Has Occured",
          style: Theme.of(Get.context!).textTheme.bodyText1,
        ),
      ),
    );
  }
}
