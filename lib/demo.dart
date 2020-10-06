import 'dart:io';
import 'package:dart_cli_tools_demo/scanner.dart';
import 'package:dart_cli_tools_demo/downloader.dart';

class Demo {

	static void hello(String name) => print("hello ${name}!");

	static void usage() => print("usage: main.dart [ hello | scan {dirname} ] | download {url} {save_path} {file_name}]");

	static void parse(List<String> args) {


		try {		
			switch (args[0]) {

				case 'hello':
					return Demo.hello(Platform.localHostname);

				case 'scan':
					return (args[1] != null) ? Scanner.scan(args[1]) : Demo.usage();
				
				case 'download':
					return (args[1] != null && args[2] != null && args[3] != null) ? Downloader.download(args[1], args[2], args[3]) : Demo.usage();
				
				default: 
					return Demo.usage();
			}
		} 
		catch(Exception) { Demo.usage(); }
	}
}