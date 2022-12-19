
struct MyOptional {
    var property = 123
    func method() {
        print("I'm the struct's method.")
    }
}

let myOptional: MyOptional?

myOptional = nil

print(myOptional?.property)
print(myOptional?.method() )
