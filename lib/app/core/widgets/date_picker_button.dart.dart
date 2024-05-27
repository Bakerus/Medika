import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';

class DatePickerButton extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const DatePickerButton({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  _DatePickerButtonState createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        widget.controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        height: 60.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Appcolors.greyTextfield,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: Appcolors.greyPrimary,
              size: 22.0,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                widget.controller.text.isEmpty
                    ? widget.hintText
                    : widget.controller.text,
                style: TextStyle(
                  color: widget.controller.text.isEmpty
                      ? Appcolors.blackPrimary.withOpacity(0.6)
                      : Appcolors.blackPrimary,
                  fontFamily: 'Outfit',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
