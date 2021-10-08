import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/components/drawer/components/header.dart';
import 'package:my_task/components/drawer/components/menu.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
      ),
      child: SizedBox(
        width: Get.width * 0.80,
        child: Drawer(
          child: ListView(
            children: [
              const HeaderDrawer(),
              const SizedBox(height: 10),
              Menus(
                title: 'Configurações',
                icon: Icons.settings,
                onTap: () => Get.offAndToNamed('/settings'),
              ),
              const Divider(),
              const Menus(
                title: 'Sobre',
                icon: Icons.info,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
