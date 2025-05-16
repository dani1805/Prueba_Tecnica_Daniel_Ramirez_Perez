import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/colors.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/validators.dart';
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

  @override
  Widget build(BuildContext context) {
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
                    (value) =>
                        Validators.validateEmpty(value, 'Campo obligatorio'),
                controller: nameController,
                type: TextInputType.text,
                onChanged: (value) {},
                hint: 'Nombre',
                color: Colors.black,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => doShowDatePicker(),
                child: StandardInputFormField(
                  validator:
                      (value) =>
                          Validators.validateEmpty(value, 'Campo obligatorio'),
                  controller: dateOfBirthController,
                  type: TextInputType.text,
                  onChanged: (value) {},
                  hint: 'Fecha de nacimiento',
                  color: Colors.black,
                  enabled: false,
                ),
              ),
              SizedBox(height: 20),
              StandardInputFormField(
                validator:
                    (value) =>
                        Validators.validateEmpty(value, 'Campo obligatorio'),
                controller: cityController,
                type: TextInputType.text,
                onChanged: (value) {},
                hint: 'Ciudad',
                color: Colors.black,
              ),
              SizedBox(height: 20),
              StandardInputFormField(
                validator:
                    (value) => Validators.validatePhone(
                      value,
                      'Campo obligatorio',
                      'Introduzca un número de teléfono válido',
                    ),
                controller: phoneController,
                type: TextInputType.phone,
                onChanged: (value) {},
                hint: 'Número de teléfono',
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
                hint: 'login-page.hint-email'.tr(),
                color: Colors.black,
              ),
              SizedBox(height: 50),

              if (key.currentState != null && key.currentState!.validate())
                StandardButton(
                  text: 'home-page.send'.tr(),
                  color: Colors.white,
                  background: MColor.blue,
                  border: MColor.blue,
                  onTap: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }

  void doShowDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
      confirmText: 'Confirmar',
      cancelText: 'Cancelar',
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
