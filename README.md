# flutter_cert_pinning

https://github.com/diefferson/http_certificate_pinning

### Get SHA256 Certificate Fingerprint from `certificate-file.crt`

```shell
make get_sha256_certificate_fingerprint certificate=certificate-file.crt
```

### Get SHA256 Certificate Fingerprint from `Domain`

```shell
make get_certificate_fingerprint host=prongbang.github.io
```

### Output

```shell
sha256 Fingerprint=61:79:D2:FB:1F:F1:DA:04:E8:D2:8B:28:BA:9F:84:CB:24:B4:B8:BC:B8:C0:E2:5B:31:25:1D:67:87:80:D0:89
```

### Used

```dart
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
```