import UIKit

var str = "Hello, playground"


let numbers: [Any] = [ 0, 0.0, 2017, Double.pi, -Double.pi, Float.pi ]

for n in numbers {
    switch n {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let i as Int:
        print("an integer: \(i)")
    case let d as Double where d > 0:
        print("a positive double \(d)")
    case is Double:
        print("a negative double \(n)")
    default:
        print("some other number \(n)")
    }
}

print()

let points = [  (0, 0), (1, 1), (4, 0), (0, -5), (-1, -1), (-3, 3),(-2, 1)  ]
for p in points {
    switch p {
    case (0, 0):
        print("(0, 0) is at the origin")
    case (_, 0):
        print("(\(p.0), 0) is on the x-axis")
    case (0, _):
        print("(0, \(p.1)) is on the y-axis")
    case (-2...2, -2...2):
        print("(\(p.0), \(p.1)) is inside the box (-2...2, -2...2)")
    default:
        print("(\(p.0), \(p.1)) is outside of the box (-2...2, -2...2)")
    }
}

print()

for p in points {
    switch p {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
    }
}

print()

struct Book {
    var title: String
    var author: String
}

func hello(name: String) -> String {
    return "Hello, \(name)"
}

let things: [Any] = [
    0, "Swift", (1.5, -2.0),
    Book(title: "The Da Vinci Code", author: "Dan Brown"),
    hello,
    { (name: String) -> String in "Ciao, \(name)" },
    (title: "The Da Vinci Code", author: "Dan Brown")
]

for thing in things {
    switch thing {
    case let i as Int:
        print("an integer: \(i)")
    case let s as String:
        print("a string: \"\(s)\"")
    case let (x, y) as (Double, Double):
        print("a point at (\(x), \(y))")
    case let book as Book:
        print("a book: \(book.title) by \(book.author)")
    case let f as (String) -> String:
        print("a closure:", f("Swift"))
    default:
        print("something else", thing)
    }
}



