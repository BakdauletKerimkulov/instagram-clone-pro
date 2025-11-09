import 'package:instagram_clone_pro/src/features/auth/domain/app_user.dart';

const kTestUser = AppUser(
  uid: 'user1',
  email: 'test@test.com',
  avatarUrl: 'assets/images/chico.jpg',
  userName: 'chico_lachowski',
);

const kTestUserList = <AppUser>[
  // Пользователь 1 (Оригинальный)
  AppUser(
    uid: 'user1',
    email: 'test@test.com',
    avatarUrl: 'assets/images/chico.jpg',
    userName: 'chico_lachowski',
  ),

  // Пользователь 2
  AppUser(
    uid: 'user2',
    email: 'alice@example.com',
    avatarUrl: 'assets/images/jordan.jpg',
    userName: 'alice_wonder',
  ),

  // Пользователь 3
  AppUser(
    uid: 'user3',
    email: 'bob@example.com',
    avatarUrl: 'assets/images/sean.jpg',
    userName: 'bob_the_builder',
  ),

  // Пользователь 4
  AppUser(
    uid: 'user4',
    email: 'catherine@example.com',
    avatarUrl: 'assets/images/chico.jpg',
    userName: 'cathy_cat',
  ),

  // Пользователь 5
  AppUser(
    uid: 'user5',
    email: 'david@example.com',
    avatarUrl: 'assets/images/jordan.jpg',
    userName: 'dave_grohl',
  ),

  // Пользователь 6
  AppUser(
    uid: 'user6',
    email: 'eve@example.com',
    avatarUrl: 'assets/images/sean.jpg',
    userName: 'eve_adams',
  ),

  // Пользователь 7
  AppUser(
    uid: 'user7',
    email: 'frank@example.com',
    avatarUrl: 'assets/images/chico.jpg',
    userName: 'frank_ocean',
  ),

  // Пользователь 8
  AppUser(
    uid: 'user8',
    email: 'grace@example.com',
    avatarUrl: 'assets/images/jordan.jpg',
    userName: 'grace_hopper',
  ),

  // Пользователь 9
  AppUser(
    uid: 'user9',
    email: 'henry@example.com',
    avatarUrl: 'assets/images/sean.jpg',
    userName: 'henry_cavill',
  ),
];
