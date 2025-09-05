import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_calm/l10n/app_localizations.dart';
import 'package:study_calm/data/checkin_repo.dart';

class QuickCheckinPage extends StatefulWidget {
  const QuickCheckinPage({super.key});

  @override
  State<QuickCheckinPage> createState() => _QuickCheckinPageState();
}

class _QuickCheckinPageState extends State<QuickCheckinPage> {
  int _intensity = 5;
  String _mood = 'neutral';
  final Set<String> _tags = {};
  final TextEditingController _note = TextEditingController();
  bool _submitting = false;

  final _repo = CheckinRepo();

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _submitting = true);
    try {
      await _repo.insertQuickCheckin(
        moodTag: _mood,
        intensity: _intensity,
        contextTags: _tags.toList(),
        // noteCipher: null (encryption later tasks)
      );
      if (!mounted) return;
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          final l10n = AppLocalizations.of(ctx)!;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.checkinSuggestNext, style: Theme.of(ctx).textTheme.titleMedium),
                const SizedBox(height: 12),
                Wrap(spacing: 12, children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      context.go('/toolkit/breath');
                    },
                    child: Text(l10n.homeQuickTense),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      context.go('/home');
                    },
                    child: Text(l10n.checkinBackHome),
                  ),
                ]),
              ],
            ),
          );
        },
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.checkinTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.checkinIntensity),
            Slider(
              value: _intensity.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: _intensity.toString(),
              onChanged: (v) => setState(() => _intensity = v.round()),
            ),
            const SizedBox(height: 8),
            Text(l10n.checkinMood),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: [
              for (final m in ['calm', 'tense', 'low', 'neutral'])
                ChoiceChip(
                  label: Text(_moodLabel(l10n, m)),
                  selected: _mood == m,
                  onSelected: (_) => setState(() => _mood = m),
                ),
            ]),
            const SizedBox(height: 8),
            Text(l10n.checkinContext),
            const SizedBox(height: 8),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final t in ['study', 'exam', 'sleep', 'social', 'family'])
                FilterChip(
                  label: Text(_tagLabel(l10n, t)),
                  selected: _tags.contains(t),
                  onSelected: (sel) => setState(() => sel ? _tags.add(t) : _tags.remove(t)),
                ),
            ]),
            const SizedBox(height: 8),
            Text(l10n.checkinNote),
            const SizedBox(height: 4),
            TextField(
              controller: _note,
              maxLines: 3,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: l10n.checkinNoteHint,
              ),
            ),
            const Spacer(),
            FilledButton(
              onPressed: _submitting ? null : _submit,
              child: Text(l10n.checkinSubmit),
            ),
          ],
        ),
      ),
    );
  }

  String _moodLabel(AppLocalizations l10n, String m) {
    switch (m) {
      case 'calm':
        return l10n.checkinMoodCalm;
      case 'tense':
        return l10n.checkinMoodTense;
      case 'low':
        return l10n.checkinMoodLow;
      default:
        return l10n.checkinMoodNeutral;
    }
  }

  String _tagLabel(AppLocalizations l10n, String t) {
    switch (t) {
      case 'study':
        return l10n.checkinTagStudy;
      case 'exam':
        return l10n.checkinTagExam;
      case 'sleep':
        return l10n.checkinTagSleep;
      case 'social':
        return l10n.checkinTagSocial;
      case 'family':
        return l10n.checkinTagFamily;
      default:
        return t;
    }
  }
}

