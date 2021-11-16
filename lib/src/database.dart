import 'package:postgres/postgres.dart';

class database {
  Future<List<List<dynamic>>> signIn(String command) async {
    var connection = PostgreSQLConnection(
        "ec2-54-224-194-214.compute-1.amazonaws.com", 5432, "d1lanfsa3i6j9o",
        username: "vszmgrceclzrsv",
        password:
            "52c26c636820b257d60e305c7fd431d35365368b1c49b8c092834cb494fc36d3",
        useSSL: true);
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
