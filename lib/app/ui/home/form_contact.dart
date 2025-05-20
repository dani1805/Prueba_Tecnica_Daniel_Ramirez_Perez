import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/colors.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/validators.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_button.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_input_form_field.dart';

class FormContact extends StatefulWidget {
  const FormContact({super.key});

  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  final key = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  DateTime? dateOfBirth;

  late HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    homeBloc = BlocProvider.of<HomeBloc>(context, listen: true);

    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StandardInputFormField(
                validator:
                    (value) => Validators.validateEmpty(
                      value,
                      'errors.empty-error'.tr(),
                    ),
                controller: nameController,
                type: TextInputType.text,
                onChanged: (value) {},
                hint: 'form-contact.hint-name'.tr(),
                color: Colors.black,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => doShowDatePicker(),
                child: StandardInputFormField(
                  validator:
                      (value) => Validators.validateEmpty(
                        value,
                        'errors.empty-error'.tr(),
                      ),
                  controller: dateOfBirthController,
                  type: TextInputType.text,
                  onChanged: (value) {},
                  hint: 'form-contact.hint-date'.tr(),
                  color: Colors.black,
                  enabled: false,
                ),
              ),
              SizedBox(height: 20),
              StandardInputFormField(
                validator:
                    (value) => Validators.validateEmpty(
                      value,
                      'errors.empty-error'.tr(),
                    ),
                controller: cityController,
                type: TextInputType.text,
                onChanged: (value) {},
                hint: 'form-contact.hint-city'.tr(),
                color: Colors.black,
              ),
              SizedBox(height: 20),
              StandardInputFormField(
                validator:
                    (value) => Validators.validatePhone(
                      value,
                      'errors.empty-error'.tr(),
                      'Introduzca un número de teléfono válido',
                    ),
                controller: phoneController,
                type: TextInputType.phone,
                onChanged: (value) {},
                hint: 'form-contact.hint-phone'.tr(),
                color: Colors.black,
              ),
              SizedBox(height: 20),
              StandardInputFormField(
                validator:
                    (value) => Validators.validateEmail(
                      value,
                      'errors.empty-error'.tr(),
                      'errors.email-error'.tr(),
                    ),
                controller: emailController,
                type: TextInputType.emailAddress,
                onChanged: (value) {},
                hint: 'form-contact.hint-email'.tr(),
                color: Colors.black,
              ),
              SizedBox(height: 50),
              StandardButton(
                text: 'form-contact.button-send-form-contact'.tr(),
                color: Colors.white,
                background:
                    key.currentState != null && key.currentState!.validate()
                        ? MColor.blue
                        : MColor.blue.withOpacity(0.3),
                border:
                    key.currentState != null && key.currentState!.validate()
                        ? MColor.blue
                        : MColor.blue.withOpacity(0.3),
                onTap:
                    key.currentState != null && key.currentState!.validate()
                        ? doSendFormContact
                        : () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void doSendFormContact() {
    homeBloc.add(DoSendFormContact());
  }

  void doShowDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
      confirmText: 'date-picker.button-confirm-date'.tr(),
      cancelText: 'date-picker.button-cancel-date'.tr(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: MColor.blue,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                foregroundColor: MColor.blue,
              ),
            ),
            datePickerTheme: const DatePickerThemeData(
              headerForegroundColor: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      dateOfBirth = date;
      final formatted = DateFormat('dd-MM-yyyy').format(date);
      setState(() => dateOfBirthController.text = formatted);
    }
  }
}
