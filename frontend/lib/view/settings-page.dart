import 'package:flutter/material.dart';
import 'package:fleet/cubit/become-admin.dart';
import 'package:fleet/cubit/server.dart';
import 'package:fleet/cubit/user.dart';
import 'package:fleet/model/user.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/view/common/back-button.dart';
import 'package:fleet/view/common/loading.dart';

class BecomeAdminField extends StatefulWidget {
  const BecomeAdminField({Key? key}) : super(key: key);

  @override
  State<BecomeAdminField> createState() => _BecomeAdminFieldState();
}

class _BecomeAdminFieldState extends State<BecomeAdminField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BecomeAdminCubit, BecomeAdminState>(
      listener: (c, s) {
        if (s.becameAdmin) {
          Navigator.pop(context);
          c.read<UserCubit>().getUser();
        }
      },
      builder: (context, baState) {
        if (baState.code != _controller.text) _controller.text = baState.code;

        return ExpansionTile(
          title: const Text('Become Admin'),
          children: [
            if (baState.loadingBecomeAdmin) ...[
              const Loading(text: 'Becoming Admin'),
            ] else ...[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Become an Admin',
                  errorText: baState.errBecomingAdmin.nullIfEmpty(),
                ),
                onChanged: (t) {
                  context.read<BecomeAdminCubit>().codeChanged(t);
                },
              ),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () {
                  context.read<BecomeAdminCubit>().becomeClicked();
                },
                child: const Text('Confirm'),
              ),
              const SizedBox(height: 40),
            ]
          ],
        );
      },
    );
  }
}

class ServerUrlField extends StatefulWidget {
  const ServerUrlField({Key? key}) : super(key: key);

  @override
  State<ServerUrlField> createState() => _ServerUrlFieldState();
}

class _ServerUrlFieldState extends State<ServerUrlField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final serverState = context.select((ServerCubit sc) => sc.state);
    if (serverState.url != _controller.text) _controller.text = serverState.url;

    return ExpansionTile(
      title: const Text('SERVER URL'),
      children: [
        TextField(
          controller: _controller,
          onChanged: (t) {
            context.read<ServerCubit>().urlChanged(t);
          },
        ),
        TextButton(
          onPressed: () {
            context.read<ServerCubit>().pasteUrl();
          },
          child: const Text('Paste'),
        ),
        const SizedBox(height: 32),
        TextButton(
          onPressed: () {
            context.read<ServerCubit>().updateUrl();
          },
          child: const Text('Update URL'),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserCubit u) => u.state.user);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Back(),
                const SizedBox(height: 32),
                if (user != null && !user.isAdmin) const BecomeAdminField(),
                // const SizedBox(height: 100),
                const ServerUrlField(),
                const SizedBox(height: 100),
                if (user != null)
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.read<UserCubit>().logOut();
                      },
                      child: Text(
                        'LOG OUT',
                        style: context.fonts.button!.copyWith(
                          color: context.colours.error,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
