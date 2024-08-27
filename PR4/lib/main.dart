import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataAdapter());
  await Hive.openBox<Data>('data');

  runApp(
    ChangeNotifierProvider(
      create: (_) => AllProvider(),
      child: MyApp()
    )
  );
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    return Data(reader.read());
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer.write(obj.datalist);
  }
}

@HiveType(typeId: 0)
class Data extends HiveObject {

  @HiveField(0)
  final String datalist;

  Data(this.datalist);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => AllProvider(),
      child: FutureBuilder(
        future: Provider.of<AllProvider>(context, listen: false).GetTheme(),
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          var themeColor = (snapshot.data == 1) ? ThemeData.light() : ThemeData.dark();
          return MaterialApp(
            theme: themeColor,
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case '/':
                  return MaterialPageRoute(builder: (context) => HomePage());
            case '/listPage':
              return MaterialPageRoute(builder: (context) => ListPage());
            case '/settingsPage':
              return MaterialPageRoute(builder: (context) => SettingsPage());
            default:
              return MaterialPageRoute(builder: (context) => HomePage());
          }
        },
        home: SafeArea(
          child: HomePage(),
        )
      );}
    ));
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Consumer<AllProvider>(
          builder: (context, allProv, _) {
            TextEditingController textEditingController = TextEditingController(
              text: allProv._logintext,
            );
            return Column(children: [
              TextField(
                controller: textEditingController,
                onChanged: (value) {
                  allProv._logintext = value;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool iscode = await allProv.loginButtonPressed();
                    if (iscode){
                      Navigator.pushNamed(context, '/listPage');
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Text('Войти', style: TextStyle(fontSize: 45))
                  )),
            ]);
          },
        ),
      ),
    );
  }
}


class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AllProvider>(
          builder: (context, allProv, _){
            TextEditingController textEditingController = TextEditingController(
              text: allProv._dataText,
            );
            return Column(children: [
            ValueListenableBuilder(
              valueListenable: Hive.box<Data>('data').listenable(),
              builder: (context, Box<Data> box, _){
              return Expanded(
              child: ReorderableListView.builder(
                  itemCount: box.length,
                    itemBuilder: (context, index) {
                    final data = box.getAt(index);
                    return ListTile(
                    key: Key('$index'),
                    title: Text(data!.datalist),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      ElevatedButton(
                      onPressed: () {
                        allProv._index = index;
                        allProv.Redactor();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(6)
                      ),
                        child: Container(
                        alignment: Alignment.center,
                        child: Text('R')
                      )),
                      ElevatedButton(
                      onPressed: () {
                        allProv._index = index;
                        allProv.Delete();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(6)
                      ),
                        child: Container(
                        alignment: Alignment.center,
                        child: Text('D')
                      )),
                    ],
                    ),
                        );
                      },
                      onReorder: (oldIndex, newIndex) {
                        allProv.reorderData(oldIndex, newIndex);
                      }
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settingsPage');
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text('Настройки', style: TextStyle(fontSize: 45))
              )),
              TextField(
                controller: textEditingController,
                onChanged: (value) {
                  allProv._dataText = value;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  allProv.Add();
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.bottomRight,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(6)
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text('+', style: TextStyle(fontSize: 45))
                )),
            ]);
          }
        )
      )
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Future<void> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = Provider.of<AllProvider>(context, listen: false).GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AllProvider>(
          builder: (context, allProv, _) {
            return FutureBuilder(
              future: _dataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var textEditingControllerFIO = TextEditingController(
                  text: allProv._FIO,
                );
                var textEditingControllerDateBirthay = TextEditingController(
                  text: allProv._DateBirthay,
                );
                var textEditingControllerCode = TextEditingController(
                  text: allProv._Code,
                );
                return Column(children: [
                  TextField(
                    controller: textEditingControllerFIO,
                    onChanged: (value) {
                      allProv._FIO = value;
                    },
                  ),
                  TextField(
                    controller: textEditingControllerDateBirthay,
                    onChanged: (value) {
                      allProv._DateBirthay = value;
                    },
                  ),
                  TextField(
                    controller: textEditingControllerCode,
                    onChanged: (value) {
                      allProv._Code = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      allProv.saveData();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Сохранить', style: TextStyle(fontSize: 45)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      allProv.saveTheme(0);
                      allProv.reloadApp(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Темная тема', style: TextStyle(fontSize: 45)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      allProv.saveTheme(1);
                      allProv.reloadApp(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Светлая тема', style: TextStyle(fontSize: 45)),
                    ),
                  ),
                ]);
              },
            );
          },
        ),
      ),
    );
  }
}

class AllProvider extends ChangeNotifier{

  String _logintext = '';

  String get logintext => _logintext;

  String _dataText = '';

  String get dataText => _dataText;

  int _index = 0;

  int get index => _index;

  String _FIO = '';

  String get FIO => _FIO;

  String _DateBirthay = '';

  String get DateBirthay => _DateBirthay;

  String _Code = '';

  String get Code => _Code;

  int _Theme = 0;

  int get Theme => _Theme;

  void reloadApp(BuildContext context) {
    Navigator.pushReplacement(
    context,
    PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => MyApp(),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  Future<bool> ifexist() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('loginCode')){
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<bool> checkLoginCode(String inputCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String storedCode = prefs.getString('loginCode') ?? '';
    notifyListeners();
    return storedCode == inputCode;
  }

  void saveLoginCode(String code) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('loginCode', code);
    notifyListeners();
  }

  void saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fio', FIO);
    await prefs.setString('datebirthay', DateBirthay);
    await prefs.setString('loginCode', Code);
    await prefs.setInt('theme', Theme);
    notifyListeners();
  }

  void saveTheme(int the) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', the);
  }

  Future<int> GetTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _Theme = prefs.getInt('theme') ?? 1;
    notifyListeners();
    return _Theme;
  }

  Future<void> GetData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _FIO = prefs.getString('fio').toString();
    _DateBirthay = prefs.getString('datebirthay').toString();
    _Code = prefs.getString('loginCode').toString();
    notifyListeners();
  }

  Future<bool> loginButtonPressed() async {
    bool ifexistbool = await ifexist();
    if (ifexistbool) {
      bool iscorrect = await checkLoginCode(_logintext);
      notifyListeners();
      return iscorrect;
    } else {
      saveLoginCode(_logintext);
      notifyListeners();
      return true;
    }
  }

  void Add() async{
    if (dataText != ''){
      await Hive.close();
      var box = await Hive.openBox<Data>('data');
      var data = Data(dataText);
      box.add(data);
      _dataText = '';
      notifyListeners();
    }
  }

  void Delete() async{
    await Hive.close();
    var box = await Hive.openBox<Data>('data');
    box.deleteAt(index);
    notifyListeners();
  }

  void Redactor() async{
    await Hive.close();
    var box = await Hive.openBox<Data>('data');
    var data = Data(dataText);
    box.putAt(index, data);
    _dataText = '';
    notifyListeners();
  }

  void reorderData(int oldIndex, int newIndex) async{
    var box = Hive.box<Data>('data');
    var items = box.values.toList();
    var itemToMove = items.removeAt(oldIndex);
    if (newIndex > oldIndex){
      newIndex -= 1;
    }
    items.insert(newIndex, itemToMove);
    await box.clear();
    for (var item in items) {
      await box.add(Data(item.datalist));
    }
    await box.compact();
    notifyListeners();
  }
}