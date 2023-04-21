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
    //Brightness brightness = MediaQuery.of(context).platformBrightness;
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: const Text('CREATE NEW TICKET'),
        centerTitle: true,
        backgroundColor: Colors.blue.withOpacity(0.7),

        //flexibleSpace: kGradientContainer,
      ),
      body: SafeArea(
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
                        top: 20.0,
                        bottom: 20.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) {},
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'Title',
                              prefixIcon: Icon(
                                Icons.view_headline,
                                color: Colors.indigoAccent,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 12,
                            color: Colors.transparent,
                          ),
                          TextField(
                            onChanged: (value) {},
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'Email ID',
                              prefixIcon: Icon(
                                Icons.mail_outline_rounded,
                                color: Colors.redAccent,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 12,
                            color: Colors.transparent,
                          ),
                          TextField(
                            onChanged: (value) {},
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: 'Mobile Number',
                              prefixIcon: Icon(
                                Icons.call,
                                color: Colors.greenAccent,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 12,
                            color: Colors.transparent,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                              border: Border.all(color: Colors.lightBlueAccent),
                            ),
                            padding: const EdgeInsets.only(right: 10, left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.comment_outlined,
                                  size: 18,
                                  color: Colors.lightBlue,
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  'Reason',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: DropdownButton<String>(
                                    hint: const Text('Select a Reason'),
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
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(32.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 12,
                            color: Colors.transparent,
                          ),
                          TextField(
                            onChanged: (value) {},
                            maxLines: 4,
                            textAlignVertical: TextAlignVertical.bottom,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'Remarks',
                              prefixIcon: Icon(
                                Icons.text_snippet_outlined,
                                color: Colors.yellowAccent,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientButton(
                    onTap: () {},
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      bottom: 12.0,
                      right: 45.0,
                      left: 45.0,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
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
    );
  }
}
