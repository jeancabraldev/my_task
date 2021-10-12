import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_task/applications/ui/theme_app.dart';
import 'package:my_task/components/button/button.dart';
import 'package:my_task/components/input/input_fields.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = '09:32 PM';
  int _selectedReimind = 5;
  final List<int> _remindList = [5, 10, 15, 20];
  String _selectedRepeat = 'Nunca';
  final List<String> _repeatList = [
    'Nunca',
    'Diáriamente',
    'Semanalmente',
    'Mensalmente',
    ];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {                            
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Adicionar Tarefa',
          style: titleAppBar,
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.close,
            color: Get.isDarkMode
                ? const Color(0xffffffff)
                : const Color(0xff212529),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputFields(
                  controller: _controllerTitle,
                  title: 'Título',
                  hint: 'Digite um título',
              ),
              const SizedBox(height: 10),
              InputFields(
                  controller: _controllerDescription,
                  title: 'Descrição',
                  hint: 'Digite uma descrição',
              ),
              const SizedBox(height: 10),
              InputFields(
                title: 'Data',
                hint: DateFormat.yMd('pt-BR').format(_selectedDate),
                widget: IconButton(
                  icon: Icon(Icons.calendar_today_rounded,
                      color: Colors.grey[600]),
                  onPressed: () => _getDateFromUser(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InputFields(
                      title: 'Hora inicial', 
                      hint: _startTime,
                      widget: IconButton(
                        icon: Icon(Icons.access_time_rounded,
                          color: Colors.grey[600],
                        ),
                        onPressed: () =>  _getTimeFromUser(isStartTime: true),
                        
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InputFields(
                      title: 'Hora Final',
                      hint: _endTime,
                      widget: IconButton(
                        icon: Icon(Icons.access_time_rounded,
                          color: Colors.grey[600],

                        ),
                        onPressed: () => _getTimeFromUser(isStartTime: false), 
                      ),  
                      ), 
                  ),
                ],
              ),
              const SizedBox(height: 10),
              InputFields(
                title: 'Lembrar', 
                hint: '$_selectedReimind minutos',
                widget: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height: 0),
                  items: _remindList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()), 
                    );
                  }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      if(newValue != null){
                        _selectedReimind = int.parse(newValue);
                      }
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              InputFields(
                title: 'Repetir', 
                hint: '$_selectedRepeat ',
                widget: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height: 0),
                  items: _repeatList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      if(newValue != null){
                        _selectedRepeat = newValue;
                      }
                    });
                  },
                ),  
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selecione uma cor', style: titleBody,),
                  _selectedColorPalette(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: Get.width,
                      height: 50,
                      child: ButtonWidget(
                        icon: Icons.add_task,
                        label: 'ADICIONAR TAREFA',
                        onPressed: () => _validateFields(),
                      ),
                    ),
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Validando campos
  _validateFields(){
    if(_controllerTitle.text.isNotEmpty
        && _controllerDescription.text.isNotEmpty){
      //Database
      Get.back();
    }else if(_controllerTitle.text.isEmpty
        || _controllerDescription.text.isEmpty){
      Get.snackbar('Atenção', 'Todos os campos são obrigatórios!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        icon: const Icon(Icons.warning,),
      );
    }
  }

  //Selecionando cores para as tarefas
  _selectedColorPalette(){
    return                   Wrap(
      children: List<Widget>.generate(
          4,
              (int index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 10),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor:
                  index == 0 ? const Color(0xffF50057) :
                  index == 1 ? const Color(0xff5773fd) :
                  index == 2 ? Colors.orange : Colors.green,
                  child: _selectedColor == index
                      ? const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 16,
                  )
                      : Container(),
                ),
              ),
            );
          }
      ),
    );
  }

  //Exibindo calendario
  Future<DateTime?>_getDateFromUser() async{
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now()
        firstDate: DateTime(2018),
        lastDate: DateTime(2121),
        locale: const Locale('pt', 'BR'),
    );

    if(_pickerDate != null){

      setState(() {
      _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    }else{
      print('Nulo');
    }
  }

  //Exibindo hora
  Future<TimeOfDay?>_getTimeFromUser({required bool isStartTime}) async{
    var pickedTime = await _showTimePicker();
    var _formatedTime = pickedTime.format(context);

    if(pickedTime == null){
      print('Hora cancelada');
    } else if(isStartTime == true){

      setState(() {
      _startTime = _formatedTime;  
      });

    } else if(isStartTime == false){

      setState(() {
      _endTime = _formatedTime;  
      });
    }
  }

  _showTimePicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context, 
      initialTime: TimeOfDay(        
        hour: int.parse(_startTime.split(':')[0]), 
        minute: int.parse(_startTime.split(':')[1].split(' ')[0]),
      ),
    );
  }
}
