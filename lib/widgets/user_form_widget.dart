import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scaleup_ally_task/services/add_user_form_data.dart';
import '../helpers/password_field.dart';

enum ImagePickerType { camera, gallery }

class UserFormWidget extends StatefulWidget {
  const UserFormWidget({Key? key}) : super(key: key);

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passController = TextEditingController();

  TextEditingController _confirmpassController = TextEditingController();

  int radioValue = 0;
  var genderOptions = ['Male', 'Female', 'Other'];

  String? gender, dob;

  bool hasImage = false;
  File? image;
  final _formKey = GlobalKey<FormBuilderState>();
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        hasImage = true;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  TextEditingController _dateTimeController = TextEditingController();

  clearTextFields() {
    _nameController.clear();
    _emailController.clear();
    _passController.clear();
    _confirmpassController.clear();
    _dateTimeController.clear();
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (builder) {
          return Container(
            height: 100.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await getImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            SizedBox(height: 20),
                            Icon(
                              Icons.camera_alt,
                            ),
                            Text("Camera"),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await getImage(ImageSource.gallery);
                          Navigator.pop(context);

                          // await pickImage(ImagePickerType.);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            SizedBox(height: 20),
                            Icon(
                              Icons.photo_library,
                            ),
                            Text("Gallery"),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _modalBottomSheetMenu();
                },
                child: image == null
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        color: const Color.fromRGBO(147, 147, 147, 1),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(12)),
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.camera_enhance_rounded,
                                  color: Color.fromRGBO(147, 147, 147, 1),
                                  size: 25,
                                ),
                                Text("Upload",
                                    style: TextStyle(
                                      color: Color.fromRGBO(147, 147, 147, 1),
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          children: [
                            Image.file(
                              File(
                                image?.path ?? "",
                              ),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                            Positioned(
                              right: 1.0,
                              top: 1.0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    image = null;
                                    hasImage = false;
                                  });
                                },
                                child: const Icon(
                                  Icons.delete,
                                  size: 25,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              FormFieldHepler(
                textInputType: TextInputType.name,
                isPassowrd: false,
                fieldKey: "name",
                hintText: "Full Name",
                controller: _nameController,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormFieldHepler(
                textInputType: TextInputType.emailAddress,
                isPassowrd: false,
                fieldKey: "email",
                hintText: "Email",
                controller: _emailController,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormFieldHepler(
                textInputType: TextInputType.visiblePassword,
                isPassowrd: true,
                fieldKey: "createpassword",
                hintText: "Create Paasword",
                controller: _passController,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxLength(8),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormFieldHepler(
                textInputType: TextInputType.visiblePassword,
                isPassowrd: true,
                fieldKey: "confirmpassword",
                hintText: "Confirm Paasword",
                controller: _confirmpassController,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.match(_passController.text,
                      errorText: "Password does not match"),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderDropdown(
                onChanged: (String? value) {
                  setState(() {
                    gender = value;
                  });
                },
                name: 'gender',
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // initialValue: 'Male',
                allowClear: true,
                hint: const Text('Select Gender'),

                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(),
                  ],
                ),
                items: genderOptions
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text('$gender'),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderDateTimePicker(
                controller: _dateTimeController,
                onChanged: (DateTime? value) {
                  setState(() {
                    dob = DateFormat('DD/MM/YYYY').format(value!);
                  });
                },
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(),
                  ],
                ),
                inputType: InputType.date,
                name: 'datetime',
                firstDate: DateTime(1970),
                lastDate: DateTime(2030),
                format: DateFormat('DD/MM/YYYY'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(
                    Icons.calendar_month_outlined,
                  ),
                  hintText: 'Date of Birth',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RadioTheme(
                data: RadioThemeData(
                  fillColor: MaterialStateProperty.all(Colors.green),
                ),
                child: FormBuilderRadioGroup(
                  name: "radio",
                  decoration: const InputDecoration.collapsed(hintText: ""),
                  options: [
                    FormBuilderFieldOption(
                      value: 0,
                      child: Text(
                        "Active",
                        style: TextStyle(
                            color: radioValue == 0 ? Colors.black : Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text(
                        "Suspened",
                        style: TextStyle(
                            color: radioValue == 1 ? Colors.black : Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                  controlAffinity: ControlAffinity.leading,
                  initialValue: radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(29, 38, 119, 1),
                  fixedSize: Size(MediaQuery.of(context).size.width, 48),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select image"),
                        ),
                      );
                    } else {
                      try {
                        await adduserformData(
                          name: _nameController.text,
                          email: _emailController.text,
                          dob: dob!,
                          gender: gender!,
                          userStatus: radioValue == 0 ? "Active" : "Suspened",
                          image: image,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Form Submitted"),
                          ),
                        );
                        // _formKey.currentState!.fields["datetime"]?.reset();
                        _formKey.currentState!.fields["datetime"]?.reset();

                        _formKey.currentState!.fields["gender"]?.reset();

                        setState(() {});

                        clearTextFields();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Something went wrong"),
                          ),
                        );
                      }
                    }
                  } else {
                    print("validation failed");
                  }
                },
                child: const Text(
                  "Submit",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
