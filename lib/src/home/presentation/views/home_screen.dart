import 'package:faisal_starter_code_flutter/core/common/widgets/action_button.dart';
import 'package:faisal_starter_code_flutter/core/resources/media.dart';
import 'package:faisal_starter_code_flutter/src/home/presentation/widgets/logo_icon.dart';
import 'package:faisal_starter_code_flutter/src/users/presentation/views/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const path = '/home';
  static const name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedUser;

  Future<void> _selectUser(BuildContext context) async {
    final user = await context.pushNamed<String?>(UsersScreen.name);

    if (user == null) {
      return;
    }

    setState(() {
      _selectedUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          LogoIconButton(
            onPressed: () {},
            logo: Media.flutterLogo,
          ),
          LogoIconButton(
            onPressed: () {},
            logo: Media.dartLogo,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome to Faisal's Started Code Flutter"),
            Expanded(
              child: Center(
                child: Text(_selectedUser ?? 'Please select a user.'),
              ),
            ),
            ActionButton(
              onPressed: () => _selectUser(context),
              child: const Text('Select User'),
            ),
          ],
        ),
      ),
    );
  }
}
