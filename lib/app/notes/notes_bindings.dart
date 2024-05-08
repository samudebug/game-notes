import 'package:game_notes/app/notes/notes_controller.dart';
import 'package:get/get.dart';

class NotesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotesPageController());
  }
  
}