
struct Enemy {
    var health : Int
    var attackStrength : Int
    
    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
    
//    enemy가 데미지 입었을 때 
     mutating func takeDamage(amount: Int) {
        health = health - amount
    }
    
    func move() {
        print("Move forward")
    }
    
    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
