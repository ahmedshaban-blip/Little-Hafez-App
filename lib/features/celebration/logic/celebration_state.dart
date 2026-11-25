import 'package:equatable/equatable.dart';

import '../domain/entities/completion_certificate.dart';

enum CelebrationLoadStatus { initial, loading, ready, error }

/// Immutable state for [CelebrationCubit].
final class CelebrationState extends Equatable {
  const CelebrationState({
    required this.status,
    required this.isPlayingRecitation,
    this.certificate,
    this.errorMessage,
  });

  const CelebrationState.initial()
    : status = CelebrationLoadStatus.initial,
      isPlayingRecitation = false,
      certificate = null,
      errorMessage = null;

  final CelebrationLoadStatus status;
  final bool isPlayingRecitation;
  final CompletionCertificate? certificate;
  final String? errorMessage;

  CelebrationState copyWith({
    CelebrationLoadStatus? status,
    bool? isPlayingRecitation,
    CompletionCertificate? certificate,
    String? errorMessage,
  }) {
    return CelebrationState(
      status: status ?? this.status,
      isPlayingRecitation: isPlayingRecitation ?? this.isPlayingRecitation,
      certificate: certificate ?? this.certificate,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    isPlayingRecitation,
    certificate,
    errorMessage,
  ];
}
