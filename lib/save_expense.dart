import 'package:flutter/material.dart';

class SaveExpense extends StatefulWidget {
  const SaveExpense({super.key});

  @override
  State<SaveExpense> createState() {
    return _SaveExpenseState();
  }
}

class _SaveExpenseState extends State<SaveExpense> {
  TextEditingController titleController = TextEditingController();

  @override // run when the widget unmounts
  void dispose() {
    titleController.dispose(); //destory the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            keyboardType: TextInputType.text, //default
            decoration: const InputDecoration(label: Text("Title")),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    debugPrint(titleController.text);
                  },
                  child: const Text("Save Expense")),
            ],
          )
        ],
      ),
    );
  }
}
