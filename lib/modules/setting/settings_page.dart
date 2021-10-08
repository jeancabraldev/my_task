import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/applications/ui/theme_app.dart';
import 'package:my_task/components/menu/pages/menu_page.dart';
import 'package:my_task/services/theme_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Configurações',
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
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: 35,
                alignment: Alignment.center,
                color: Colors.black12,
                child: const Text('ALTERAÇÃO DA COR DO TEMA'),
              ),
              //const Divider(),
              MenuPages(
                icon: Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                title: 'Tema',
                subtitle: Get.isDarkMode
                    ? 'Tema escuro ativado'
                    : 'Tema claro ativado',
                onTap: () {
                  ThemeService().switchTheme();
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
