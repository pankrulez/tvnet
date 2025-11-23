import 'package:flutter/material.dart';
import 'package:tvnet/resources/shaded_container.dart';
import '../resources/constants.dart';
import 'package:tvnet/widgets/adaptive_scaffold.dart';
import 'package:tvnet/widgets/adaptive_controls.dart';

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
        appBar: AdaptiveAppBar(
          elevation: 5.0,
          title: const Text('UPLOAD DOCUMENTS'),
          centerTitle: true,
          backgroundColor: Colors.blue.withAlpha((0.7 * 255).round()),
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
                AdaptiveButton(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  onPressed: () {},
                  child: const Text(
                    'CHOOSE FILE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
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
