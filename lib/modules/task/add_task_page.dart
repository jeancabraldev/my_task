import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/applications/ui/theme_app.dart';
import 'package:my_task/components/input/input_fields.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('QUAL E O PROBLEMA?'),
            ],
          ),
        ),
      ),
    );
  }
}
