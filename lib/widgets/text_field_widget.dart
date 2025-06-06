import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? lable;
  final int? maxLines;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFieldWidget({super.key, required this.controller, this.hintText, this.lable, this.maxLines, this.textInputType, this.textInputAction, this.validator, this.inputFormatters, });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(lable!, style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.black ),),
        SizedBox(
          child: TextFormField(
              controller: controller,
              inputFormatters: inputFormatters,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey.shade700),
              textInputAction: textInputAction,
              textDirection: TextDirection.rtl,
              maxLines: maxLines ?? 1,
              
              keyboardType: textInputType,
              minLines: maxLines != null ? maxLines! - 2 : null ,
              validator: (e)=> e!.isEmpty ? 'لطفا ${lable!} را وارد کنید' : null,
              decoration: InputDecoration(
                errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.error, fontSize: 8,height: 0.4),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade100),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red.shade300),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                isDense: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey.shade500, fontSize: 12),
                // contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
          ),
        ),
      ],
    );
  }
}
