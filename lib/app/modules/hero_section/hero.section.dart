import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app/core/utils/url_launcher.helper.dart';
import 'package:portfolio_flutter/app/modules/widgets/primary_button.widget.dart';
import 'hero.model.dart';

class HeroSection extends StatelessWidget {
  final HeroModel content;

  const HeroSection({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
                    TextSpan(
                      text: content.tagline,
                    ),
                    TextSpan(
                      text: content.taglineHighlight,
                      style: const TextStyle(color: Color(0xFF137FEC)),
                    ),
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
                  PrimaryButton(
                    label: content.actions[0].label,
                    isPrimary: content.actions[0].isPrimary,
                  ),
                  const SizedBox(width: 15),
                  PrimaryButton(
                    label: content.actions[1].label,
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
                            onPressed: () => openUrl(social.url),
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
                      color: const Color(0xFF137FEC).withValues(alpha: 0.3),
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
}
