import 'package:flutter/material.dart';
import '../resources/shadedContainer.dart';
import '../resources/constants.dart';

class CreateTicket extends StatefulWidget {
  static String id = 'new_ticket_page';
  const CreateTicket({Key? key}) : super(key: key);

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  String dropdownValue = 'Speed Issue';
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: const [
                    /*BackButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),*/
                  ],
                ),
              ],
            ),
            Column(
              children: const [
                Text(
                  'CREATE NEW TICKET',
                  style: TextStyle(),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.hourglass_bottom_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.power_settings_new_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        flexibleSpace: kgradientContainer,
      ),
      body: SafeArea(
        child: Material(
          color: brightness == Brightness.dark
              ? darkModeBoxColor
              : lightModeBoxColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Expanded(
              child: ListView(
                physics: orientation == Orientation.portrait
                    ? const NeverScrollableScrollPhysics()
                    : const ClampingScrollPhysics(),
                children: [
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: ShadedContainer(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            bottom: 5.0,
                            right: 20.0,
                            left: 20.0,
                          ),
                          margin: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                          child: const TextField(
                            cursorColor: Colors.deepOrangeAccent,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Title',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ShadedContainer(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            bottom: 5.0,
                            right: 20.0,
                            left: 20.0,
                          ),
                          margin: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                          child: const TextField(
                            cursorColor: Colors.deepOrangeAccent,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email ID',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ShadedContainer(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            bottom: 5.0,
                            right: 20.0,
                            left: 20.0,
                          ),
                          margin: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                          child: const TextField(
                            cursorColor: Colors.deepOrangeAccent,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Mobile Number',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ShadedContainer(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            bottom: 5.0,
                            right: 20.0,
                            left: 20.0,
                          ),
                          margin: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            underline: Container(
                              height: 0.0,
                            ),
                            //hint: const Text('Select Reason'),
                            items: <String>[
                              'Speed Issue',
                              'No Internet',
                              'Other Issue'
                            ].map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ShadedContainer(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            bottom: 5.0,
                            right: 20.0,
                            left: 20.0,
                          ),
                          margin: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                          child: const TextField(
                            cursorColor: Colors.deepOrangeAccent,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Remarks',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientButton(
                        onTap: () {},
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          bottom: 15.0,
                          right: 40.0,
                          left: 40.0,
                        ),
                        margin: const EdgeInsets.only(top: 30.0),
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
