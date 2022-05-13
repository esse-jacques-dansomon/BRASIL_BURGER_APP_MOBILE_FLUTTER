import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleLine extends StatelessWidget {
  final String title;
  final String route;
  final String seeAll;
  const TitleLine(
      {Key? key,
      required String title,
      required String route,
      String seeAll = 'Voir tous'})
      : title = title,
        route = route,
        seeAll = seeAll,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppHelper.getTheme(context).headline6,
              ),
              TextButton(
                onPressed: () {
                  RouterNavigator.navigateTo(context, route);
                },
                child: Text(seeAll),
              )
            ],
          ),
        ),
      ],
    );
  }
}
