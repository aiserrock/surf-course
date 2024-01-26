class Car {
  Car(this._brand, this._model, this._productionYear, this.engine);

  // Конструктор с именованными параметрами
  Car.named(this._brand, this._model, this.engine,
      {required int productionYear})
      : _productionYear = productionYear;

  // Приватные поля
  final String _brand;
  final String _model;
  final int _productionYear;
  double _currentSpeed = 0.0;
  bool _engineStarted = false;
  final Engine engine;

  // Константы для всех объектов этого класса
  static const int numberOfWheels = 4;

  // Метод для запуска двигателя
  void startEngine() {
    if (_engineStarted) {
      print('Двигатель уже запущен.');
      return;
    }
    engine.start();
    _engineStarted = true;
  }

  // Метод для остановки двигателя
  void stopEngine() {
    if (!_engineStarted) {
      print('Двигатель уже остановлен.');
      return;
    }
    engine.stop();
    _engineStarted = false;
    _currentSpeed = 0.0;
  }

  // Метод для ускорения автомобиля
  void accelerate(double speedIncrement) {
    if (_engineStarted) {
      _currentSpeed += speedIncrement;
      print(
          'Скорость увеличена на $speedIncrement км/ч. Текущая скорость: $_currentSpeed км/ч.');
    } else {
      print('Двигатель не запущен. Ускорение невозможно.');
    }
  }

  // Геттер для получения текущей скорости
  double get currentSpeed => _currentSpeed;
}

// Вложенный класс "Двигатель"
class Engine {
  final String type;
  final int horsepower;

  Engine(this.type, this.horsepower);

  void stop() {
    print('Двигатель остановлен.');
  }

  void start() {
    print('Двигатель запущен.');
  }

  @override
  String toString() {
    return 'Тип двигателя: $type, Мощность: $horsepower л.с.';
  }
}

void main() {
  // Создаем объект класса Car с использованием различных конструкторов
  final car1 = Car(
    'Toyota',
    'Camry',
    2022,
    Engine('V8', 300),
  );
  final car2 = Car.named(
    'Tesla',
    'Model S',
    productionYear: 2023,
    Engine('V8', 300),
  );

  // Используем методы и свойства объекта
  car1.startEngine();
  car1.accelerate(30.0);

  car2.startEngine();
  car2.accelerate(40.0);
  print(car2.engine);
}
