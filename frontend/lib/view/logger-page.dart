import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fleet/cubit/logger.dart';
import 'package:fleet/cubit/server.dart';
import 'package:fleet/pkg/extensions.dart';

class LogItem extends StatelessWidget {
  const LogItem(this.log);

  final Log log;

  @override
  Widget build(BuildContext context) {
    if (log.type == LogType.event)
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Text('EVENT from ' + log.bloc!), Text(log.event!)],
        ),
      );

    if (log.type == LogType.api)
      return ExpansionTile(
        // maintainState: false,
        tilePadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(log.path!),
              const SizedBox(height: 8),
              Text('STATUS: ' + log.statusCode!)
            ],
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onLongPress: () {},
              child: Text(log.response!),
            ),
          )
        ],
      );

    if (log.type == LogType.exception)
      return ExpansionTile(
        // maintainState: false,
        tilePadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                log.exceptionSource!,
              ),
              const SizedBox(height: 8),
              Text('EXCEPTION: ' + log.exceptionType!)
            ],
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onLongPress: () {},
              child: Text(log.stackTrace!),
            ),
          )
        ],
      );

    return Container();
  }
}

class LogPage extends StatelessWidget {
  const LogPage();

  @override
  Widget build(BuildContext c) {
    final logs = c.select((Logger l) => l.state.logs);
    return Scaffold(
      backgroundColor: c.colours.background,
      appBar: AppBar(
        title: const Text(
          'LOGS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: c.colours.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(c);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final l in logs) LogItem(l),
          ],
        ),
      ),
    );
  }
}
