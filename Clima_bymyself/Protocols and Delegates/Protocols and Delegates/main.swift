 
protocol AdvancedLifeSupport {
    func performCPR()
}

// EmergencyCallHandler가 delegate를 property로 가짐으로 인해 누구든 자신을 delegate로 세팅하면 그는 AdvacedLifeSupport를 data type으로 가진다. var delegate: AdvancedLifeSupport?를 함으로 인해 delegate가 누구든 상관없이 EmergencyCallHandler는 performCPR을 하도록 할 수 있기 때문이다.
class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    
//    paramedic이 출근하면 가장 먼저 하는 것은  bleep를 몸에 차고 handler.delegate를 self로 설정하는 것이다.
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
    
     
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
    
    func useStethescope() {
        print("Listending for heart sounds.")
    }
    
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr... ")
    }
}

let emilio = EmergencyCallHandler()

// pete는 출근하자마자 handler가 누군지 알게된다. (handler: emilio)에 의해서
let alex = Surgeon(handler: emilio )

emilio.assessSituation()

/*
emilio가 이 메서드를 수행하면 paramedic은 performCPR()을 실행한다.
이는 init(handler: EmergencyCallHandler) {
handler.delegate = self
}
에 의해 paramedic이 delegate를 자신(self)으로 설정해 일어난다.
*/
emilio.medicalEmergency()
