import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://kyeersstcurcctfetynp.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt5ZWVyc3N0Y3VyY2N0ZmV0eW5wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMxNDU1NDEsImV4cCI6MjA2ODcyMTU0MX0.Y7RpmIrxNul6PiByu4N2KK9113eDm7Qsl81Gxp8I81c',
    );
  }
}
