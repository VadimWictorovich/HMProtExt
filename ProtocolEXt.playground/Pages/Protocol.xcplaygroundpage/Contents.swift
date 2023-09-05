import Foundation

// объявления протокола

protocol SomeProtocol1 {
    var firstValue: Int { get set }
    var secondValue: Int { get }
}

// реализация протокола в структуре
struct SomeStruct1: SomeProtocol1 {
    var firstValue: Int
    let secondValue: Int

    func getSum() -> Int {
        return firstValue + secondValue
    }
}

// объявление протокола, содержащего требование к реализации методов
protocol RandomNumberGenerator {
    var randomCollection: [Int] { get set }
    func getRandomNumber() -> Int
    mutating func setNewRandomCollection(newValue: [Int])
}

// реализация данного протокола в структуре
struct RandomGenerator: RandomNumberGenerator {
    var randomCollection: [Int] = [7, 10, 77, 133, 287]
    func getRandomNumber() -> Int {
        self.randomCollection.randomElement() ?? 0
    }

    mutating func setNewRandomCollection(newValue: [Int]) {
        self.randomCollection = newValue
    }
}

// реализации инициализатора
protocol Age {
    init(age: Int)
}

class Human: Age {
    var age: Int
    required init(age: Int) {
        self.age = age
    }
}

// реализация операторов as и is
protocol HasValue {
    var value: Int { get set }
}

class ClassWithValue: HasValue {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

struct StructWithValue: HasValue {
    var value: Int
}

let objects: [Any] = [2, StructWithValue(value: 7), true, ClassWithValue(value: 10), "Vadim"]

for element in objects {
    if let elem = element as? HasValue {
        print("Значение \(elem.value)")
    }
}

for element in objects {
    print(element is HasValue)
}

// наследование протоколов
protocol SomeProtocol5 {
    var firstWallet: Int { get set }
}

protocol SomeProtocol6 {
    var secondWallet: Int { get set }
}

protocol SomeProtocol7: SomeProtocol5, SomeProtocol6 {
    var sumWallet: Int { get }
}

struct Wallet: SomeProtocol7 {
    var firstWallet = 2000
    var secondWallet = 7000
    var sumWallet: Int {
        let sum = firstWallet + secondWallet
        return sum
    }
}
