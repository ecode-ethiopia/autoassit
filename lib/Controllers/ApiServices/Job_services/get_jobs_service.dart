import 'dart:convert';
import 'package:autoassit/Controllers/ApiServices/variables.dart';
import 'package:autoassit/Models/jobModel.dart';
import 'package:http/http.dart' as http;

class GetJobsController {
  static const String url = '${URLS.BASE_URL}/job/getJobs';

  static Future<List<Job>> getJobs() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Job> list = parseJobs(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Job> parseJobs(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Job>((json) => Job.fromJson(json)).toList();
  }
}
