import 'package:flutter/material.dart';
import 'package:flutteprojetos/screens/api_screen.dart';
import 'package:flutteprojetos/screens/home_screen.dart';
import 'package:flutteprojetos/screens/initial_screen.dart';
import 'components/navigationbar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Tarefas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class MainScreen extends StatefulWidget { //o Widget com estado para controlar a navegação
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // índice da tela atualmente selecionada

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ApiScreen(),
    InitialScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // exibe a tela selecionada
      ),
      bottomNavigationBar: CustomNavigationBar( //exibe a barra de navegação
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}




