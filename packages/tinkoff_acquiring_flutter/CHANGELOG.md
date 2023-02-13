# 3.0.10

* Fixing the 3DSv2 Challenge Flow Passage

# 3.0.9

* Fix paymentId type in OrderPayments

# 3.0.8

* Fixed & add/remove new request and response models (Sync with documentation)
* Fix readme
* Update dependency webview_flutter to 4.0.0

# 3.0.7

* Add PaymentId to AddCardResponse

# 3.0.6

* Update dependencies
* Fixed & add new request and response models (Sync with documentation)
* Reworked TinkoffAcquiringConfig
* New PaymentSource
* Payment through the Fast Payment System (SBP) by QR

# 3.0.5

* Update dependencies

# 3.0.4

* Changed mode of encoding threeDsMethod params with Base64 without Padding according to 3DS 2.0 requirements

# 3.0.3

* Fix `meta` dependencie

# 3.0.2

* Update `tinkoff_acquiring` dependencie
* Update `webview_flutter` dependencie

# 3.0.1

* Update `tinkoff_acquiring` dependencie

# 3.0.0

* **BREAKING**: Splitting the library into two packages:
  - tinkoff_acquiring: Package for working with Tinkoff API
  - tinkoff_acquiring_flutter: A package for working with UI, at the moment it is WebView. In the future, it will be QR and much more
