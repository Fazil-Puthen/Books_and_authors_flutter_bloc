import 'package:elt_machine_task/presentation/homescreen/bloc/author_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> bottomsheet(BuildContext context) {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final dobController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      // Format the date to a string and update the controller
      String formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
      dobController.text = formattedDate; // Set the selected date in the TextFormField
    }
  }

  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Add author',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Field for adding author name
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mandatory field';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusColor: Colors.orange,
                        contentPadding: EdgeInsets.all(6),
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Field for adding biography
                    TextFormField(
                      controller: bioController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mandatory field';
                        } else {
                          return null;
                        }
                      },
                      maxLines: 8,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusColor: Colors.orange,
                        contentPadding: EdgeInsets.all(6),
                        hintText: 'Biography',
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Field for adding DOB
                    TextFormField(
                      controller: dobController,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mandatory field';
                        } else {
                          return null;
                        }
                      },
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusColor: Colors.orange,
                        contentPadding: EdgeInsets.all(6),
                        hintText: 'DOB',
                        suffixIcon: const Icon(Icons.calendar_today_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Add author button
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // form submission here
                    String name = nameController.text;
                    String bio = bioController.text;
                    String dob = dobController.text;
                    context.read<AuthorBloc>().add(Addauthor(
                      name: name,
                      biography: bio,
                      dob: dob));
                    //pop the bottom sheet after submission
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange,
                  ),
                  child: const Center(
                    child: Text(
                      'Add author',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
