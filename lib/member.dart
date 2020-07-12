// Кастомный тип
class Member
{
  // Логин
  final String login;
  // URL автарки
  final String avatarUrl;

  // Конструктор для полей
  Member(this.login, this.avatarUrl)
  {
    // Проверка поля логин
    if (login == null) {
      throw ArgumentError("login of Member cannot be null. "
          "Received: '$login'");
    }
    // Проверка поля URL аватари
    if (avatarUrl == null) {
      throw ArgumentError("avatarUrl of Member cannot be null. "
          "Received: '$avatarUrl'");
    }
  }
}