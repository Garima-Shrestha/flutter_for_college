import 'package:flutter/material.dart';
import 'package:flutterfor_college/models/student.dart';
import 'output_screen.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  String? _selectedCity;

  final List<String> _cities = ['Kathmandu', 'Pokhara', 'Chitwan'];

  // Multiple students lai store garne [<Student> is a model]
  List<Student> lstStudent = [];

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView', style: TextStyle(fontFamily: 'OpenSans Italic')),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: _fnameController,
                decoration: InputDecoration(
                  labelText: 'Student First Name',
                  hintText: 'Enter student first name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter student first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _lnameController,
                decoration: InputDecoration(
                  labelText: 'Student Last Name',
                  hintText: 'Enter student last name',
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter student last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                initialValue: _selectedCity,
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Select a city',
                  prefixIcon: const Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                items: _cities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCity = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Student added successfully!'),
                        //       backgroundColor: Colors.green,
                        //     ),
                        //   );
                        //   _nameController.clear();
                        //   _rollNumberController.clear();
                        //   setState(() {
                        //     _selectedCity = null;
                        //   });
                        //   _formKey.currentState!.reset();

                          // Object banayeko
                          Student newStudent = Student(
                              fname: _fnameController.text,
                              lname: _lnameController.text,
                              city: _selectedCity!,
                          );

                          setState(() {
                            lstStudent.add(newStudent);
                          });

                         // Clear the form fields after adding
                          _fnameController.clear();
                          _lnameController.clear();
                          setState(() {
                            _selectedCity = null;
                          });
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Student'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OutputScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.visibility),
                      label: const Text('View Students'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Center(
              //   child: Container(
              //     padding: const EdgeInsets.all(20),
              //     decoration: BoxDecoration(
              //       color: Colors.grey.shade100,
              //       borderRadius: BorderRadius.circular(12),
              //       border: Border.all(color: Colors.grey.shade300, width: 2),
              //     ),
              //     child: Column(
              //       children: [
              //         Icon(
              //           Icons.inbox_outlined,
              //           size: 60,
              //           color: Colors.grey.shade400,
              //         ),
              //         const SizedBox(height: 10),
              //         Text(
              //           'No Data',
              //           style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.w500,
              //             color: Colors.grey.shade600,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              lstStudent.isEmpty
                  ? const Text(
                'No students added yet.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              )
                  : SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: lstStudent.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final student = lstStudent[index];
                        return ListTile(
                          leading: CircleAvatar(
                            // child: Text(student.fname[0]),        // to get the first letter of name
                            child: const Icon(Icons.person),         // person ko logo aaunxa
                          ),
                          title: Text('${student.fname} ${student.lname}'),
                          subtitle: Text(student.city),
                          trailing: const Icon(Icons.more_vert),      // 3 dots ko lagi
                          onTap: (){},
                        );
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
