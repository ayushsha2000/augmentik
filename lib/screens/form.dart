import 'package:flutter/material.dart';

class FormDialog extends StatefulWidget {
  const FormDialog({Key? key}) : super(key: key);

  @override
  State<FormDialog> createState() => _FormDialogState();
}

class _FormDialogState extends State<FormDialog> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _contactcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _namecontroller.dispose();
    _contactcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namecontroller,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Enter your Name',
                  filled: true,
                ),
                maxLines: 1,
                maxLength: 20,
                textInputAction: TextInputAction.done,
                validator: (String? text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 6.0,
              ),
              TextFormField(
                controller: _contactcontroller,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Enter your Number',
                  filled: true,
                ),
                maxLines: 1,
                maxLength: 20,
                textInputAction: TextInputAction.done,
                validator: (String? text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter your number';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('Send'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              String message;

              try {
                // final collection =
                //     FirebaseFirestore.instance.collection('document');

                message = 'Details sent successfully';
              } catch (e) {
                message = 'Details when sending feedback';
              }

              // Show a snackbar with the result
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
