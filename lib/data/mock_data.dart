import 'package:flutter/material.dart';

import '../models/app_info.dart';
import '../models/category.dart';
import '../models/review.dart';

/// Every listing below is fictional — invented names, developers and quotes
/// for demo purposes only.
class MockData {
  MockData._();

  static const _sampleReviews = [
    Review(
      author: 'Lina R.',
      rating: 5,
      comment: 'Exactly what I needed, works flawlessly and looks great.',
      daysAgo: 3,
      helpfulCount: 42,
    ),
    Review(
      author: 'Marcus T.',
      rating: 4,
      comment: 'Solid app overall, a couple of small bugs but nothing major.',
      daysAgo: 9,
      helpfulCount: 17,
    ),
    Review(
      author: 'Priya K.',
      rating: 5,
      comment: 'Been using it for months, the recent update made it even better.',
      daysAgo: 21,
      helpfulCount: 63,
    ),
    Review(
      author: 'Sam O.',
      rating: 3,
      comment: 'Does the job but the interface could use some polish.',
      daysAgo: 45,
      helpfulCount: 8,
    ),
    Review(
      author: 'Farah A.',
      rating: 5,
      comment: 'Support team fixed my issue within a day. Impressed!',
      daysAgo: 60,
      helpfulCount: 25,
    ),
  ];

  static List<AppInfo> get apps => List.unmodifiable(_apps);

