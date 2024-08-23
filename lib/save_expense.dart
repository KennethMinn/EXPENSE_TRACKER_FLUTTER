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
  TextEditingController amountController = TextEditingController();

  @override // run when the widget unmounts
  void dispose() {
    titleController.dispose(); //destory the controller
    amountController.dispose();
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
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(prefixText: "\$", label: Text("Amount")),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // remove the current context(SaveExpense) off of the screen
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    debugPrint(titleController.text);
                    debugPrint(amountController.text);
                  },
                  child: const Text("Save Expense")),
            ],
          )
        ],
      ),
    );
  }
}
