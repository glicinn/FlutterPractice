import 'dart:io';
import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;

void main() {
  print('Добро пожаловать в электронный журнал!');
  actionSelect();
}

void actionSelect(){
  StudentList action = StudentList();
  print('\nВот список доступных действий:');
  print(' 1. Добавление студента \n 2. Студенты с наивысшим баллом \n 3. Студенты с наименьшим баллом \n 4. Средний балл студентов \n 5. Удаление студента \n 6. Изменение студента \n 7. Вывод списка студентов \n 8. Выход');
  print('\nВведите номер действия:');
  var num = int.parse(stdin.readLineSync() ?? '6');
  switch(num){      
        case 1: 
            action.addStudent();
        case 2: 
            action.getStudentWithHighestGrade();
        case 3: 
            action.getStudentWithLowestGrade();
        case 4: 
            action.getAverageGrade();
        case 5: 
            action.deleteStudentById();
        case 6: 
            action.updateStudentById();
        case 7: 
            print('\n 1. Вывести весь список \n 2. Вывести диапазон списка');
            print('\nВведите номер вывода списка:');
            var listNum = int.parse(stdin.readLineSync() ?? '1');
            switch(listNum){   
              case 1:
                action.displayStudentsList();
              case 2:
                print('\nВведите начальный индекс:');
                var x = int.parse(stdin.readLineSync() ?? '1');
                print('\nВведите конечный индекс:');
                var y = int.parse(stdin.readLineSync() ?? '1');
                action.displayStudentsListFilter(x-1, y);
              default:
                print("Введен некорректный номер действия! \n");
                actionSelect();
            }   
        case 8: 
            break;
        default:
            print("Введен некорректный номер действия! \n");
            actionSelect();
    } 
}

class Student{
  int id = 0;             // ID
  String surname = "";    // Фамилия
  String middleName = ""; // Отчество
  String firstName = "";  // Имя
  int age = 0;            // Возраст
  String group = "";      // Группа
  double grade = 0.0;     // Средний балл

  // Конструктор
  Student(int studentID, String studentSurname,  String studentMiddleName, String studentName,
  int studentAge, String studentGroup, double studentGrade) 
    {
        id = studentID;
        surname = studentSurname;
        firstName = studentName;
        middleName = studentMiddleName;
        age = studentAge;
        group = studentGroup;
        grade = studentGrade;
    }

  // Метод вывода информации о студенте
  void displayStudent({String surname = "undefined",
                       String middleName = "undefined", 
                       String firstName = "undefined",
                       int age = 0,
                       String group = "undefined",
                       double grade = 0.0}){
                          print("ID: $id");
                          print("Фамлия: $surname");
                          print("Имя: $firstName");
                          print("Отчество: $middleName");
                          print("Возраст: $age");
                          print("Группа: $group");
                          print("Средний балл: $grade");
                       }

  
}

class StudentList{

  List students = [];

  StudentList()
  {
    students = studentsList;
  }


  

  // Метод добавления студента
  void addStudent(){
    // Запрос значений
    var id = students.last.id+1; // Обращение к id последнего студента в списке и добавление 1
    print('Введите фамилию:');
    var surname = (stdin.readLineSync() ?? 'empty');
    print('Введите имя:');
    var firstName = (stdin.readLineSync() ?? 'empty');
    print('Введите отчество:');
    var middleName = (stdin.readLineSync() ?? 'empty');
    print('Введите возраст:');
    var age = int.parse(stdin.readLineSync() ?? '0');
    print('Введите группу:');
    var group = (stdin.readLineSync() ?? 'empty');
    print('Введите средний балл:');
    var grade = double.parse(stdin.readLineSync() ?? '0.0');

    // Добавление нового студента в список
    students.add(Student(id, surname, middleName, firstName, age, group, grade));

    print("\nСтудент добавлен!");
    actionSelect();
  }


  // Метод вывода студента с наивысшим баллом
  void getStudentWithHighestGrade(){
    List<double> studentGrade = []; // Создание листа с оценками студентов

    // Цикл, проходящийся по списку студентов
    for(int i=0; i < students.length; i++){
        studentGrade.add(students[i].grade); // Добвление оценки в список оценок
    }
    studentGrade.sort(); // Сортировка списка оценок по возрастанию
    print("Наивысший балл:");
    print(studentGrade.last);
    print("Студенты с этим баллом:");
    // Цикл, проходящийся по списку студентов
    for(int i=0; i < students.length; i++){
        if(students[i].grade == studentGrade.last){ // Если балл совпадает с наивысшим
          print("${students[i].surname} ${students[i].firstName} ${students[i].middleName}");
        }
    }

    actionSelect();
  }


  // Метод вывода студента с наименьшим баллом
  void getStudentWithLowestGrade(){
    List<double> studentGrade = []; // Создание листа с оценками студентов

    // Цикл, проходящийся по списку студентов
    for(int i=0; i < students.length; i++){
        studentGrade.add(students[i].grade); // Добвление оценки в список оценок
    }
    studentGrade.sort(); // Сортировка списка оценок по возрастанию
    print("Наименьший балл:");
    print(studentGrade.first);
    print("Студенты с этим баллом:");
    // Цикл, проходящийся по списку студентов
    for(int i=0; i < students.length; i++){
        if(students[i].grade == studentGrade.first){ // Если балл совпадает с наивысшим
          print("${students[i].surname} ${students[i].firstName} ${students[i].middleName}");
        }
    }

    actionSelect();
  }


