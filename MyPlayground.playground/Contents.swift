import Cocoa

func foo(_ a: Int) -> Int
{
    print("a is \(a)")
    
    return a + 1
}

func bar() -> (_: Int) -> Int
{
    func ack(_ a: Int) -> Int
    {
        return a + 2
    }
    
    return { (_ a: Int) -> Int  in
        return a + 100
    }
}

let baz = bar()

let b = baz(4)

print("b is \(b)")
