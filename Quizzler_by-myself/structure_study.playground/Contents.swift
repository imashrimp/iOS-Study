struct Town {
    /*
    these three things called properties and it means 'What it's like'
     and these are be called as dot noctation like myTown.citizen at out of the structure block
    let name = "Alexland"
    array
    var citizen = ["Alex", "Jenny"]
    dictionary = [key: value]
    var resources = ["Grain": 100, "Ore": 75, "Wool": 60]
    */
    
//    i just created a blank properties and i can customize the properties
    let name: String
    var citizen: [String]
    var resources: [String: Int]
    
    init(name: String, citizen: [String], resources: [String: Int ]) {
/*
 when i initialize name of the properties i should make the matched name to be different
 or by put the 'self' input과 parameter를 구별 할 수 있다
 */
        self.name = name
        self.citizen = citizen
        self.resources = resources
    }
    
//    define behavior, and when we have a function  associated with a structure we call it 'method'
//    and this method means 'What it can do '
    func fortify() {
        print("Defences increased")
    }
    
}
// we need to provide some values in each position(townName, people, stats)
var anotherTown = Town(name: "Nameless Island", citizen: ["Mathew Fraser"], resources: ["Squat": 225])
anotherTown.citizen.append("Tia Toomey ")
print(anotherTown.citizen )

var crossfitBox = Town(name: "Mad Monster", citizen: ["joosh", "baaam"], resources: ["barbell": 27 ])


/*
// initailizing: creating actual object we can use. and myTown is called as 'object '
var myTown = Town()
// just like let me access to the properties in Town
print(myTown.citizen)
print("\(myTown.name) has \(myTown.resources["Grain"]!) bag of grain.  ")

//add value and porperties
myTown.citizen.append("Mallory")
print(myTown.citizen.count)

//make myTown to do something
myTown.fortify()
*/
