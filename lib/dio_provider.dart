import 'package:dio/dio.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class DioProvider {
  final List<String> _allowedSHAFingerprints = [
    '61:79:D2:FB:1F:F1:DA:04:E8:D2:8B:28:BA:9F:84:CB:24:B4:B8:BC:B8:C0:E2:5B:31:25:1D:67:87:80:D0:89',
  ];

  Dio getClient(String baseUrl) {
    var dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors.add(CertificatePinningInterceptor(
        allowedSHAFingerprints: _allowedSHAFingerprints,
      ));
    return dio;
  }
}
