class AppValidators {
  static String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) return 'Campo obrigatório';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Campo obrigatório';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Digite um e-mail válido';
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) return 'Campo obrigatório';
    final numbers = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (numbers.length < 10) return 'Telefone inválido';
    return null;
  }
}
