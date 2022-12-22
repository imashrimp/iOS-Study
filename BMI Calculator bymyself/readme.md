#Flow

[CalculateViewController]에서
var calculatorBrain = CalculatorBrain()
이는 calculatorBrain이 struct인 CalculatorBrain에서 값을 받아온다는 의미이다.

[CalculatorBrain]의
var bmi = BMI?
BMI?는 [BMI]에서 struct인 BMI의 property 'value: String, advie: String, color: UIColor'를 받아온다는 의미이다.
그리고 
func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0 )
        return bmiTo1DecimalPlace
}
는 return인 getBMIValue를 받아낸다. 
이 getBMIValue는

[CalculateViewController]의
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }에서
destinationVC.bmiValue = calculatorBrain.getBMIValue()에 들어간다.
여기서 destinationVC는 let destinationVC = segue.destination as! ResultViewController로 인해
[ResultViewController]를 나타낸다.

그래서 destinationVC.bmiValue는 [ResultViewController]에 있는 bmiValue를 뜻한다.
이 bmiValue는 [ResultViewController]의 override func viewDidLoad() {}의 내부에서
bmiLabel.text = bmiValue에 쓰인다. bmiValue의 타입은 String?이다.

이 override func viewDidLoad() {}은 ResultViewController가 표현되는 스크린에서 bmi 수치가 표현되는 Label에 bmiValue의 값이 적용된다.  

[ResultViewController]의 property인 advice와, color도 bmiValue와 같은 과정으로 그 값을 받아와 스크린에 표현된다.



##그러면 여기서 bmiValue, advice, color가 받아오는 값은 무엇인가?
[CalculatorBrain]에서
    mutating func calculateBMI(height: Float, weight: Float ) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more!", color: UIColor.blue) 
        }else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        }else {
            bmi = BMI(value: bmiValue, advice: "Eat less!", color: UIColor.red)
        }
    }
bmiValue가 계산이 되고 계산에 사용되는 height, weight는
[CalculatorViewController]에서 
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value

        calculatorBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    } 에서 받아와
calculatorBrain.calculateBMI(height: height, weight: weight)로 실행되어
bmiValue, advice, color값을 받아 override func prepare {}에 의해
[ResultViewController]로 값이 넘어가 Result screen에 그 값이 표현된다.
