import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/applications/ui/theme_app.dart';
import 'package:my_task/components/button/button.dart';
import 'package:my_task/components/drawer/drawer.dart';
import 'package:my_task/modules/task/add_task_page.dart';
import 'package:my_task/services/notification_service.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  dynamic notificationService;
  @override
  void initState() {
    super.initState();
    notificationService = NotificationService();
    notificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Minhas Tarefas',
          style: titleAppBar,
        ),
        leading: Builder(builder: (builder) {
          return IconButton(
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            icon: Icon(
              Icons.menu,
            color: Get.isDarkMode
                ? const Color(0xffffffff)
                : const Color(0xff212529),
            ),
          );
        }),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.yMMMMd().format(DateTime.now())),
                  ],
                ),
                ButtonWidget(
                  icon: Icons.add_task,
                  label: 'Nova tarefa',
                  onPressed: () => Get.to(() => const AddTaskPage()),
                ),
              ],
            ),
            const SizedBox(height: 20),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              locale: 'PT-BR',
              height: 100,
              width: 80,
              selectionColor: Get.isDarkMode
                  ? const Color(0xff5773fd)
                  : const Color(0xffF50057),
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              dayTextStyle: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
              ),
              monthTextStyle: TextStyle(
                fontSize: 12,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              onDateChange: (date) {
                _selectedDate = date;
              },
            ),
          ],
        ),
      ),
    );
  }
}


/*
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Tarefas'),
        backgroundColor: context.theme.appBarTheme.backgroundColor,
        /*leading: GestureDetector(
          onTap: () {
            ThemeService().switchTheme();
            /*notificationService.displayNotification(
              title: 'Testando tema',
              description:
                  Get.isDarkMode ? 'Tema claro ativado' : 'Tema escuro ativado',
            );*/

            //notificationService.scheduledNotification();
          },
          child: Icon(
            Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),*/
      ),
      body: Center(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Menus(
              onTap: () {
                ThemeService().switchTheme();
              },
              icon: Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              title: 'Alterar Tema',
            ),
          ),
        ),
      ),
    );
  }
}*/
