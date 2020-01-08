import 'package:sentry/sentry.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';
import '../data/constants.dart';

final SentryClient sentry = SentryClient(dsn: Constants.sentryDSN);

class SentryHandler {

    Future<Event> getSentryEvent([dynamic exception, dynamic stackTrace]) async {
        final DeviceInfoPlugin  deviceInfo = DeviceInfoPlugin();

        if (Platform.isIOS) {
            final IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
            return Event(
                release: Constants.appVersion,
                environment: 'debug',
                extra: <String, dynamic> {
                    'name': iosDeviceInfo.name,
                    'model': iosDeviceInfo.model,
                    'systemName': iosDeviceInfo.systemName,
                    'systemVersion': iosDeviceInfo.systemVersion,
                    'localizedModel': iosDeviceInfo.localizedModel,
                    'utsname': iosDeviceInfo.utsname.sysname,
                    'identifierForVendor': iosDeviceInfo.identifierForVendor,
                    'isPhysicalDevice': iosDeviceInfo.isPhysicalDevice
                },
                exception: exception,
                stackTrace: stackTrace
            );
        }

        if (Platform.isAndroid) {
            final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
            return Event(
                release: Constants.appVersion,
                environment: 'debug',
                extra: <String, dynamic> {
                    'type': androidDeviceInfo.type,
                    'model': androidDeviceInfo.model,
                    'device': androidDeviceInfo.device,
                    'id': androidDeviceInfo.id,
                    'androidId': androidDeviceInfo.androidId,
                    'brand': androidDeviceInfo.brand,
                    'display': androidDeviceInfo.display,
                    'hardware': androidDeviceInfo.hardware,
                    'manufacturer': androidDeviceInfo.manufacturer,
                    'product': androidDeviceInfo.product,
                    'version': androidDeviceInfo.version.release,
                    'supported32BitAbis': androidDeviceInfo.supported32BitAbis,
                    'supported64BitAbis': androidDeviceInfo.supported64BitAbis,
                    'supportedAbis': androidDeviceInfo.supportedAbis,
                    'isPhysicalDevice': androidDeviceInfo.isPhysicalDevice,
                },
                exception: exception,
                stackTrace: stackTrace
            );
        }

        return Event(
            release: Constants.appVersion,
            environment: 'debug',
            exception: exception,
            stackTrace: stackTrace
        );
    }

}
