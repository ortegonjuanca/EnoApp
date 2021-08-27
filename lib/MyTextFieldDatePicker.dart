import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyTextFieldDatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateChanged;
  final DateTime initialDate;
  final DateFormat dateFormat;
  final FocusNode focusNode;
  final String labelText;
  final Icon prefixIcon;
  final Icon suffixIcon;

  MyTextFieldDatePicker({
    Key key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.dateFormat,
    @required this.initialDate,
    @required this.onDateChanged,
  })  : assert(initialDate != null),
        assert(onDateChanged != null, 'onDateChanged must not be null'),
        super(key: key);

  @override
  _MyTextFieldDatePicker createState() => _MyTextFieldDatePicker();
}

class _MyTextFieldDatePicker extends State<MyTextFieldDatePicker> {
  TextEditingController _controllerDate;
  DateFormat _dateFormat;
  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    if (widget.dateFormat != null) {
      _dateFormat = widget.dateFormat;
    } else {
      _dateFormat = DateFormat.yMMMMEEEEd();
    }

    _selectedDate = widget.initialDate;

    _controllerDate = TextEditingController();
    _controllerDate.text = _dateFormat.format(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: _controllerDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 2, color: Color(0xff6f0000)),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        suffixStyle: TextStyle(color: Color(0xff6f0000)),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Color(0xff6f0000))
      ),
      onTap: () => _selectDate(context),
      readOnly: true,
    );
  }

  @override
  void dispose() {
    _controllerDate.dispose();
    super.dispose();
  }

  Future<Null> _selectDate(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != _selectedDate)
                  setState(() {
                    _selectedDate = picked;
                    _controllerDate.text = _dateFormat.format(_selectedDate);
                    widget.onDateChanged(_selectedDate);
                  });
              },
              initialDateTime: _selectedDate,
            ),
          );
        });
  }
}