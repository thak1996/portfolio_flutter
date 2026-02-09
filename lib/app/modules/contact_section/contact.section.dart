import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app/core/utils/url_launcher.helper.dart';
import 'package:portfolio_flutter/app/modules/widgets/text_field.widget.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../core/styles/colors.dart';
import '../../core/utils/app_validators.dart';
import '../widgets/primary_button.widget.dart';
import 'contact.model.dart';
import 'contact.controller.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({
    super.key,
    required this.content,
    required this.padding,
  });

  final ContactModel content;
  final EdgeInsets padding;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _isFormHovered = false;
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  final _phoneMask = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _subjectCtrl.dispose();
    _messageCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ContactController>();
    final breakpoint = ResponsiveBreakpoints.of(context);
    final l10n = AppLocalizations.of(context)!;

    final double horizontalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 20.0,
      conditionalValues: [
        const Condition.largerThan(name: MOBILE, value: 40.0),
        const Condition.largerThan(name: TABLET, value: 0.0),
      ],
    ).value;

    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.padding.bottom,
        left: horizontalPadding,
        right: horizontalPadding,
        top: 36,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.content.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: breakpoint.isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          ResponsiveRowColumn(
            layout: breakpoint.smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnSpacing: 48,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.content.subtitle,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: breakpoint.isMobile ? 20 : 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.content.description,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ...widget.content.infoItems.map(
                      (item) => _ContactInfoTile(item: item),
                    ),
                  ],
                ),
              ),
              if (breakpoint.isDesktop)
                const ResponsiveRowColumnItem(child: SizedBox(width: 80)),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: MouseRegion(
                  onEnter: (_) => setState(() => _isFormHovered = true),
                  onExit: (_) => setState(() => _isFormHovered = false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: _isFormHovered
                        ? Matrix4.translationValues(0, -10, 0)
                        : Matrix4.identity(),
                    padding: EdgeInsets.all(breakpoint.isMobile ? 20 : 32),
                    decoration: BoxDecoration(
                      color: _isFormHovered
                          ? AppColors.bgSlateDeep.withValues(alpha: 0.6)
                          : AppColors.bgSlateDeep.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: _isFormHovered
                            ? AppColors.primary.withValues(alpha: 0.8)
                            : const Color(0xFF1E293B),
                        width: _isFormHovered ? 2 : 1,
                      ),
                      boxShadow: [
                        if (_isFormHovered)
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.25),
                            blurRadius: 30,
                            spreadRadius: -5,
                            offset: const Offset(0, 15),
                          ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          ResponsiveRowColumn(
                            layout: breakpoint.isMobile
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            rowSpacing: 16,
                            columnSpacing: 24,
                            children: [
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: TextFieldWidget(
                                  label: widget.content.formLabels.nameLabel,
                                  controller: _nameCtrl,
                                  hint: widget.content.formLabels.nameHint,
                                  validator: (v) =>
                                      AppValidators.validateRequired(v, l10n),
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: TextFieldWidget(
                                  label: widget.content.formLabels.emailLabel,
                                  controller: _emailCtrl,
                                  hint: widget.content.formLabels.emailHint,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (v) =>
                                      AppValidators.validateEmail(v, l10n),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          ResponsiveRowColumn(
                            layout: breakpoint.isMobile
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            rowSpacing: 16,
                            columnSpacing: 24,
                            children: [
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: TextFieldWidget(
                                  label: widget.content.formLabels.subjectLabel,
                                  controller: _subjectCtrl,
                                  hint: widget.content.formLabels.subjectHint,
                                  validator: (v) =>
                                      AppValidators.validateRequired(v, l10n),
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: TextFieldWidget(
                                  label: widget.content.formLabels.phoneLabel,
                                  controller: _phoneCtrl,
                                  hint: widget.content.formLabels.phoneHint,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [_phoneMask],
                                  validator: (v) =>
                                      AppValidators.validatePhone(v, l10n),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          TextFieldWidget(
                            label: widget.content.formLabels.messageLabel,
                            controller: _messageCtrl,
                            hint: widget.content.formLabels.messageHint,
                            maxLines: 5,
                            validator: (v) =>
                                AppValidators.validateRequired(v, l10n),
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: PrimaryButton(
                              label: widget.content.formLabels.submitButtonText,
                              isPrimary: true,
                              isLoading: controller.isLoading,
                              onPressed: () => _handleSend(controller),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleSend(ContactController controller) async {
    if (_formKey.currentState!.validate()) {
      final String currentLang = Localizations.localeOf(context).languageCode;
      final ok = await controller.send(
        _nameCtrl.text,
        _emailCtrl.text,
        _phoneCtrl.text,
        _subjectCtrl.text,
        _messageCtrl.text,
        currentLang,
      );

      if (mounted) {
        _showFeedback(ok);
        if (ok) {
          _formKey.currentState!.reset();
          _nameCtrl.clear();
          _emailCtrl.clear();
          _subjectCtrl.clear();
          _messageCtrl.clear();
          _phoneCtrl.clear();
        }
      }
    }
  }

  void _showFeedback(bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? widget.content.formLabels.successMessage
              : widget.content.formLabels.errorMessage,
        ),
        backgroundColor: success ? Colors.green.shade800 : Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
        width: 400,
      ),
    );
  }
}

class _ContactInfoTile extends StatefulWidget {
  final ContactInfoItem item;
  const _ContactInfoTile({required this.item});

  @override
  State<_ContactInfoTile> createState() => _ContactInfoTileState();
}

class _ContactInfoTileState extends State<_ContactInfoTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isClickable = widget.item.url != null && widget.item.url != '#';

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: GestureDetector(
          onTap: () => isClickable ? openUrl(widget.item.url!) : null,
          child: MouseRegion(
            cursor: isClickable
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? AppColors.primary.withValues(alpha: 0.15)
                        : const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color:
                          _isHovered ? AppColors.primary : Colors.transparent,
                      width: 1,
                    ),
                    boxShadow: [
                      if (_isHovered)
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                    ],
                  ),
                  child: Icon(
                    widget.item.icon,
                    color: _isHovered ? Colors.white : AppColors.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        style: TextStyle(
                          color: _isHovered ? Colors.white : Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.item.value,
                        style: TextStyle(
                          color: _isHovered
                              ? AppColors.primary.withValues(alpha: 0.8)
                              : const Color(0xFF94A3B8),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
