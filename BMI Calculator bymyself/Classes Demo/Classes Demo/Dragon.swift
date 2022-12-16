
class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speech: String) {
        print("Says \(speech)")
    }
    
    override func move() {
        print("Fly forwards")
    }
    
    override func attack() {
//        super.은 superclass의 method를 실행하기 위함이다.
        super.attack()
        print("Spits fire, does 10 damage")
    }
    
}
 
