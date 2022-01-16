# make get_sha256_certificate_fingerprint certificate=certificate-file.crt
get_sha256_certificate_fingerprint:
	openssl x509 -noout -fingerprint -sha256 -inform pem -in $(certificate)

# make get_certificate_fingerprint domain=prongbang.github.io
get_certificate_fingerprint:
	openssl s_client -connect $(domain):443 < /dev/null 2>/dev/null | openssl x509 -noout -fingerprint -sha256 -inform pem -in /dev/stdin