  static final List<AppInfo> _apps = [
    AppInfo(
      id: 'pixelgram',
      name: 'PixelGram',
      developer: 'Northlight Studio',
      category: AppCategory.photography,
      tagline: 'Edit and share photos with pro-grade filters',
      description:
          'PixelGram brings studio-quality editing tools to your pocket. Apply '
          'layered filters, fine-tune color curves, and share to your feed in '
          'seconds. Includes a growing library of community presets and a '
          'distraction-free editor built for speed.',
      rating: 4.6,
      ratingCount: 128000,
      downloads: 5200000,
      sizeInMb: 86,
      price: 0,
      version: '4.2.1',
      updatedDaysAgo: 6,
      iconGlyph: Icons.photo_camera_rounded,
      gradient: const [Color(0xFFFF6B6B), Color(0xFFFFA36B)],
      screenshotCount: 5,
      editorsChoice: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'chatwave',
      name: 'ChatWave',
      developer: 'Bluepeak Labs',
      category: AppCategory.social,
      tagline: 'Fast, private messaging for everyone',
      description:
          'ChatWave keeps conversations quick and private with end-to-end '
          'encrypted chats, disappearing messages, and crisp group video calls '
          'that work even on slow connections.',
      rating: 4.4,
      ratingCount: 342000,
      downloads: 18000000,
      sizeInMb: 54,
      price: 0,
      version: '9.0.4',
      updatedDaysAgo: 2,
      iconGlyph: Icons.chat_bubble_rounded,
      gradient: const [Color(0xFF36D1DC), Color(0xFF5B86E5)],
      screenshotCount: 4,
      editorsChoice: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'taskzen',
      name: 'TaskZen',
      developer: 'Quiet Room Software',
      category: AppCategory.productivity,
      tagline: 'A calmer way to manage your to-do list',
      description:
          'TaskZen strips away the clutter of traditional planners. Organize '
          'tasks into focused boards, set gentle reminders, and track streaks '
          'without the anxiety of a cluttered dashboard.',
      rating: 4.8,
      ratingCount: 76000,
      downloads: 2100000,
      sizeInMb: 41,
      price: 0,
      version: '2.7.0',
      updatedDaysAgo: 14,
      iconGlyph: Icons.check_circle_rounded,
      gradient: const [Color(0xFF43C6AC), Color(0xFF191654)],
      screenshotCount: 5,
      editorsChoice: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'beatflow',
      name: 'BeatFlow',
      developer: 'Cadence Interactive',
      category: AppCategory.music,
      tagline: 'Stream, mix, and discover new tracks daily',
      description:
          'BeatFlow curates fresh playlists based on your mood and offers an '
          'in-app mixing deck so you can remix your favorite tracks on the go. '
          'Offline downloads included on every plan.',
      rating: 4.3,
      ratingCount: 210000,
      downloads: 9800000,
      sizeInMb: 62,
      price: 0,
      version: '6.1.3',
      updatedDaysAgo: 5,
      iconGlyph: Icons.graphic_eq_rounded,
      gradient: const [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
      screenshotCount: 4,
      containsAds: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'fitpulse',
      name: 'FitPulse',
      developer: 'Ironwell Health',
      category: AppCategory.health,
      tagline: 'Personalized workouts that fit your schedule',
      description:
          'FitPulse builds adaptive workout plans around your goals, equipment, '
          'and available time. Track heart rate zones, log meals, and celebrate '
          'milestones with a supportive community.',
      rating: 4.7,
      ratingCount: 95000,
      downloads: 3400000,
      sizeInMb: 73,
      price: 0,
      version: '3.4.9',
      updatedDaysAgo: 11,
      iconGlyph: Icons.monitor_heart_rounded,
      gradient: const [Color(0xFFFF512F), Color(0xFFDD2476)],
      screenshotCount: 5,
      editorsChoice: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'mindmapgenius',
      name: 'MindMap Genius',
      developer: 'Clearview Apps',
      category: AppCategory.education,
      tagline: 'Turn scattered notes into visual mind maps',
      description:
          'MindMap Genius helps students and professionals organize ideas '
          'visually. Drag-and-drop nodes, collaborate in real time, and export '
          'polished maps straight to PDF.',
      rating: 4.5,
      ratingCount: 41000,
      downloads: 1200000,
      sizeInMb: 38,
      price: 3.99,
      version: '1.9.2',
      updatedDaysAgo: 30,
      iconGlyph: Icons.hub_rounded,
      gradient: const [Color(0xFF00C6FB), Color(0xFF005BEA)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'wealthgrid',
      name: 'WealthGrid',
      developer: 'Ledgerline Financial',
      category: AppCategory.finance,
      tagline: 'Budgeting and investing in one clean app',
      description:
          'WealthGrid links your accounts to give you a single view of your '
          'spending and investments. Automated budgets, bill reminders, and '
          'plain-language investment insights included.',
      rating: 4.2,
      ratingCount: 58000,
      downloads: 1900000,
      sizeInMb: 47,
      price: 0,
      version: '5.5.0',
      updatedDaysAgo: 8,
      iconGlyph: Icons.trending_up_rounded,
      gradient: const [Color(0xFF11998E), Color(0xFF38EF7D)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'streamloom',
      name: 'StreamLoom',
      developer: 'Reelhouse Media',
      category: AppCategory.entertainment,
      tagline: 'Binge originals and live channels together',
      description:
          'StreamLoom bundles original series, live channels, and a watch '
          'party feature so you can react with friends in real time, no matter '
          'where they are.',
      rating: 4.1,
      ratingCount: 260000,
      downloads: 14000000,
      sizeInMb: 91,
      price: 0,
      version: '7.3.1',
      updatedDaysAgo: 4,
      iconGlyph: Icons.live_tv_rounded,
      gradient: const [Color(0xFF232526), Color(0xFF414345)],
      screenshotCount: 5,
      containsAds: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'codecraft',
      name: 'CodeCraft',
      developer: 'Anvil Dev Tools',
      category: AppCategory.tools,
      tagline: 'A pocket code editor with real terminal access',
      description:
          'CodeCraft is a full-featured code editor for mobile with syntax '
          'highlighting for 40+ languages, an integrated terminal, and Git '
          'support so you can ship fixes from anywhere.',
      rating: 4.6,
      ratingCount: 33000,
      downloads: 890000,
      sizeInMb: 68,
      price: 0,
      version: '2.2.4',
      updatedDaysAgo: 17,
      iconGlyph: Icons.terminal_rounded,
      gradient: const [Color(0xFF485563), Color(0xFF29323C)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'skyforge',
      name: 'Skyforge Legends',
      developer: 'Ember Peak Games',
      category: AppCategory.games,
      tagline: 'Build, battle, and explore floating islands',
      description:
          'Skyforge Legends drops you into a vibrant world of floating '
          'islands. Craft gear, tame creatures, and team up for weekly raid '
          'events with players around the world.',
      rating: 4.5,
      ratingCount: 410000,
      downloads: 22000000,
      sizeInMb: 512,
      price: 0,
      version: '11.0.2',
      updatedDaysAgo: 1,
      iconGlyph: Icons.terrain_rounded,
      gradient: const [Color(0xFF7F00FF), Color(0xFFE100FF)],
      screenshotCount: 5,
      editorsChoice: true,
      containsAds: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'dashpuzzle',
      name: 'Dash Puzzle',
      developer: 'Loopwork Games',
      category: AppCategory.games,
      tagline: 'Quick, brain-bending puzzles for a coffee break',
      description:
          'Dash Puzzle serves up bite-sized levels that get progressively '
          'trickier. No timers, no pressure — just satisfying puzzle design '
          'with a relaxing soundtrack.',
      rating: 4.7,
      ratingCount: 88000,
      downloads: 4300000,
      sizeInMb: 112,
      price: 0,
      version: '3.0.6',
      updatedDaysAgo: 12,
      iconGlyph: Icons.extension_rounded,
      gradient: const [Color(0xFFF7971E), Color(0xFFFFD200)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'friendorbit',
      name: 'FriendOrbit',
      developer: 'Nearby Networks',
      category: AppCategory.social,
      tagline: 'Discover local events and meet new friends',
      description:
          'FriendOrbit surfaces meetups, clubs, and events near you based on '
          'shared interests. RSVP in one tap and keep the conversation going '
          'in dedicated group chats.',
      rating: 4.0,
      ratingCount: 51000,
      downloads: 1600000,
      sizeInMb: 58,
      price: 0,
      version: '4.8.0',
      updatedDaysAgo: 19,
      iconGlyph: Icons.groups_rounded,
      gradient: const [Color(0xFFFDC830), Color(0xFFF37335)],
      screenshotCount: 4,
      containsAds: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'notegarden',
      name: 'NoteGarden',
      developer: 'Quiet Room Software',
      category: AppCategory.productivity,
      tagline: 'Notes that grow into a knowledge base',
      description:
          'NoteGarden links related notes automatically, turning scattered '
          'thoughts into a searchable knowledge base. Includes handwriting '
          'support and cross-device sync.',
      rating: 4.6,
      ratingCount: 64000,
      downloads: 2600000,
      sizeInMb: 45,
      price: 0,
      version: '8.1.0',
      updatedDaysAgo: 7,
      iconGlyph: Icons.eco_rounded,
      gradient: const [Color(0xFF56AB2F), Color(0xFFA8E063)],
      screenshotCount: 5,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'lumenlens',
      name: 'LumenLens',
      developer: 'Northlight Studio',
      category: AppCategory.photography,
      tagline: 'RAW photo editing built for mobile',
      description:
          'LumenLens brings desktop-grade RAW editing to your phone, with '
          'non-destructive layers, precise masking, and batch export for '
          'photographers on the move.',
      rating: 4.4,
      ratingCount: 27000,
      downloads: 640000,
      sizeInMb: 134,
      price: 5.99,
      version: '2.4.1',
      updatedDaysAgo: 25,
      iconGlyph: Icons.tune_rounded,
      gradient: const [Color(0xFF614385), Color(0xFF516395)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'tunecrate',
      name: 'TuneCrate',
      developer: 'Cadence Interactive',
      category: AppCategory.music,
      tagline: 'A digital crate for vinyl and lossless audio lovers',
      description:
          'TuneCrate is built for audiophiles: lossless streaming, a crate-dig '
          'discovery mode, and deep liner-note style artist pages you won\'t '
          'find anywhere else.',
      rating: 4.5,
      ratingCount: 19000,
      downloads: 480000,
      sizeInMb: 57,
      price: 4.99,
      version: '1.6.0',
      updatedDaysAgo: 40,
      iconGlyph: Icons.album_rounded,
      gradient: const [Color(0xFF360033), Color(0xFF0B8793)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'calmroute',
      name: 'CalmRoute',
      developer: 'Ironwell Health',
      category: AppCategory.health,
      tagline: 'Guided meditation and sleep stories',
      description:
          'CalmRoute pairs breathing exercises with soothing narration to help '
          'you unwind. Fall asleep faster with a growing library of sleep '
          'stories and ambient soundscapes.',
      rating: 4.8,
      ratingCount: 132000,
      downloads: 6100000,
      sizeInMb: 79,
      price: 0,
      version: '4.0.3',
      updatedDaysAgo: 3,
      iconGlyph: Icons.self_improvement_rounded,
      gradient: const [Color(0xFF1FA2FF), Color(0xFF12D8FA)],
      screenshotCount: 5,
      editorsChoice: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'langleap',
      name: 'LangLeap',
      developer: 'Clearview Apps',
      category: AppCategory.education,
      tagline: 'Learn a language with 5-minute daily lessons',
      description:
          'LangLeap keeps language learning light and habit-forming with '
          'bite-sized lessons, speech-recognition practice, and streaks that '
          'actually keep you coming back.',
      rating: 4.6,
      ratingCount: 305000,
      downloads: 16000000,
      sizeInMb: 52,
      price: 0,
      version: '10.2.0',
      updatedDaysAgo: 2,
      iconGlyph: Icons.translate_rounded,
      gradient: const [Color(0xFFF953C6), Color(0xFFB91D73)],
      screenshotCount: 5,
      containsAds: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'centpilot',
      name: 'CentPilot',
      developer: 'Ledgerline Financial',
      category: AppCategory.finance,
      tagline: 'Round-up savings that fly on autopilot',
      description:
          'CentPilot rounds up your everyday purchases and automatically '
          'invests the spare change into a diversified portfolio you control.',
      rating: 4.3,
      ratingCount: 22000,
      downloads: 730000,
      sizeInMb: 39,
      price: 0,
      version: '3.3.3',
      updatedDaysAgo: 22,
      iconGlyph: Icons.savings_rounded,
      gradient: const [Color(0xFF16A085), Color(0xFFF4D03F)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'nightreel',
      name: 'NightReel',
      developer: 'Reelhouse Media',
      category: AppCategory.entertainment,
      tagline: 'Short-form stories for your commute',
      description:
          'NightReel delivers serialized short stories and audio dramas in '
          '10-minute episodes, perfect for commutes, workouts, or winding down.',
      rating: 4.2,
      ratingCount: 47000,
      downloads: 1500000,
      sizeInMb: 36,
      price: 0,
      version: '2.9.1',
      updatedDaysAgo: 15,
      iconGlyph: Icons.auto_stories_rounded,
      gradient: const [Color(0xFF283048), Color(0xFF859398)],
      screenshotCount: 4,
      containsAds: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'shieldbox',
      name: 'ShieldBox',
      developer: 'Anvil Dev Tools',
      category: AppCategory.tools,
      tagline: 'Encrypted file vault and secure notes',
      description:
          'ShieldBox stores your sensitive files and notes behind '
          'military-grade encryption, with biometric lock and secure sharing '
          'links that expire automatically.',
      rating: 4.7,
      ratingCount: 15000,
      downloads: 410000,
      sizeInMb: 29,
      price: 2.99,
      version: '1.4.2',
      updatedDaysAgo: 33,
      iconGlyph: Icons.enhanced_encryption_rounded,
      gradient: const [Color(0xFF0F2027), Color(0xFF2C5364)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'driftracers',
      name: 'Drift Racers',
      developer: 'Ember Peak Games',
      category: AppCategory.games,
      tagline: 'Arcade drift racing with custom rides',
      description:
          'Drift Racers puts arcade handling front and center: tune your car, '
          'chain drift combos, and climb weekly leaderboards across a dozen '
          'neon-lit tracks.',
      rating: 4.4,
      ratingCount: 190000,
      downloads: 11000000,
      sizeInMb: 328,
      price: 0,
      version: '5.7.0',
      updatedDaysAgo: 9,
      iconGlyph: Icons.sports_motorsports_rounded,
      gradient: const [Color(0xFFFF0099), Color(0xFF493240)],
      screenshotCount: 5,
      containsAds: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'kinfolk',
      name: 'Kinfolk',
      developer: 'Nearby Networks',
      category: AppCategory.social,
      tagline: 'A private space for close family and friends',
      description:
          'Kinfolk is an ad-free, invite-only space to share updates, photos, '
          'and plans with the people who matter most — no public feed, no '
          'algorithm.',
      rating: 4.9,
      ratingCount: 39000,
      downloads: 980000,
      sizeInMb: 44,
      price: 0,
      version: '2.1.5',
      updatedDaysAgo: 5,
      iconGlyph: Icons.family_restroom_rounded,
      gradient: const [Color(0xFFFFAFBD), Color(0xFFFFC3A0)],
      screenshotCount: 4,
      editorsChoice: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'focusdeck',
      name: 'FocusDeck',
      developer: 'Quiet Room Software',
      category: AppCategory.productivity,
      tagline: 'Timeboxing and focus sessions that stick',
      description:
          'FocusDeck combines timeboxing, a Pomodoro timer, and gentle '
          'analytics to help you understand where your attention actually '
          'goes each week.',
      rating: 4.5,
      ratingCount: 29000,
      downloads: 870000,
      sizeInMb: 33,
      price: 0,
      version: '1.8.4',
      updatedDaysAgo: 13,
      iconGlyph: Icons.timer_rounded,
      gradient: const [Color(0xFF4568DC), Color(0xFFB06AB3)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'framewalk',
      name: 'FrameWalk',
      developer: 'Northlight Studio',
      category: AppCategory.photography,
      tagline: 'Turn photo walks into shareable stories',
      description:
          'FrameWalk maps your photo walks and stitches shots into a '
          'scrollable story with location context, perfect for travel logs.',
      rating: 4.1,
      ratingCount: 9800,
      downloads: 210000,
      sizeInMb: 61,
      price: 0,
      version: '1.2.0',
      updatedDaysAgo: 48,
      iconGlyph: Icons.map_rounded,
      gradient: const [Color(0xFF00B4DB), Color(0xFF0083B0)],
      screenshotCount: 4,
      containsAds: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'reverbroom',
      name: 'Reverb Room',
      developer: 'Cadence Interactive',
      category: AppCategory.music,
      tagline: 'A pocket studio for beatmakers',
      description:
          'Reverb Room turns your phone into a lightweight production studio '
          'with drum pads, loop layering, and one-tap export to share your '
          'beats instantly.',
      rating: 4.3,
      ratingCount: 12500,
      downloads: 360000,
      sizeInMb: 96,
      price: 0,
      version: '2.0.1',
      updatedDaysAgo: 26,
      iconGlyph: Icons.piano_rounded,
      gradient: const [Color(0xFF9D50BB), Color(0xFF6E48AA)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'stridewell',
      name: 'StrideWell',
      developer: 'Ironwell Health',
      category: AppCategory.health,
      tagline: 'Walking and running coach that adapts to you',
      description:
          'StrideWell builds walking and running plans around your pace and '
          'recovery, with gentle voice coaching and weekly progress recaps.',
      rating: 4.6,
      ratingCount: 54000,
      downloads: 2000000,
      sizeInMb: 66,
      price: 0,
      version: '3.1.2',
      updatedDaysAgo: 10,
      iconGlyph: Icons.directions_run_rounded,
      gradient: const [Color(0xFF00F260), Color(0xFF0575E6)],
      screenshotCount: 5,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'quizforge',
      name: 'QuizForge',
      developer: 'Clearview Apps',
      category: AppCategory.education,
      tagline: 'Build and share quizzes in minutes',
      description:
          'QuizForge lets teachers and teams build interactive quizzes with '
          'instant grading, live leaderboards, and shareable results — no '
          'account needed for players.',
      rating: 4.4,
      ratingCount: 21000,
      downloads: 690000,
      sizeInMb: 31,
      price: 0,
      version: '2.5.0',
      updatedDaysAgo: 18,
      iconGlyph: Icons.quiz_rounded,
      gradient: const [Color(0xFFFC5C7D), Color(0xFF6A82FB)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'ledgerlite',
      name: 'LedgerLite',
      developer: 'Ledgerline Financial',
      category: AppCategory.finance,
      tagline: 'Simple invoicing for freelancers',
      description:
          'LedgerLite handles invoicing, expense tracking, and tax-ready '
          'reports for freelancers who would rather spend time on their craft '
          'than on spreadsheets.',
      rating: 4.5,
      ratingCount: 17000,
      downloads: 520000,
      sizeInMb: 37,
      price: 6.99,
      version: '4.0.0',
      updatedDaysAgo: 27,
      iconGlyph: Icons.receipt_long_rounded,
      gradient: const [Color(0xFF2C3E50), Color(0xFF4CA1AF)],
      screenshotCount: 4,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'popcornclub',
      name: 'Popcorn Club',
      developer: 'Reelhouse Media',
      category: AppCategory.entertainment,
      tagline: 'Vote on what to watch with friends',
      description:
          'Popcorn Club turns "what should we watch" into a quick swipe-based '
          'vote across everyone\'s streaming libraries, then finds where the '
          'winner is actually available.',
      rating: 4.0,
      ratingCount: 14000,
      downloads: 430000,
      sizeInMb: 42,
      price: 0,
      version: '1.3.0',
      updatedDaysAgo: 20,
      iconGlyph: Icons.local_movies_rounded,
      gradient: const [Color(0xFFEB3349), Color(0xFFF45C43)],
      screenshotCount: 4,
      containsAds: true,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'snapclip',
      name: 'SnapClip',
      developer: 'Anvil Dev Tools',
      category: AppCategory.tools,
      tagline: 'Clipboard manager with cross-device sync',
      description:
          'SnapClip remembers everything you copy, syncs it across your '
          'devices, and lets you search past clips instantly — text, links, '
          'and images alike.',
      rating: 4.6,
      ratingCount: 11000,
      downloads: 300000,
      sizeInMb: 22,
      price: 1.99,
      version: '3.2.1',
      updatedDaysAgo: 16,
      iconGlyph: Icons.content_paste_rounded,
      gradient: const [Color(0xFF636FA4), Color(0xFFE8CBC0)],
      screenshotCount: 3,
      reviews: _sampleReviews,
    ),
    AppInfo(
      id: 'stonepath',
      name: 'Stonepath Tactics',
      developer: 'Ember Peak Games',
      category: AppCategory.games,
      tagline: 'Turn-based strategy on a hand-painted map',
      description:
          'Stonepath Tactics is a turn-based strategy game with hand-painted '
          'maps, a branching campaign, and asynchronous multiplayer duels.',
      rating: 4.8,
      ratingCount: 62000,
      downloads: 1700000,
      sizeInMb: 245,
      price: 0,
      version: '1.5.3',
      updatedDaysAgo: 6,
      iconGlyph: Icons.castle_rounded,
      gradient: const [Color(0xFF544A7D), Color(0xFFFFD452)],
      screenshotCount: 5,
      editorsChoice: true,
      reviews: _sampleReviews,
    ),
  ];

  static List<AppInfo> byCategory(AppCategory category) =>
      apps.where((a) => a.category == category).toList();

  static List<AppInfo> get editorsChoice =>
      apps.where((a) => a.editorsChoice).toList();

  static List<AppInfo> get topCharts {
    final sorted = [...apps]..sort((a, b) {
      final byDownloads = b.downloads.compareTo(a.downloads);
      if (byDownloads != 0) return byDownloads;
      return b.rating.compareTo(a.rating);
    });
    return sorted;
  }

  static List<AppInfo> get newAndUpdated {
    final sorted = [...apps]..sort(
      (a, b) => a.updatedDaysAgo.compareTo(b.updatedDaysAgo),
    );
    return sorted;
  }

  static AppInfo? byId(String id) {
    for (final app in apps) {
      if (app.id == id) return app;
    }
    return null;
  }
}
