import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manage_tasks/Core/utils/cash_helper.dart';
import '../../Core/widgets/custom_text_field.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final jobTitleController = TextEditingController();
  final addressController = TextEditingController();
  String? selectedGender;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    jobTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3E50),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Join TaskMate Start\norganizing your day!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 50),

                  CustomTextField(
                    controller: firstNameController,
                    hintText: 'First Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your First name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: lastNameController,
                    hintText: 'Last Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  CustomTextField(
                    controller: jobTitleController,
                    hintText: 'Job Title',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your job title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: addressController,
                    hintText: 'Address',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF34495E),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text(
                              'Male',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            value: 'Male',
                            groupValue: selectedGender,
                            activeColor: const Color(0xFF0A8CED),
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text(
                              'Female',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            value: 'Female',
                            groupValue: selectedGender,
                            activeColor: const Color(0xFF0A8CED),
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A8CED),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate() &&
                            selectedGender != null) {
                          await CacheHelper.saveData(
                            key: 'isLogin',
                            value: true,
                          );
                          await CacheHelper.saveData(
                            key: 'email',
                            value: emailController.text,
                          );
                          await CacheHelper.saveData(
                            key: 'jobTitle',
                            value: jobTitleController.text,
                          );
                          await CacheHelper.saveData(
                            key: 'firstName',
                            value: firstNameController.text,
                          );
                          await CacheHelper.saveData(
                            key: 'lastName',
                            value: lastNameController.text,
                          );
                          await CacheHelper.saveData(
                            key: 'address',
                            value: addressController.text,
                          );
                          await CacheHelper.saveData(
                            key: 'gender',
                            value: selectedGender!,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Account created successfully!'),
                              backgroundColor: Colors.grey,
                            ),
                          );
                          context.go('/home');
                        } else if (selectedGender == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select your gender'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Let\'s Start!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
