import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:monefy/constants/appstyle.dart';

class AddTransDialog extends StatefulWidget {
  const AddTransDialog({super.key});

  @override
  State<AddTransDialog> createState() => _AddTransDialogState();
}

List<String> categories = ['A', 'B', 'C', 'D'];
int selected = 0;
TextEditingController titleCon = TextEditingController();
TextEditingController PriceCon = TextEditingController();
TextEditingController dateCon = TextEditingController();

class _AddTransDialogState extends State<AddTransDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppStyle.bgColor,
      title: const Center(
          child: Column(
        children: [
          Text('Add new Transaction'),
          Divider(
            height: 10,
          ),
        ],
      )),
      content: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: titleCon,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
                icon: Icon(Icons.text_fields_sharp)),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: PriceCon,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Price',
                icon: Icon(Icons.money)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.list),
              DropdownMenu<String>(
                width: 190,
                inputDecorationTheme: const InputDecorationTheme(
                  border: OutlineInputBorder(),
                ),
                initialSelection: categories.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    selected = categories.indexOf(value!);
                  });
                },
                dropdownMenuEntries:
                    categories.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: dateCon,
            //editing controller of this TextField
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              labelText: "Enter Date",
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  dateCon.text = formattedDate;
                });
              } else {}
            },
          )
        ]),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        MaterialButton(
          onPressed: () {
            // Add functionality
          },
          color: AppStyle.accentColor,
          child: Text(
            'Submit',
            style: TextStyle(color: AppStyle.accentOff),
          ),
        ),
      ],
    );
  }
}
