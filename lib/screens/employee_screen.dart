import 'package:flutter/material.dart';
import 'package:flutterfor_college/models/employee.dart';
import 'package:uuid/uuid.dart' show Uuid;
import 'output_screen.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final _formkey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();

  final uuid = Uuid();     // Uuid is a tool/class that makes unique IDs. [For Eg: a3f9c2e0-1b4d-4c6f-9a7b-2c3d4e5f6a7b]

  String? _selectedGender;
  String? _selectedDepartment;

  final List<String> _genders = ["Male", "Female", "Others"];
  final List<String> _departments = ["Sales", "IT", "Support"];

  List<Employee> lstEmployee = [];

  @override
  void dispose(){
    _fullnameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee Screen"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    labelText: "Enter Full Name",
                    hintText: "Enter employee full name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return 'Please enter employee name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  initialValue: _selectedGender,
                  decoration: InputDecoration(
                      labelText: 'Gender',
                      hintText: 'Select a gender',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                  ),
                  items: _genders.map((String gender) {
                      return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                      );
                  }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      _selectedGender = newValue;
                    });
                    },
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Please select a gender';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  initialValue: _selectedDepartment,
                    decoration: InputDecoration(
                      labelText: "Department",
                      hintText: 'Select a department',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                    items: _departments.map((String department) {
                      return DropdownMenuItem<String>(
                          value: department,
                          child: Text(department),
                      );
                    }).toList() ,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDepartment = newValue;
                      });
                    },
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Please select a department";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton.icon(
                            onPressed: (){
                              if(_formkey.currentState!.validate()){
                                Employee newEmployee = Employee(
                                  id: uuid.v4(),      // uuid.v4() creates a new, unique ID string for that employee.
                                    fullname: _fullnameController.text,
                                    gender: _selectedGender!,
                                    department: _selectedDepartment!,
                                );

                                setState(() {
                                  lstEmployee.add(newEmployee);
                                });

                                _fullnameController.clear();
                                setState(() {
                                  _selectedGender = null;
                                  _selectedDepartment = null;
                                });
                              }
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Add Employee'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                            ),
                        ),
                    ),

                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton.icon(
                            onPressed: (){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const OutputScreen(),
                              ),
                              );
                            },
                          icon: const Icon(Icons.visibility),
                          label: const Text('View Employees'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        )
                    )
                  ],
                ),

                const SizedBox(height: 40),
                lstEmployee.isEmpty ? const Text('No employees added yet.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ) : SizedBox(
                  height: 400,
                  child: ListView.builder(
                      itemCount: lstEmployee.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final employee = lstEmployee[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: const Icon(Icons.person),
                          ),
                          title: Text('${employee.fullname}'),
                          subtitle: Text('${employee.gender}   • ${employee.department}'),
                          trailing: const Icon(Icons.more_vert),
                          onTap: (){},
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
