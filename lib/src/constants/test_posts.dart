import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';

const aspectRatio = 9 / 16;

final kTestPosts = [
  // 1. Обычное Фото (должно отображать лайки)
  MediaPost(
    id: 'p_001_photo',
    authorId: 'user1',
    postType: PostType.photo,
    timeStamp: DateTime.now().subtract(const Duration(hours: 1)),
    mediaUrl: [
      'https://i.pinimg.com/736x/8a/37/9a/8a379a649a0cf291371693e51aa33216.jpg',
    ],
    caption: 'Осенний пейзаж. Просто фото.',
    aspectRatio: aspectRatio,
    location: 'Алматы, Казахстан',
    likeCount: 154,
    commentCount: 12,
    isAd: false,
    isHidden: false,
    isLikeCountHidden: false,
    isPrivate: false,
  ),

  // 2. Карусель (скрыты лайки)
  MediaPost(
    id: 'p_002_carousel',
    authorId: 'user1',
    postType: PostType.carousel,
    timeStamp: DateTime.now().subtract(const Duration(hours: 3)),
    mediaUrl: [
      'https://image-cdn.flowgpt.com/trans-images/1733733841146-47f9d6b3-999a-4c48-a6d0-e892a9df43f2.default.webp',
      'https://i.pinimg.com/736x/13/bb/70/13bb709fc898a517d8dc80ba95867a93.jpg',
      'https://ss.metronews.ru/userfiles/materials/151/1512733/858x540.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_wyeAPH6XlVTYbSFhWg79Wb8u3U_dsSvZXA&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyQktDGC97dm02yHh8hO9j7ZxOTMyiU285gQ&s',
      'https://alchetron.com/cdn/sean-opry-e21db7e2-664f-4207-aa0b-54926d3bc13-resize-750.jpeg',
    ],
    caption: 'Новая коллекция. Листайте!',
    aspectRatio: aspectRatio,
    location: null, // Проверка nullable поля
    likeCount: 52000,
    commentCount: 890,
    isAd: false,
    isHidden: false,
    isLikeCountHidden: true, // Лайки скрыты
    isPrivate: false,
  ),

  // 3. Видео Пост (большое соотношение)
  MediaPost(
    id: 'p_003_video',
    authorId: 'user1',
    postType: PostType.video,
    timeStamp: DateTime.now().subtract(const Duration(days: 1)),
    mediaUrl: [
      'https://media.istockphoto.com/id/1471669024/video/police-detective-reading-evidence-document-looking-for-suspect-in-criminal-case.mp4?s=mp4-640x640-is&k=20&c=XsOR6fzWgiG_OKgnOitc59IydkNGof1234XLlU8dSkU=',
    ],
    caption: 'Рецепт за 60 секунд. Попробуйте.',
    aspectRatio: 10 / 12,
    location: 'Kitchen Studio',
    likeCount: 890,
    commentCount: 45,
    isAd: false,
    isHidden: false,
    isLikeCountHidden: false,
    isPrivate: false,
  ),

  // 4. Reels (вертикальный, рекламный)
  MediaPost(
    id: 'p_004_reel',
    authorId: 'user1',
    postType: PostType.reel,
    timeStamp: DateTime.now().subtract(const Duration(minutes: 30)),
    mediaUrl: [
      'https://cdn.pixabay.com/video/2015/11/27/1406-147169807_medium.mp4',
    ],
    caption: 'Новые кроссовки уже в продаже!',
    aspectRatio: 10 / 12, // Формат Reels
    location: null,
    likeCount: 12500,
    commentCount: 150,
    isAd: true, // Реклама
    isHidden: false,
    isLikeCountHidden: false,
    isPrivate: false,
  ),

  // 5. Пост с геотегом (без лайков)
  MediaPost(
    id: 'p_005_geo',
    authorId: 'user1',
    postType: PostType.photo,
    timeStamp: DateTime.now().subtract(const Duration(days: 5)),
    mediaUrl: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStP2HCJHe-nDO9HQT9h4a69kqL3VYeadmsUQ&s',
    ],
    caption: 'Незабываемый закат.',
    aspectRatio: aspectRatio,
    location: 'Mount Fuji, Japan', // Проверка nullable поля
    likeCount: 0,
    commentCount: 0,
    isAd: false,
    isHidden: false,
    isLikeCountHidden: false,
    isPrivate: false,
  ),

  // 6. Пост, скрытый для пользователя (isHidden)
  MediaPost(
    id: 'p_006_hidden',
    authorId: 'user1',
    postType: PostType.photo,
    timeStamp: DateTime.now().subtract(const Duration(days: 1)),
    mediaUrl: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW9h4fU35Nb2lGTCcT-GS1pVkWd5gqV0yegw&s',
    ],
    caption: 'Этот пост должен быть скрыт.',
    aspectRatio: aspectRatio,
    location: null,
    likeCount: 10,
    commentCount: 1,
    isAd: false,
    isHidden: true, // Пост скрыт
    isLikeCountHidden: false,
    isPrivate: false,
  ),

  // 7. Приватный пост (не должен быть виден, если нет подписки)
  MediaPost(
    id: 'p_007_private',
    authorId: 'user1',
    postType: PostType.photo,
    timeStamp: DateTime.now().subtract(const Duration(days: 2)),
    mediaUrl: [
      'https://image-cdn.flowgpt.com/trans-images/1733733841146-47f9d6b3-999a-4c48-a6d0-e892a9df43f2.default.webp',
    ],
    caption: 'Личное для своих.',
    aspectRatio: aspectRatio,
    location: 'Home',
    likeCount: 400,
    commentCount: 30,
    isAd: false,
    isHidden: false,
    isLikeCountHidden: false,
    isPrivate: true, // Приватный
  ),

  // 8. Reels с минимальным количеством данных
  MediaPost(
    id: 'p_008_reel_min',
    authorId: 'user1',
    postType: PostType.reel,
    timeStamp: DateTime.now().subtract(const Duration(minutes: 10)),
    mediaUrl: [
      'https://cdn.pixabay.com/video/2016/02/13/2141-155244186_tiny.mp4',
    ],
    caption: '',
    aspectRatio: 10 / 12,
    location: null,
    likeCount: 5,
    commentCount: 0,
    isAd: false,
    isHidden: false,
    isLikeCountHidden: false,
    isPrivate: false,
  ),

  // 9. Карусель с одним элементом (технически возможно)
  MediaPost(
    id: 'p_009_carousel_single',
    authorId: 'user1',
    postType: PostType.carousel,
    timeStamp: DateTime.now().subtract(const Duration(hours: 4)),
    mediaUrl: [
      'https://image-cdn.flowgpt.com/trans-images/1733733841146-47f9d6b3-999a-4c48-a6d0-e892a9df43f2.default.webp',
    ],
    caption: 'Тестовый пост карусели с одним фото.',
    aspectRatio: aspectRatio,
    location: 'Test Lab',
    likeCount: 42,
    commentCount: 3,
    isAd: false,
    isHidden: false,
    isLikeCountHidden: false,
    isPrivate: false,
  ),
];
