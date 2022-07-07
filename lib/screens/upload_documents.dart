import 'package:flutter/material.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import '../resources/constants.dart';

class UploadNewDocuments extends StatefulWidget {
  static String id = 'upload_new_docs_page';
  const UploadNewDocuments({Key? key}) : super(key: key);

  @override
  State<UploadNewDocuments> createState() => _UploadNewDocumentsState();
}

class _UploadNewDocumentsState extends State<UploadNewDocuments> {
  String dropdownValue = 'ID Proof';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                      /*IconButton(
                        onPressed: null,
                        icon: Icon(Icons.add, color: Colors.transparent),
                      ),*/
                    ],
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'UPLOAD DOCUMENTS',
                    style: TextStyle(),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      /*IconButton(
                        onPressed: null,
                        icon: Icon(Icons.add, color: Colors.transparent),
                      ),*/
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.add, color: Colors.transparent),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          flexibleSpace: kgradientContainer,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ShadedContainer(
                      padding: const EdgeInsets.all(30.0),
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Text('Document Type'),
                            DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownValue,
                              underline: Container(
                                height: 0.0,
                              ),
                              //hint: const Text('Select Reason'),
                              items: <String>[
                                'ID Proof',
                                'Photo ID',
                                'Aadhaar Card',
                                'Insurance paper',
                                'Other',
                                'Signature'
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Flexible(
                      child:
                          Text('Please upload 2 MB size of (jpg/gif/png/jpeg)'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GradientButton(
                      margin: EdgeInsets.only(
                        top: 20.0,
                        bottom: 10.0,
                        left: size.width * 0.25,
                        right: size.width * 0.25,
                      ),
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        right: 20,
                        left: 20,
                      ),
                      child: const Center(
                        child: Text('CHOOSE FILE'),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
