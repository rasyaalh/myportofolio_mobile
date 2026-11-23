import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = "2506534176";
  final String nama = "Rasya Al Hawari";
  final String kelas = "PBP D";

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Experience", Icons.work_rounded, const Color(0xFF1D4ED8)),
    ItemHomepage("Lihat Achievement", Icons.emoji_events_rounded, const Color(0xFFD97706)),
    ItemHomepage("Lihat Education", Icons.school_rounded, const Color(0xFF0F766E)),
    ItemHomepage("Lihat Certification", Icons.verified_rounded, const Color(0xFF6D28D9)),
    ItemHomepage("Lihat Contact", Icons.contact_mail_rounded, const Color(0xFF0369A1)),
    ItemHomepage("Tambah Proyek", Icons.add_circle_rounded, const Color(0xFF15803D)),
    ItemHomepage("Tambah Experience", Icons.post_add_rounded, const Color(0xFFBE185D)),
    ItemHomepage("Logout", Icons.logout_rounded, const Color(0xFFDC2626)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.dashboard_customize_rounded, color: Colors.white, size: 22),
            SizedBox(width: 8),
            Text(
              'MyPortfolio',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1E3A8A).withValues(alpha: 0.22),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        child: const Text(
                          'RA',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo, $nama!',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Computer Science • Fasilkom UI',
                              style: TextStyle(
                                color: Color(0xFFDBEAFE),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: InfoCard(
                        title: 'NPM',
                        content: npm,
                        icon: Icons.badge_outlined,
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: npm));
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                content: Text('NPM $npm berhasil disalin!'),
                              ),
                            );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InfoCard(
                        title: 'Name',
                        content: nama,
                        icon: Icons.person_outline_rounded,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InfoCard(
                        title: 'Class',
                        content: kelas,
                        icon: Icons.class_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22.0),
                const Text(
                  'Selamat datang di MyPortfolio Mobile!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Pilih menu di bawah untuk menjelajahi data portofolio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xFF475569),
                  ),
                ),
                const SizedBox(height: 16.0),
                GridView.count(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  crossAxisCount: 3,
                  childAspectRatio: 1.1,
                  shrinkWrap: true,
                  children: items.map((ItemHomepage item) {
                    return ItemCard(item);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final VoidCallback? onTap;

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2.0,
      shadowColor: const Color(0xFF1E3A8A).withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFBFDBFE),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20, color: const Color(0xFF1E3A8A)),
              const SizedBox(height: 6.0),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                content,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}