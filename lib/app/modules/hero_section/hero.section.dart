import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hero.model.dart';

class HeroSection extends StatelessWidget {
  final HeroModel content;

  const HeroSection({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Lado Esquerdo: Textos
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.1,
                  ),
                  children: [
                    const TextSpan(
                      text: "Building Digital\nExcellence with ",
                    ),
                    TextSpan(
                      text: "Precision",
                      style: TextStyle(color: const Color(0xFF137FEC)),
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                content.description,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  _heroButton(
                    content.actions[0].label,
                    isPrimary: content.actions[0].isPrimary,
                  ),
                  const SizedBox(width: 15),
                  _heroButton(
                    content.actions[1].label,
                    isPrimary: content.actions[1].isPrimary,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: content.socials
                    .map(
                      (social) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white10,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () => _openUrl(social.url),
                            icon: Icon(
                              social.icon,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        // Lado Direito: Imagem com Glow Azul
        Expanded(
          flex: 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF137FEC).withOpacity(0.3),
                      blurRadius: 100,
                      spreadRadius: 50,
                    )
                  ],
                ),
              ),
              // Imagem do Perfil
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  content.profileImageUrl,
                  height: 450,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _heroButton(String label, {required bool isPrimary}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF137FEC) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isPrimary ? null : Border.all(color: Colors.white24),
      ),
      child: Text(label,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  Future<void> _openUrl(String url) async {
    final trimmed = url.trim();
    if (trimmed.isEmpty || trimmed == '#') {
      return;
    }

    final uri = Uri.parse(trimmed);
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }
}
