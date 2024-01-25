void main() {
  while (true) {
    if (isFridgeEmpty()) {
      if (isLazyToGoToStore()) {
        orderDelivery();
      } else {
        goToStore();
        shop();
        returnFromStore();
      }

      eat();
    } else {
      if (isLazyToCallTaxi()) {
        orderTaxi();
      } else {
        callTaxi();
        reachDestination();
        returnFromDestination();
      }

      continue;
    }
  }
}

void orderTaxi() {
  for (int i = 0; i < 3; i++) {
    if (isTaxiCompanyRecommended(i)) {
      confirmTaxiOrder();
      break;
    } else {
      continue;
    }
  }
}

void callTaxi() {
  // Логика вызова такси
}

void reachDestination() {
  // Логика достижения пункта назначения
}

void returnFromDestination() {
  // Логика возвращения из пункта назначения
}

bool isLazyToCallTaxi() {
  // Логика проверки, лень ли вызывать такси
}

void confirmTaxiOrder() {
  // Логика подтверждения заказа такси
}

bool isTaxiCompanyRecommended(int taxiCompanyIndex) {
  // Логика проверки, рекомендуется ли такси-компания с индексом taxiCompanyIndex
}