import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:soulsync/core/widgets/app_top_bar.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:soulsync/features/meditation_player/ui/widgets/track_info_widget.dart';
import 'package:soulsync/features/meditation_player/ui/widgets/track_image_widget.dart';
import 'package:soulsync/features/meditation_player/ui/widgets/audio_waveform_widget.dart';
import 'package:soulsync/features/meditation_player/ui/widgets/player_controls_widget.dart';

class MeditationPlayerScreen extends StatefulWidget {
  const MeditationPlayerScreen({super.key});

  @override
  State<MeditationPlayerScreen> createState() => _MeditationPlayerScreenState();
}

class _MeditationPlayerScreenState extends State<MeditationPlayerScreen> {
  late final AudioPlayer _audioPlayer;
  late final PlayerController _waveController;

  bool isPlaying = false;
  bool isInitialized = false;
  String? _tempFilePath;

  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();
    _waveController = PlayerController();

    _setup();
  }

  Future<void> _setup() async {
    try {
      print('Starting audio setup...');

      // Extract asset to temporary file
      final ByteData data = await DefaultAssetBundle.of(
        context,
      ).load('assets/audio/sample_track.mp3');
      final Directory tempDir = await getTemporaryDirectory();
      final File tempFile = File('${tempDir.path}/sample_track.mp3');
      await tempFile.writeAsBytes(data.buffer.asUint8List());

      _tempFilePath = tempFile.path;
      print('Temp file created at: $_tempFilePath');

      // Setup audio player with file path
      await _audioPlayer.setFilePath(_tempFilePath!);
      print('Audio player setup complete');

      // Setup waveform controller - this will extract and show the full waveform
      await _waveController.preparePlayer(
        path: _tempFilePath!,
        shouldExtractWaveform: true,
      );
      print('Waveform controller prepared');

      // Listen to audio player state changes
      _audioPlayer.playingStream.listen((playing) {
        if (mounted) {
          setState(() {
            isPlaying = playing;
          });
        }
      });

      // Listen to position changes to sync waveform progress
      _audioPlayer.positionStream.listen((position) {
        if (mounted && _audioPlayer.duration != null) {
          final progress =
              position.inMilliseconds / _audioPlayer.duration!.inMilliseconds;
          _waveController.seekTo(
            (progress.clamp(0.0, 1.0) * _audioPlayer.duration!.inMilliseconds)
                .toInt(),
          );
        }
      });

      setState(() {
        isInitialized = true;
      });

      print('Setup completed successfully');
    } catch (e) {
      print('Setup error: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _waveController.dispose();

    // Clean up temp file
    if (_tempFilePath != null) {
      final file = File(_tempFilePath!);
      if (file.existsSync()) {
        file.deleteSync();
      }
    }

    super.dispose();
  }

  void _togglePlayback() async {
    if (!isInitialized) return;

    try {
      if (isPlaying) {
        await _audioPlayer.pause();
        _waveController.pausePlayer();
      } else {
        await _audioPlayer.play();
        _waveController.startPlayer();
      }

      setState(() {
        isPlaying = !isPlaying;
      });
    } catch (e) {
      print('Playback error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkSlate,
      body: SafeArea(
        child: Column(
          children: [
            const AppTopBar(),
            verticalSpace(30),

            const TrackImageWidget(),

            verticalSpace(20),

            // Title & Subtitle
            const TrackInfoWidget(
              title: "Painting Forest",
              artist: "By: Painting with Passion",
            ),

            verticalSpace(26),

            // Audio Waveform
            AudioWaveformWidget(
              isInitialized: isInitialized,
              waveController: _waveController,
            ),

            verticalSpace(40),

            // Player Controls
            PlayerControlsWidget(
              isPlaying: isPlaying,
              isInitialized: isInitialized,
              onPlayPause: _togglePlayback,
            ),

            // Debug info (remove in production)
            if (!isInitialized) ...[
              verticalSpace(20),
              const Text(
                'Initializing audio...',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
