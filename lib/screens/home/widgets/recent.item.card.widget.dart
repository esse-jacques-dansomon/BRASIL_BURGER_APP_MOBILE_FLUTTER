import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:flutter/cupertino.dart';

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({
    Key? key,
    required String name,
    required Image image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 80,
              height: 80,
              child: _image,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    style: AppHelper.getTheme(context)
                        .headline4
                        ?.copyWith(color: AppColor.primary),
                  ),
                  Row(
                    children: const [
                      Text("Cafe"),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: AppColor.orange,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Western Food"),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppHelper.getAssetName(
                            "star_filled.png", "images/virtual"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "4.9",
                        style: TextStyle(
                          color: AppColor.orange,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('(124) Ratings')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
