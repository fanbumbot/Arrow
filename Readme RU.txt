Данный pawno скрипт добавляет стрелку в виде текстдрава на монитор каждому
зашедшему на сервер игроку. Она показывает в определённую точку

(без настройки в точку {0.0, 0.0, 3.0}).

Стрелка имеет два режима работы, которые можно менять,
изменяя #define ARROW_MODE в самом начале скрипта.

При #define ARROW_MODE 0 будет включен режим камеры.
В режиме камеры при повороте стрелки учитывается поворот
камеры игрока, относительно точки в пространстве.
Данный режим не является полноценным, так как обновление
поворота камеры игроков в SA-MP обновляется приблизительно
раз в секунду. Из-за этого стрелка будет обновлять поворот
раз в секунду.

При #define ARROW_MODE 1 будет включен режим поворота.
В режиме поворота при повороте игрока или транспорта,
в котором сидит игрок, стрелка будет также поворачиваться,
а поворот камеры будет игнорироваться. Это неудобно, когда
камера игрока не смотрит ровно вперёд, но обновление стрелки
происходит правильно.

#define ARROW_UPDATE - частота обновления стрелки. Стандартное
значение, при котором стрелка обновляется без багов - 50.
Каждые 50 миллисекунд будет происходить обновление стрелки, независимо
от выбранного режима.

Июль 2021 г.
Fanbumbot[ScDrift]
( https://github.com/fanbumbot )
