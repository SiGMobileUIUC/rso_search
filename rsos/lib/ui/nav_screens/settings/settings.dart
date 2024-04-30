// import 'package:flutter/material.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text("Settings Page"),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool value = false; // Initialize the switch value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Settings Page"),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Section'),
            tiles: [
              SettingsTile(
                title: const Text('Language'),
                description: const Text( 'English'),
                leading: const Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: const Text('Use fingerprint'),
                leading: const Icon(Icons.fingerprint),
                initialValue: value,
                onToggle: (bool newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}