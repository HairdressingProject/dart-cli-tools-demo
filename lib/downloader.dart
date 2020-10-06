import 'dart:io';
import 'package:path/path.dart' as p;


class Downloader {

	

	static void download(String url, String save_path, String file_name) async {

		Downloader downloader = Downloader();
		await downloader._get(url, save_path, file_name); 
		// wait downloader._download(url);
	}

	void _get(String url, String save_path, String file_name) {
		// retrieve current directory
		final path = p.current;

		print("\n  " + url + "/");

		HttpClient()
			.getUrl(Uri.parse(url)) // produces a request object
			.then((request) => request.close()) // sends the request
			.then((response) =>
				response.pipe(new File('$path/test_dir/$save_path/$file_name').openWrite()));
				// response.transform(Utf8Decoder()).listen(print)); // transforms and prints the response


	}

	
}