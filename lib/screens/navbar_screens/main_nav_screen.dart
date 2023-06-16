import 'package:flutter/material.dart';
import 'package:graduation/components/text/text_form_field.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/screens/drawer_screens/main_drawer.dart';
import '../../components/items/item_medicine.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  static const String mainScreenRoute = 'main screen';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.menu,
              color: defBlue,
              size: MediaQuery.of(context).size.width / 12.5,
            ),
          ),
        ),
        title: Text(
          'Pharmacy',
          style: TextStyle(
            color: defBlue,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width / 12.5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(7.5),
            child: Image.asset('assets/images/image1.png'),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: ReusableTextFormField(
                controller: searchController,
                text: 'Search For Medicine',
                prefix: Icon(Icons.search),
                textInputType: TextInputType.text,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.42,
              child: ItemMedicine(),
            ),
          ],
        ),
      ),
    );
  }
}
