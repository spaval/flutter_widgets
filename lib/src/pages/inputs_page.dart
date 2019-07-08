import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name  = '';
  String _email = '';
  String _date  = '';
  TextEditingController _dateController = TextEditingController();
  List<String> _projects = ['Jowo', 'Bongga', 'Moments', 'Spiik', 'Touristeando'];
  String _currentProject = 'Jowo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createTextField(),
          SizedBox(height: 20.0),
          _createEmailField(),
          SizedBox(height: 20.0),
          _createPasswordField(),
          SizedBox(height: 20.0),
          _createDateField(context),
          SizedBox(height: 20.0),
          _createDropDown(),
          _displayData(),
        ],
      ),
    );
  }

  Widget _createTextField() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        counter: Text('${_name.length}'),
        hintText: 'Enter a name',
        labelText: 'Name',
        helperText: 'Only enter a name',
        prefixIcon: Icon(Icons.account_circle),
        suffixIcon: Icon(Icons.accessibility),
      ),
      onChanged: (value) => setState(() => _name = value),
    );
  }

  Widget _createEmailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        hintText: 'Enter an email',
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (value) => setState(() => _email = value),
    );
  }

  Widget _createPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        hintText: 'Enter your password',
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.lock_open),
      ),
    );
  }

  Widget _createDateField(BuildContext context) {
    return TextField(
      controller: _dateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        hintText: 'Enter a date',
        labelText: 'Date',
        prefixIcon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _displayDatePicker(context);
      },
    );
  }

  void _displayDatePicker(BuildContext context) async {
    DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017),
      lastDate: DateTime(2020),
      locale: Locale('es', 'ES'),
    );

    if(pickedDate != null) {
      setState(() => _date = pickedDate.toString());
      _dateController.text = _date;
    }
  }

  Widget _createDropDown() {
    return DropdownButton(
      value: _currentProject,
      items: _getProjectItems(),
      onChanged: (value) => setState(() => _currentProject = value),
    );
  }

  List<DropdownMenuItem<String>> _getProjectItems() {
    List<DropdownMenuItem<String>> data = [];

    _projects.forEach((item) {
      final row = DropdownMenuItem(
        value: item,
        child: Row(
          children: <Widget>[
            Icon(Icons.call_merge),
            Text(item),
          ],
        ),
      );

      data.add(row);
    });

    return data;
  }

  Widget _displayData() {
    return ListTile(
      title: Text('Nombre: $_name'),
      subtitle: Text('Email: $_email'),
    );
  }
}