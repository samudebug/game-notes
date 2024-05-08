import 'package:game_notes/app/note_group/note_group_controller.dart';
import 'package:get/get.dart';

class NoteGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteGroupController());
  }
  
}