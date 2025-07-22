import 'package:flutter/material.dart';
import 'package:soulsync/soul_sync.dart';
import 'package:soulsync/core/supabase/supabase_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SupabaseHelper.init();

  runApp(SoulSync());
}
