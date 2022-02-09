import 'package:get/get.dart';
import 'package:teno/core/constant/app_images.dart';

class HomeScreenController extends GetxController {
  List<QuizDetails> quizDetailsList = [
    QuizDetails(image: AppImage.marvelImage, name: "Marvel's Avengers Quiz"),
    QuizDetails(image: AppImage.bMovie, name: "Bollywood Movie's Quiz"),
    QuizDetails(image: AppImage.wweImage, name: "WWE Quiz"),
    QuizDetails(image: AppImage.moviesImage, name: "Hollywood Movie's Quiz"),
  ];

  List<String> _typeOfQuizList = [];

  List<String> get typeOfQuizList => _typeOfQuizList;

  set typeOfQuizList(List<String> value) {
    _typeOfQuizList = value;
    update();
  }

  String _selectedTitleQuiz = "";

  String get selectedTitleQuiz => _selectedTitleQuiz;

  set selectedTitleQuiz(String value) {
    _selectedTitleQuiz = value;
    update();
  }

  List<String> _selectedQuiz = [];

  List<String> get selectedQuiz => _selectedQuiz;

  set selectedQuiz(List<String> value) {
    _selectedQuiz = value;
    update();
  }

  selectedListQuiz(String value) {
    selectedQuiz.clear();
    selectedQuiz.addAll(quizName);
    int index = 0;
    for (var i = 0; i < selectedQuiz.length; i++) {
      if (selectedQuiz[i] == value) {
        index = i;
        break;
      }
    }
    selectedTitleQuiz = selectedQuiz[index];
    selectedQuiz.removeAt(index);
    typeOfQuizList = selectedQuiz;
    update();
  }

  List<String> adsBanner = [
    AppImage.banner1,
    AppImage.banner2,
    AppImage.banner3,
    AppImage.banner4,
    AppImage.banner5,
    AppImage.banner6,
    AppImage.banner7,
    AppImage.banner8,
  ];

  List<String> quizResult = ["This Month", "This Week", "Today"];
  int _quizResultSelected = 2;

  int get quizResultSelected => _quizResultSelected;

  set quizResultSelected(int value) {
    _quizResultSelected = value;
    update();
  }
}

class QuizDetails {
  String image, name;
  QuizDetails({required this.image, required this.name});
}

List<String> quizName = [
  "Live Quiz",
  "Normal Quiz",
  "Qpl",
  "QFG",
  "Tournament",
  "Any other"
];
