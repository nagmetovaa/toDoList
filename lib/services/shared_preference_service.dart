import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferenceService extends GetxService {

  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveProfile(String profileName) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> allProfiles = {};
    final jsonString = prefs.getString('profiles');
    if (jsonString != null) {
      allProfiles = jsonDecode(jsonString);
    }
    if (!allProfiles.containsKey(profileName)) {
      allProfiles[profileName] = [];
      await prefs.setString('profiles', jsonEncode(allProfiles));
    }
  }

  Future<List<String>> getProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('profiles');
    if (jsonString != null) {
      Map<String, dynamic> allProfiles = jsonDecode(jsonString);
      return allProfiles.keys.toList();
    }
    return [];
  }
  Future<void> saveTask(String profileName, String task) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? tasks = prefs.getStringList(profileName) ?? [];

    tasks.add(task);
    await prefs.setStringList(profileName, tasks);
  }

  Future<void> updateTaskState(String profileName, int index, bool isChecked) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? taskStates = prefs.getStringList('${profileName}_states') ?? [];

      if (index < taskStates.length) {
        taskStates[index] = isChecked.toString();
      } else {
        for (int i = taskStates.length; i <= index; i++) {
          taskStates.add('false');
        }
        taskStates[index] = isChecked.toString();
      }
      await prefs.setStringList('${profileName}_states', taskStates);
  }


  Future<void> saveTaskState(String profileName, int index, bool isChecked) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? taskStates = prefs.getStringList('${profileName}_states') ?? [];

    if (index < taskStates.length) {
      taskStates[index] = isChecked.toString();
    } else {
      taskStates.add(isChecked.toString());
    }

    await prefs.setStringList('${profileName}_states', taskStates);
  }

  Future<List<Object>> getTaskStates(String profileName) async {

    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('${profileName}_states') ?? [];
  }

  Future<List<String>> getTasks(String profileName) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(profileName) ?? [];
  }

  Future<void> deleteProfile(String profileName) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('profiles');
    if (jsonString != null) {
      Map<String, dynamic> allProfiles = jsonDecode(jsonString);
      if (allProfiles.containsKey(profileName)) {
        allProfiles.remove(profileName);
        await prefs.setString('profiles', jsonEncode(allProfiles));
        await prefs.remove(profileName);
        await prefs.remove('${profileName}_states');
      }
    }
  }


  Future<void> deleteTask(String profileName, int index) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? tasks = prefs.getStringList(profileName) ?? [];
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
      await prefs.setStringList(profileName, tasks);
      List<String>? taskStates = prefs.getStringList('${profileName}_states') ?? [];
      if (index >= 0 && index < taskStates.length) {
        taskStates.removeAt(index);
        await prefs.setStringList('${profileName}_states', taskStates);
      }
    }
  }

}

