import 'package:equatable/equatable.dart';

import '../domain/entities/recitation_ayah.dart';

/// Status of the recitation screen.
enum RecitationStatus { initial, loading, ready, error }

/// Immutable state for [RecitationCubit].
final class RecitationState extends Equatable {
  const RecitationState({
    required this.status,
    required this.activeWordIndex,
    required this.isSheikhPlaying,
    required this.isRecording,
    required this.isReplayingChild,
    this.ayah,
    this.errorMessage,
  });

  const RecitationState.initial()
    : status = RecitationStatus.initial,
      activeWordIndex = 3,
      isSheikhPlaying = false,
      isRecording = false,
      isReplayingChild = false,
      ayah = null,
      errorMessage = null;

  final RecitationStatus status;
  final int activeWordIndex;
  final bool isSheikhPlaying;
  final bool isRecording;
  final bool isReplayingChild;
  final RecitationAyah? ayah;
  final String? errorMessage;

  RecitationState copyWith({
    RecitationStatus? status,
    int? activeWordIndex,
    bool? isSheikhPlaying,
    bool? isRecording,
    bool? isReplayingChild,
    RecitationAyah? ayah,
    String? errorMessage,
  }) {
    return RecitationState(
      status: status ?? this.status,
      activeWordIndex: activeWordIndex ?? this.activeWordIndex,
      isSheikhPlaying: isSheikhPlaying ?? this.isSheikhPlaying,
      isRecording: isRecording ?? this.isRecording,
      isReplayingChild: isReplayingChild ?? this.isReplayingChild,
      ayah: ayah ?? this.ayah,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    activeWordIndex,
    isSheikhPlaying,
    isRecording,
    isReplayingChild,
    ayah,
    errorMessage,
  ];
}
