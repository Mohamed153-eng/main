import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation/components/appBar/reusablseAppBar.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/constants/colors.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({Key? key}) : super(key: key);
  static String rateScreenRoute = 'rate screen';
  @override
  State<RateScreen> createState() => _RateScreenState();
}
class _RateScreenState extends State<RateScreen> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 2.0,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: defBlue,
      //       size: 30.0,
      //     ),
      //   ),
      //   title: Text(
      //     'Rate',
      //     style: TextStyle(
      //       color: defBlue,
      //       fontWeight: FontWeight.bold,
      //       fontSize: MediaQuery.of(context).size.width / 12.5,
      //     ),
      //   ),
      // ),
      appBar: ReusableAppBar(
        leadingFunction: () {
          Navigator.pop(context);
        },
        title: 'Rate',
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Rate the app',
                  style: TextStyle(
                    color: defBlue,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 125.0,
                ),
                Container(
                  height: 200.0,
                  child: Image.asset('assets/rate_images/rate.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Rating: $rating',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RatingBar.builder(
                  minRating: 1,
                  itemSize: 46,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  updateOnDrag: true,
                  onRatingUpdate: (rating) => setState(() {
                    this.rating = rating;
                  }),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Please rate the app.',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}