import 'package:flutter_base/events_feed/models.dart';

final newsList = <NewsModel>[
  NewsModel(
    title: 'Дайджест №6 от корпоративного психолога',
    date: DateTime(2022, 1, 26, 16, 28),
  ),
  NewsModel(
    title: 'Набор в Школу Тимлида',
    date: DateTime(2022, 1, 24, 11, 42),
  ),
  NewsModel(
    title:
        'EPIC. Подведение итогов первого этапа обучения в школе мобильной разработки',
    date: DateTime(2022, 5, 17, 19, 00),
  ),
];

final eventList = <EventModel>[
  EventModel(
    title: 'В поисках оптимальной архитектуры проекта на Flutter',
    username: 'Анатолий Зверев',
    date: DateTime(2022, 04, 14, 11, 00),
    tag: 'Митап',
  ),
  EventModel(
    title: 'Kotlin vs Java',
    username: 'Тихон Устинов',
    date: DateTime(2022, 04, 25, 16, 00),
  ),
  EventModel(
    title: 'Как полюбить Flutter и успеть вернуться в IT до 40 лет',
    username: 'Переверзев Алексей',
    date: DateTime(2022, 08, 08, 15, 30),
    tag: 'Стендап',
  ),
];

final birthdayList = <BirthdayModel>[
  BirthdayModel(
    name: 'Александр Вахрушев',
    position: 'Менеджер проектов',
    date: DateTime.now(),
  ),
  BirthdayModel(
    name: 'Дмитрий Гуров',
    position: 'Ведущий разработчик',
    date: DateTime.now().add(const Duration(days: 1)),
  ),
  BirthdayModel(
    name: 'Переверзев Алексей',
    position: 'Flutter-разработчик',
    date: DateTime(2022, 11, 30),
  )
];