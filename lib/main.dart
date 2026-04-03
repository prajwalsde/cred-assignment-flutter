import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/bill_repository.dart';
import 'logic/cubit/bill_cubit.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  // Ensure binding is initialized before calling SystemChrome
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Lock Orientation: Custom physics animations require consistent screen dimensions.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 2. Status Bar Style: Transparent status bar for an edge-to-edge premium feel.
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // Dark icons for light background
  ));

  runApp(const CredAssignmentApp());
}

class CredAssignmentApp extends StatelessWidget {
  const CredAssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRED Stack Assignment',
      debugShowCheckedModeBanner: false,
      
      // Global Theme Configuration
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF3F3F3), // Matches Home background
        fontFamily: 'sans-serif', // Ensure consistent typography
      ),
      
      // Dependency Injection Layer
      home: RepositoryProvider(
        create: (context) => BillRepository(),
        child: BlocProvider(
          create: (context) => BillCubit(context.read<BillRepository>()),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}