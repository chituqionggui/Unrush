import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_calm/l10n/app_localizations.dart';

enum BreathPattern { square, fourSevenEight }

class BreathPage extends StatefulWidget {
  const BreathPage({super.key});

  @override
  State<BreathPage> createState() => _BreathPageState();
}

class _BreathPageState extends State<BreathPage> with SingleTickerProviderStateMixin {
  BreathPattern _pattern = BreathPattern.square;
  Duration _session = const Duration(minutes: 1);
  Timer? _timer;
  DateTime? _endAt;

  // phase 0=inhale,1=hold,2=exhale,3=hold(sq only)
  int _phase = 0;
  double _scale = 0.7; // 0.7~1.0

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _start() {
    _timer?.cancel();
    setState(() {
      _endAt = DateTime.now().add(_session);
      _phase = 0;
      _scale = 0.7;
    });
    _tick();
  }

  void _stop() {
    setState(() {
      _timer?.cancel();
      _endAt = null;
      _phase = 0;
      _scale = 0.7;
    });
  }

  void _tick() {
    if (_endAt == null) return;
    if (DateTime.now().isAfter(_endAt!)) {
      _stop();
      return;
    }
    // determine current phase duration
    final d = _phaseDuration(_phase);
    _applyPhaseAnim(_phase, d);
    _timer = Timer(d, () {
      setState(() {
        _phase = _nextPhase(_phase);
      });
      _tick();
    });
  }

  Duration _phaseDuration(int p) {
    switch (_pattern) {
      case BreathPattern.square:
        return const Duration(seconds: 4);
      case BreathPattern.fourSevenEight:
        if (p == 0) return const Duration(seconds: 4);
        if (p == 1) return const Duration(seconds: 7);
        if (p == 2) return const Duration(seconds: 8);
        return const Duration(seconds: 1); // final small hold (unused)
    }
  }

  int _nextPhase(int cur) {
    switch (_pattern) {
      case BreathPattern.square:
        return (cur + 1) % 4;
      case BreathPattern.fourSevenEight:
        // cycle inhale(0)->hold(1)->exhale(2)->back to inhale
        return (cur + 1) % 3;
    }
  }

  void _applyPhaseAnim(int p, Duration d) {
    // animate scale between 0.7 and 1.0 for inhale/exhale, keep steady on holds
    if (p == 0) {
      // inhale: grow
      setState(() => _scale = 1.0);
    } else if (p == 2) {
      // exhale: shrink
      setState(() => _scale = 0.7);
    }
    // holds keep current scale
  }

  String _phaseLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final p = _phase;
    if (_pattern == BreathPattern.square) {
      switch (p) {
        case 0:
          return l10n.breathPhaseInhale;
        case 1:
          return l10n.breathPhaseHold;
        case 2:
          return l10n.breathPhaseExhale;
        case 3:
          return l10n.breathPhaseHold;
      }
    } else {
      switch (p) {
        case 0:
          return l10n.breathPhaseInhale;
        case 1:
          return l10n.breathPhaseHold;
        case 2:
          return l10n.breathPhaseExhale;
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final running = _endAt != null;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.breathTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ChoiceChip(
                  label: Text(l10n.breathPatternSquare),
                  selected: _pattern == BreathPattern.square,
                  onSelected: running ? null : (_) => setState(() => _pattern = BreathPattern.square),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: Text(l10n.breathPattern478),
                  selected: _pattern == BreathPattern.fourSevenEight,
                  onSelected: running ? null : (_) => setState(() => _pattern = BreathPattern.fourSevenEight),
                ),
                const Spacer(),
                DropdownButton<Duration>(
                  value: _session,
                  onChanged: running ? null : (v) => setState(() => _session = v ?? _session),
                  items: [
                    DropdownMenuItem(value: const Duration(minutes: 1), child: Text(l10n.breathDuration1)),
                    DropdownMenuItem(value: const Duration(minutes: 3), child: Text(l10n.breathDuration3)),
                    DropdownMenuItem(value: const Duration(minutes: 5), child: Text(l10n.breathDuration5)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  width: 200 * _scale,
                  height: 200 * _scale,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
                    border: Border.all(color: Theme.of(context).colorScheme.primary, width: 6),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    running ? _phaseLabel(context) : l10n.breathReady,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: running ? _stop : _start,
              child: Text(running ? l10n.breathStop : l10n.breathStart),
            ),
          ],
        ),
      ),
    );
  }
}

