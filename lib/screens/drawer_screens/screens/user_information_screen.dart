import 'package:flutter/material.dart';
import 'package:graduation/components/appBar/reusablseAppBar.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:provider/provider.dart';
import '../../../components/user_widget/user_widget.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({
    Key? key,
  }) : super(key: key);
  static String userInformationScreenRoute = 'user information screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProvider>(
      builder: ((context, classInstance, child) {
        return Scaffold(
          appBar: ReusableAppBar(
            leadingFunction: () {
              Navigator.pop(context);
            },
            title: 'User Information',
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                userWidget(
                  requiredInformation: 'First name',
                  userInformation: classInstance.user?.firstName ?? 'empty',
                ),
                userWidget(
                  requiredInformation: 'Last name',
                  userInformation: classInstance.user?.lastName ?? 'empty',
                ),
                userWidget(
                  requiredInformation: 'Address',
                  userInformation: classInstance.user?.address ?? 'empty',
                ),
                userWidget(
                  requiredInformation: 'Phone number',
                  userInformation: classInstance.user?.phoneNumber ?? 'empty',
                ),
                userWidget(
                  requiredInformation: 'Email',
                  userInformation: classInstance.user?.email ?? 'empty',
                ),
                userWidget(
                  requiredInformation: 'Password',
                  userInformation: classInstance.user?.password ?? 'empty',
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

