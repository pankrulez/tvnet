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
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: const Text('UPLOAD DOCUMENTS'),
          centerTitle: true,
          backgroundColor: Colors.blue.withOpacity(0.7),
        ),
        body: Column(
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
                    child: Column(
                      children: [
                        Text(
                          'Document Type',
                          style: kBoldItalicText,
                        ),
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
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Flexible(
                    child: Text(
                      'Please upload 2 MB size of (jpg/gif/png/jpeg)',
                      style: kItalicText,
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
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    right: 35,
                    left: 35,
                  ),
                  child: const Center(
                    child: Text(
                      'CHOOSE FILE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