  // Метод вывода среднего балла всех студентов
  void getAverageGrade(){
    List<double> studentGrade = []; // Создание листа с оценками студентов
    // Цикл, проходящийся по списку студентов
    for(int i=0; i < students.length; i++){
        studentGrade.add(students[i].grade); // Добвление оценки в список оценок
    }
    double sum = studentGrade.reduce((sum, el) => sum + el); // Сумма всех оценок
    double middleGrade = sum / studentGrade.length; // Cреднее значение
    print("\nСредний балл в группе:");
    print(middleGrade); 
    print("Округленный средний балл в группе:");
    print(middleGrade.toStringAsFixed(2)); 

    actionSelect();
  }


  // Метод удаления студента по id
  void deleteStudentById(){
    // Запрос ID студента
    print('Введите ID студента, которого хотите удалить:');
    int id = int.parse(stdin.readLineSync() ?? '0');

    students.removeAt(id-1); // Удаление по id

    print("\nСтудент удален!");
    actionSelect();
  }


  // Метод изменения данных студента по id
  void updateStudentById(){
    // Запрос ID студента
    print('Введите ID студента, данные которого хотите изменить:');
    var id = int.parse(stdin.readLineSync() ?? '0');

    // Запрос новых данных
    print('Введите фамилию:');
    var newSurname = (stdin.readLineSync() ?? 'empty');
    print('Введите имя:');
    var newFirstName = (stdin.readLineSync() ?? 'empty');
    print('Введите отчество:');
    var newMiddleName = (stdin.readLineSync() ?? 'empty');
    print('Введите возраст:');
    var newAge = int.parse(stdin.readLineSync() ?? '0');
    print('Введите группу:');
    var newGroup = (stdin.readLineSync() ?? 'empty');
    print('Введите средний балл:');
    var newGrade = double.parse(stdin.readLineSync() ?? '0.0');

    // Обновление данных
    students[id-1].surname = newSurname;
    students[id-1].firstName = newFirstName;
    students[id-1].middleName = newMiddleName;
    students[id-1].age = newAge;
    students[id-1].group = newGroup;
    students[id-1].grade = newGrade;

    print("\nДанные студента обновлены!");
    actionSelect();
  }
  

  // Метод вывода списка студентов
  void displayStudentsList(){
    // Цикл, проходящийся по списку студентов
    for(int i=0; i < students.length; i++){
      // Вывод данных
      print("${students[i].id}. ${students[i].surname} ${students[i].firstName} ${students[i].middleName}");
      print("    Возраст: ${students[i].age}, Группа: ${students[i].group}, Балл: ${students[i].grade}");
    }
    actionSelect();
  }


  // Метод вывода списка, отфильтрованного в виде диапазона
  void displayStudentsListFilter(int x, int y){
    // Фильтрация списка
    var studentsFilter = students.sublist(x, y);
    // Цикл, проходящийся по отфильтрованному списку студентов
    for(int i=0; i < studentsFilter.length; i++){
      // Вывод данных
      print("${studentsFilter[i].id}. ${studentsFilter[i].surname} ${studentsFilter[i].firstName} ${studentsFilter[i].middleName}");
      print("    Возраст: ${studentsFilter[i].age}, Группа: ${studentsFilter[i].group}, Балл: ${studentsFilter[i].grade}");
    }
    actionSelect();
  }

}

List<Student> studentsList = [
    Student(1, "Дерен", "Дмитрий", "Юрьевич", 18, "П50-2-20", 5.0),
    Student(2, "Новиков", "Александр", "Владимирович", 18, "П50-2-20", 4.5),
    Student(3, "Марзаганов", "Тимур", "Харитонович", 18, "П50-2-20", 4.8),
    Student(4, "Шавга", "Матвей", "Сергеевич", 18, "П50-2-20", 3.9),
    Student(5, "Акимова", "Анастасия", "Сергеевна", 18, "П50-2-20", 2.6),
    Student(6, "Осипян", "Лусинэ", "Геннадьевна", 18, "П50-2-20", 4.0),
    Student(7, "Агабеков", "Арсен", "Низамович", 18, "П50-2-20", 5.0),
    Student(8, "Белякова", "Руслана", "Максимовна", 18, "П50-2-20", 3.2),
    Student(9, "Волошин", "Владислав", "Викторович", 18, "П50-2-20", 4.3),
    Student(10, "Газарян", "Анри", "Арменович", 18, "П50-2-20", 2.2),
    Student(11, "Горгуленко", "Никита", "Дмитриевич", 18, "П50-2-20", 2.5),
    Student(12, "Григорьева", "Диана", "Юрьевна", 18, "П50-2-20", 3.0),
    Student(13, "Гусев", "Дмитрий", "Витальевич", 18, "П50-2-20", 5.0),
    Student(14, "Загорулько", "Ульяна", "Денисовна", 18, "П50-2-20", 3.6),
    Student(15, "Ибрагимова", "Анжелика", "Ярославовна", 18, "П50-2-20", 4.9),
    Student(16, "Иванов", "Дмитрий", "Александрович", 18, "П50-2-20", 4.5),
    Student(17, "Камышов", "Матвей", "Борисович", 18, "П50-2-20", 4.3),
    Student(18, "Мельников", "Алексей", "Максимович", 18, "П50-2-20", 5.0),
    Student(19, "Толкачев", "Владислав", "Сергеевич", 18, "П50-2-20", 3.7),
    Student(20, "Хлябич", "Александр", "Валентинович", 18, "П50-2-20", 3.6)
];