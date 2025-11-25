class PaymentResultData {
  final bool isSuccess;
  final String successTitle;
  final String successSubtitle;
  final String failedTitle;
  final String failedSubtitle;

  PaymentResultData({
    required this.isSuccess,
    required this.successTitle,
    required this.successSubtitle,
    required this.failedTitle,
    required this.failedSubtitle,
  });

  factory PaymentResultData.fromMap(Map<String, dynamic> data) {
    return PaymentResultData(
      isSuccess: data['isSuccess'] ?? false,
      successTitle: data['successTitle'] ?? '',
      successSubtitle: data['successSubtitle'] ?? '',
      failedTitle: data['failedTitle'] ?? '',
      failedSubtitle: data['failedSubtitle'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isSuccess': isSuccess,
      'successTitle': successTitle,
      'successSubtitle': successSubtitle,
      'failedTitle': failedTitle,
      'failedSubtitle': failedSubtitle,
    };
  }
}