import 'package:flutter/material.dart';
import 'package:graduation/components/appBar/reusablseAppBar.dart';
import 'package:graduation/constants/colors.dart';

class DateBakeUpScreen extends StatelessWidget {
  const DateBakeUpScreen({Key? key}) : super(key: key);
  static String dateBakeUpScreenRoute = 'data backup screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 1.0,
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
      //     'Data Backup',
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
          title: 'Data Backup',
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
                // Text(
                //   'Data Backup',
                //   style: TextStyle(
                //     color: defBlue,
                //     fontSize: 35.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
                Container(
                  height: 200.0,
                  child: Image.asset('assets/backup_images/Backup.png'),
                ),
                Container(
                  width: 300,
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Text(
                    'It is preferable that the backup copy be located in a place geographically far from the original data location,'
                    ' The natural factors, such as: the occurrence of an earthquake or fire. '
                    'It may cause the destruction of the computer and everything in it, and the damage may reach the backup copies,'
                    ' if they are in the same place.However, human sabotage factors, '
                    ' which leads to the permanent loss of the old file, or some malicious program (virus) tampering with my important data and causing some or all of them to be damaged,'
                    ' does not require geographical distance.',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: defDeepPurple,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 10.0),
                          child: Container(
                            width: 145, //135
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  color: Colors.grey,
                                  blurRadius: 3.0,
                                ),
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Colors.green,
                                  Colors.green.shade900,
                                ],
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Recovery',
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.cloud_sync_outlined,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(
                        //       left: 5.0
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       IconButton(
                        //         onPressed: (){
                        //           Navigator.pop(context);
                        //         },
                        //         icon: Icon(Icons.arrow_back_ios_new_outlined,),
                        //         style:  ButtonStyle(
                        //           //backgroundColor: defDeepPurple,
                        //         ),
                        //       ),
                        //       Text(
                        //         'Back',
                        //         style:TextStyle(
                        //           color: defBlue,
                        //           fontSize: 17.0,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                      ),
                      child: Container(
                        width: 127.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.grey,
                              blurRadius: 3.0,
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.blue,
                              Colors.blue.shade900,
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  'Upload',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.cloud_upload_outlined,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
