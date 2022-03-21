import 'package:utiler/utiler.dart' as utiler;
import 'package:open_url/open_url.dart';
import 'dart:io';
import 'package:console/console.dart';

void main(List<String> arguments) {
  Console.init();
  if (arguments.isNotEmpty) {
    if (arguments[0] == 'browser') {
      browser(arguments);
    } else if (arguments[0] == 'exec') {
      execPrompt(arguments);
    } else if (arguments[0] == 'copy') {
      print('will be here soon!!');
    } else if (arguments[0] == 'time') {
      time();
    } else if (arguments[0] == 'search') {
      search(arguments);
    } else if (arguments[0] == 'tutorial') {
      tutorial();
    } else {
      help();
    }
  } else {
    help();
  }
}

void browser(List<String> arguments) async {
  try {
    String link = 'www.google.com';
    if (arguments.length > 1) {
      link = arguments[1];
    }
    print('opening $link in your browser');
    await openUrl(link);
  } catch (ex) {
    print('error occurred');
  }
}

void execPrompt(List<String> arguments) async {
  try {
    if (arguments.length > 1) {
      print('esecuzione del comando ${arguments[1]} in corso');
      ProcessResult res = await Process.run(arguments[1], arguments.sublist(2),
          runInShell: true);
      print(res.stdout);
    }
  } catch (ex) {
    print(ex);
  }
}

void time() {
  print(DateTime.now().toString());
}

void search(List<String> arguments) async {
  try {
    String s = '';
    arguments.forEach((element) => {s += element + " "});
    print('searching "$s" on google');

    Uri httpsUri = Uri(
        scheme: 'https',
        host: 'google.com',
        path: '/search',
        queryParameters: {'q': s});
    await openUrl(httpsUri.toString());
  } catch (ex) {
    print('error occurred');
  }
}

void tutorial() async {
  print('Welcome to the utiler installation guide');
  print('1) open start menu');
  print('2) search "edit the system environment variables"');
  print('3) double click on "path"');
  print('4) add the folder where this file is in');
  print('5) type utiler in terminal');
}

void help() {
  print(
      '\nutiler [command] [optional arguments]\ncommand: the command you want to use\naptional arguments: see command documentation');
  print('\nversion: 1.0.0');
  print('\ncommand:\n');
  print('browser -> Open the browser (utiler browser [www.google.com])');
  print(
      'exec -> Exec every type of program or cli command (utiler exec ipconfig)');
  print('time -> Print the current timestamp (utiler time)');
  print(
      'search -> Search on google what you want (utiler search [hello world in dart])');
  print('tutorial -> Read the installation guide (utiler tutorial)');
}
