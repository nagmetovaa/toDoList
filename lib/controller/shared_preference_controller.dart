import 'package:get/get.dart';
import '../services/shared_preference_service.dart';

class SharedPreferenceController extends GetxController {

  late SharedPreferenceService _preferencesService;
  var profiles = <String>[].obs;
  var tasks = <String>[].obs;
  var selectedProfile = ''.obs;
  var taskStates = <RxBool>[].obs;

  @override
  void onInit() {
    super.onInit();
    _preferencesService = Get.find<SharedPreferenceService>();
    loadProfiles();
  }


  Future<void> loadProfiles() async {
    profiles.value = await _preferencesService.getProfiles();
    if (profiles.isNotEmpty) {
      selectedProfile.value = profiles[0];
      loadTasks(selectedProfile.value);

    }
  }
  void updateTaskState(int index, bool isChecked) async {
    if (index >= 0 && index < taskStates.length) {
      taskStates[index].value = isChecked;
      print('Task at index $index updated to $isChecked');
      await _preferencesService.updateTaskState(selectedProfile.value, index, isChecked);
    }
  }

  Future<void> loadTasks(String profileName) async {
    if (profileName.isNotEmpty) {
      tasks.value = await _preferencesService.getTasks(profileName);
      var loadedTaskStates = await _preferencesService.getTaskStates(profileName);
      taskStates.value = List.generate(
          tasks.length,
              (index) => (loadedTaskStates.length > index
              ? loadedTaskStates[index] == 'true'
              : false).obs
      );
    }
  }

  Future<void> addProfile(String profileName) async {
    await _preferencesService.saveProfile(profileName);
    profiles.add(profileName);
    selectedProfile.value = profileName;
    tasks.clear();
  }

  Future<void> addTask(String profile_name, String task) async {
    if (task.isNotEmpty && selectedProfile.isNotEmpty) {
      await _preferencesService.saveTask(profile_name, task);
      tasks.add(task);
      taskStates.add(false.obs);
    }
  }

  Future<void> removeProfile(String profileName) async {
    await _preferencesService.deleteProfile(profileName);
    profiles.remove(profileName);
    if (selectedProfile.value == profileName) {
      selectedProfile.value = profiles.isNotEmpty ? profiles.first : '';
      await loadTasks(selectedProfile.value);
    }
  }

  Future<void> removeTask(String profileName, int index) async {
    if (selectedProfile.isNotEmpty) {
      await _preferencesService.deleteTask(profileName, index);
      print('The the task number $index in $profileName is deleted already.');
      tasks.removeAt(index);
      taskStates.removeAt(index);
    }
  }
}