import 'package:final_exam/models/restuarant_comment.dart';
import 'package:flutter/material.dart';

class RestaurantCommentsForm extends StatefulWidget {
  const RestaurantCommentsForm({super.key});

  @override
  State<RestaurantCommentsForm> createState() =>
      _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  final _formKey = GlobalKey<FormState>();
  final feedbackController = TextEditingController();
  double selectedInteger=0;

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop<RestaurantComment>(context,RestaurantComment(feedback: feedbackController.text,stars: selectedInteger));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
          child:Form(
            key: _formKey,
            child:  Column(
            spacing: 12,
            children: [
              Text("How Was Your Dinner",
              style: TextStyle(fontSize: 25),),

              DropdownButton<double>(
                isExpanded: true,
                value: selectedInteger,
                items: const [
                  DropdownMenuItem(value: 0.0, child: Text('0')),
                  DropdownMenuItem(value: 1.0, child: Text('1')),
                  DropdownMenuItem(value: 2.0, child: Text('2')),
                  DropdownMenuItem(value: 3.0, child: Text('3')),
                  DropdownMenuItem(value: 4.0, child: Text('4')),
                  DropdownMenuItem(value: 5.0, child: Text('5')),
                  
                ],
                onChanged: (value) {
                  setState(() => selectedInteger = value!);
                },
              ),

              const SizedBox(height: 16),
              
              TextFormField(
                minLines: 1,
                controller: feedbackController,
                decoration: const InputDecoration(
                  labelText: 'Any Feed back ?',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Must Enter Your Feedback';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: submit,
                child: const Text('Comment'),
              ),
            ],
          )
        )
    );
  }
}
