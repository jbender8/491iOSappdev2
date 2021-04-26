//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let words = [ 0: "zero", 1: "one", 2: "two", 3: "three" ]

enum WordError : Error {
    case Unknown
    case NegativeInteger
    case NotInteger
}

func word(for input: String) throws -> String {
    if let key = Int(input) {
        if key >= 0 {
            if let value = words[key] {
                return value
            } else {
                throw WordError.Unknown
            }
        } else {
            throw WordError.NegativeInteger
        }
    } else {
        throw WordError.NotInteger
    }
}

try word(for: "A")
try word(for: "100")
try word(for: "-2")
try word(for: "3")


func word(_ input: String) throws -> String {
    guard let key = Int(input) else { throw WordError.NotInteger }
    guard key >= 0 else { throw WordError.NegativeInteger }
    guard let value = words[key] else { throw WordError.Unknown }
    return value
}

try word("A")
try word("100")
try word("-2")
try word("3")



//: [Next](@next)
