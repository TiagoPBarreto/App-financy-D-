class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (value != null && condition.hasMatch(value)) {
      return "Nome invalido, digite um nome válido";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(
        r"/^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$/gm");
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (value != null && condition.hasMatch(value)) {
      return "Email invalido, digite um email válido";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (value != null && condition.hasMatch(value)) {
      return "Senha invalida, digite um senha válida";
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if (first != second) {
      return "As senhas são diferentes. Por favor, corrigir para continuar";
    }
    return null;
  }
}
