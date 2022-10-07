/// Является базовым модулем для работы с Tinkoff Acquiring API.
/// Модуль реализует протокол взаимодействия с сервером и позволяет не осуществлять прямых обращений в API.
///
/// Основной класс модуля: `TinkoffAcquiring` - предоставляет интерфейс для взаимодействия с Tinkoff Acquiring API.
/// Для работы необходимы ключи и пароль продавца.
library tinkoff_acquiring;

export 'src/core/models/models.dart'
    hide
        ObjectRequestValidate,
        NumEx,
        MapEx,
        JsonKeys,
        NetworkSettings,
        ApiMethods,
        Ignore,
        CardSettings;
export 'src/core/tinkoff_acquiring.dart';
export 'src/core/tinkoff_acquiring_config.dart';
