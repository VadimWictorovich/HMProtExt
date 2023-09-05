//: [Previous](@previous)

import Foundation


// реализация расширения
extension Double {
var asKM: Double { return self / 1000.0 }
}
let length: Double = 25
length.asKM


// расширение протоколов
protocol Descriptional {
func getDescription() -> String
}
extension Descriptional {
func getDescription() -> String {
return "расширение функции протокола"
}
}

class myClass1: Descriptional {}
// вызовем метод
print(myClass1().getDescription())

