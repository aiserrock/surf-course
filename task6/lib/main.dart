class Person {
  String name;

  Person(this.name);

  void displayInfo() {
    print('Имя: $name');
  }
}

class Gamer extends Person {
  int playedMatches;

  Gamer(String name, this.playedMatches) : super(name);

  void displayInfo() {
    super.displayInfo();
    print('Сыгранных матчей: $playedMatches');
  }

  void playGame() {
    print('$name играет в матч!');
  }
}

class Coach extends Person {
  int trophiesWon;

  Coach(String name, this.trophiesWon) : super(name);

  void displayInfo() {
    super.displayInfo();
    print('Количество выигранных трофеев: $trophiesWon');
  }

  void conductTraining() {
    print('$name проводит тренировку команды!');
  }
}

class GameStrategy {
  String strategyName;

  GameStrategy(this.strategyName);

  void explainStrategy() {
    print('Используемая стратегия: $strategyName');
  }
}

class Role {
  String roleName;

  Role(this.roleName);

  void describeRole() {
    print('Роль в игре: $roleName');
  }
}

class GamingTeam {
  String teamName;
  List<Gamer> players;
  Coach coach;
  GameStrategy strategy;

  GamingTeam(this.teamName, this.players, this.coach, this.strategy);

  void displayInfo() {
    print('Команда: $teamName');
    print('Игроки:');
    players.forEach((player) {
      player.displayInfo();
    });
    coach.displayInfo();
    strategy.explainStrategy();
  }

  void executeGamePlan() {
    print('$teamName выполняет игровой план!');
  }
}

void main() {
  // Пример использования классов
  var player1 = Gamer('Player1', 100);
  var player2 = Gamer('Player2', 150);

  var coach = Coach('Coach1', 5);

  var strategy = GameStrategy('Aggressive Push');

  var team = GamingTeam('TeamA', [player1, player2], coach, strategy);

  team.displayInfo();
  team.executeGamePlan();
}