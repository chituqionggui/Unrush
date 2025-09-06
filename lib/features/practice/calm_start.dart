import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_calm/l10n/app_localizations.dart';

class CalmStartPage extends StatefulWidget {
  const CalmStartPage({super.key});

  @override
  State<CalmStartPage> createState() => _CalmStartPageState();
}

class _CalmStartPageState extends State<CalmStartPage> {
  final _player = AudioPlayer();
  bool _muted = true;

  @override
  void initState() {
    super.initState();
    _initPrefsAndAudio();
  }

  Future<void> _initPrefsAndAudio() async {
    final prefs = await SharedPreferences.getInstance();
    final muted = prefs.getBool('calm_muted') ?? true; // 默认静音
    setState(() => _muted = muted);

    // Audio placeholder removed for compatibility; configure real ambient asset later.
    _applyVolume();
  }

  void _applyVolume() {
    // 极低音量，自然声建议 0.05~0.15
    _player.setVolume(_muted ? 0.0 : 0.08);
  }

  Future<void> _toggleMute() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _muted = !_muted);
    await prefs.setBool('calm_muted', _muted);
    _applyVolume();
    // No audio source configured yet; only persist preference.
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 柔和背景色
          ColoredBox(color: Colors.tealAccent.withOpacity(0.08)),
          // Lottie 呼吸
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.calmTitle, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 16),
                SizedBox(
                  width: 220,
                  height: 220,
                  child: Lottie.asset('assets/lottie/breath.json', repeat: true),
                ),
                const SizedBox(height: 16),
                IconButton(
                  tooltip: _muted ? 'Unmute' : 'Mute',
                  onPressed: _toggleMute,
                  icon: Icon(_muted ? Icons.volume_off_rounded : Icons.volume_up_rounded),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  children: [
                    ElevatedButton(onPressed: () => context.go('/toolkit/tense'), child: Text(l10n.homeQuickTense)),
                    ElevatedButton(onPressed: () => context.go('/toolkit/low'), child: Text(l10n.homeQuickLow)),
                    ElevatedButton(onPressed: () => context.go('/toolkit/focus'), child: Text(l10n.homeQuickFocus)),
                  ],
                ),
                const SizedBox(height: 40),
                OutlinedButton(onPressed: () => context.go('/home'), child: const Text('HOME')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
