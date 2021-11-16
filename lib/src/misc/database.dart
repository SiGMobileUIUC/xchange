import 'package:postgres/postgres.dart';
import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;

class database {
  Future<List<List<dynamic>>> signIn(String command) async {
    load();

    var connection = PostgreSQLConnection(env['ADDRESS'] ?? "",
        int.parse(env['PORT'] ?? "0"), env["DATABASE"] ?? "",
        username: env['USERNAME'], password: env['PASSWORD'], useSSL: true);
    List<List<dynamic>> results = [];
    try {
      await connection.open();
      print("Connected");
      results = await connection.query(command); //"SELECT * FROM users"
    } catch (e) {
      print("error");
      print(e.toString());
    }
    return results;
  }

  // Future getInfo(String command) {
  //   Future data = signIn(command);
  //   return data;
  // }
}
