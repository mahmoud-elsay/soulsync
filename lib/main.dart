import 'package:flutter/material.dart';
import 'package:soulsync/soul_sync.dart';
import 'package:soulsync/core/di/di.dart';
import 'package:soulsync/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulsync/core/supabase/supabase_helper.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SupabaseHelper.init();
  setupDi();

  runApp(SoulSync());
}
