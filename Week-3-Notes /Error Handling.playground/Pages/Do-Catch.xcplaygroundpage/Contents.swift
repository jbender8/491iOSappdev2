//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


enum Mistake : Error {
    case m01, m02
}

enum Blunder : Error {
    case b01, b02
}

print("=== Mistakes and Blunders: Test 1 ===")

for i in 0 ... 4 {
    do {
        // ...
        switch i {
        case 1: throw Mistake.m01
        case 2: throw Mistake.m02
        case 3: throw Blunder.b01
        case 4: throw Blunder.b02
        default: print("Nothing happens")
        }
        // ...
    } catch {
        print("Caught some error with a generic catch")
    }
}

print("=== Mistakes and Blunders: Test 2 ===")

for i in 0 ... 4 {
    do {
        // ...
        switch i {
        case 1: throw Mistake.m01
        case 2: throw Mistake.m02
        case 3: throw Blunder.b01
        case 4: throw Blunder.b02
        default: print("Nothing happens")
        }
        // ...
    } catch is Blunder {
        print("Caught a Blunder")
    } catch is Mistake {
        print("Caught a Mistake")
    }
}


print("=== Mistakes and Blunders: Test 3 ===")

for i in 0 ... 4 {
    do {
        // ...
        switch i {
        case 1: throw Mistake.m01
        case 2: throw Mistake.m02
        case 3: throw Blunder.b01
        case 4: throw Blunder.b02
        default: print("Nothing happens")
        }
        // ...
    } catch Mistake.m01 {
        print("Caught a Mistake.m01")
    } catch Mistake.m02 {
        print("Caught a Mistake.m02")
    } catch Blunder.b01 {
        print("Caught a Blunder.b01")
    } catch Blunder.b02 {
        print("Caught a Blunder.b02")
    }
}

print("=== Mistakes and Blunders: Test 4a ===")

for i in 0 ... 4 {
    do {
        
        print("start: \(i)")
        // ...
        switch i {
        case 1: throw Mistake.m01
        case 2: throw Mistake.m02
        case 3: throw Blunder.b01
        case 4: throw Blunder.b02
        default: print("Nothing happens")
        }
        // ...
        print("end: \(i)")
    } catch Mistake.m01 {
        print("Caught a Mistake.m01")
    } catch Mistake.m02 {
        print("Caught a Mistake.m02")
    } catch Blunder.b01 {
        print("Caught a Blunder.b01")
    } catch Blunder.b02 {
        print("Caught a Blunder.b02")
    }
}

print("=== Mistakes and Blunders: Test 4b ===")

for i in 0 ... 4 {
    do {
        defer {
            print("finish: \(i)")
        }
        
        print("start: \(i)")
        
        // ...
        switch i {
        case 1: throw Mistake.m01
        case 2: throw Mistake.m02
        case 3: throw Blunder.b01
        case 4: throw Blunder.b02
        default: print("Nothing happens")
        }
        // ...
        print("end: \(i)")
    } catch Mistake.m01 {
        print("Caught a Mistake.m01")
    } catch Mistake.m02 {
        print("Caught a Mistake.m02")
    } catch Blunder.b01 {
        print("Caught a Blunder.b01")
    } catch Blunder.b02 {
        print("Caught a Blunder.b02")
    }
}




print("=== Mistakes and Blunders: Test 5 ===")

// for NSError
let domain = "www.mydomain.com"
enum ErrorCode : Int {
    case overflow = 1, outOfRange, divideByZero
}

for i in 0 ... 5 {
    do {
        // ...
        switch i {
        case 1: throw Mistake.m01
        case 2: throw Mistake.m02
        case 3: throw Blunder.b01
        case 4: throw Blunder.b02
        case 5: throw NSError(domain: domain, code: ErrorCode.divideByZero.rawValue, userInfo: [ "function" : #function, "file" : #file, "line" : #line, "column": #column ])
        default: print("Nothing happens")
        }
        // ...
    } catch let error as Blunder {
        print("Caught a Blunder: \(error)")
    } catch let error as Mistake {
        print("Caught a Mistake: \(error)")
    } catch let error as NSError {
        print(error.localizedDescription)
        print(error.userInfo)
    }
}


enum SystemError : Error {
    case FatalError(cause: String)
    case Warning(reason: String, severity: Int)
    case Info(message: String)
    case UnknownError
}

print("=== System Errors: Test 1 ===")

for i in 0 ... 6 {
    do {
        // ...
        switch i {
        case 1: throw SystemError.FatalError(cause: "Memory exhausted!")
        case 2: throw SystemError.Warning(reason: "Battery Low", severity: 2)
        case 3: throw SystemError.Warning(reason: "Battery Low", severity: 10)
        case 4: throw SystemError.Info(message: "Wifi unavailable")
        case 5: throw SystemError.UnknownError
        default: print("Nothing happens")
        }
        // ...
    } catch SystemError.FatalError(let cause) {
        print("Caught a SystemError.FatalError with cause: \(cause)")
    } catch SystemError.Warning(let reason, let severity) where severity > 8 {
        print("Caught a SystemError.Warning with reason: \(reason) and severity level: \(severity)")
        print("!!! This is really serious!")
    } catch SystemError.Warning(let reason, let severity) {
        print("Caught a SystemError.Warning with reason: \(reason) and severity level: \(severity)")
    } catch SystemError.Info(let message) {
        print("Caught a SystemError.Info with message: \(message)")
    } catch SystemError.UnknownError {
        print("Caught a SystemError.UnknownError")
    }
}

//: [Next](@next)
