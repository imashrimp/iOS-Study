protocol CanFly {
    func fly()
}

class  Bird {
    
    var female = true
    
    func layEggs()  {
        if female {
            print("New baby birds in a shell.")
        }
    }
}

class Eagle: Bird, CanFly  {
    func fly() {
        print("Eagle can fly with its wings.")
    }
    
    
    func soar() {
        print("Eagle can glide.")
    }
}

class Penguin: Bird {
    func swim() {
        print("Penguins can swim. ")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly ) {
        flyingObject.fly()
    }
}
 
struct AirPlane: CanFly {
    func fly() {
        print("Airplane can fly with its engine.")
    }
    
     
}

 let myEagle = Eagle()
let myPenguin = Penguin()
let myPlane = AirPlane()


let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myPlane)
