// =============================================================
//  Station ALMA-7: Rescue Protocol
//  iOS Mobile Development · Module 3 · Lab Assignment
//
//  How to use:
//   • Xcode: File → New → Playground → Blank, replace everything
//     with this file's contents.
//   • Terminal: swift ALMA7_Starter.swift
//
//  Rules:
//   • Do NOT modify the STARTER CODE section.
//   • `!` (force unwrap) is forbidden: −0.5 points each.
//   • No map / filter / reduce / compactMap.
//   • Use the exact function names from the assignment PDF.
// =============================================================


// MARK: - =================== STARTER CODE ===================
// MARK: - Do not modify anything in this section

typealias Reading = (sensor: String, value: Int)

/// Splits a string at the first occurrence of the separator.
/// splitOnce("O2:87", by: ":") -> ("O2", "87")
/// splitOnce("hello", by: ":") -> nil
func splitOnce(_ line: String, by separator: Character) -> (String, String)? {
    guard let index = line.firstIndex(of: separator) else { return nil }
    let left = String(line[..<index])
    let right = String(line[line.index(after: index)...])
    return (left, right)
}

let rawLog = [
    "O2:87", "TEMP:-12", "O2:9x", "PRESS:101", "TEMP:abc", "O2:",
    "RAD:3", "O2:64", ":55", "TEMP:31", "PRESS:98", "O2:71",
    "RAD:-1", "TEMP:4", "PRESS:1o2", "O2:90"
]

class Tank {
    var level: Int
    init(level: Int) { self.level = level }
}

class Module {
    let name: String
    var oxygenTank: Tank?
    init(name: String, oxygenTank: Tank?) {
        self.name = name
        self.oxygenTank = oxygenTank
    }
}

class CrewMember {
    let name: String
    let role: String
    let priority: Int      // 1 = evacuated first
    var module: Module?    // nil = in open space
    init(name: String, role: String, priority: Int, module: Module?) {
        self.name = name
        self.role = role
        self.priority = priority
        self.module = module
    }
}

let lab  = Module(name: "Lab",  oxygenTank: Tank(level: 40))
let hab  = Module(name: "Hab",  oxygenTank: Tank(level: 12))
let dock = Module(name: "Dock", oxygenTank: nil)

let crew = [
    CrewMember(name: "Timur",   role: "Engineer",  priority: 3, module: lab),
    CrewMember(name: "Dana",    role: "Scientist", priority: 4, module: dock),
    CrewMember(name: "Aigerim", role: "Commander", priority: 1, module: hab),
    CrewMember(name: "Nurlan",  role: "Pilot",     priority: 2, module: nil)
]

var roster: [String: CrewMember] = [:]
for member in crew { roster[member.name] = member }

print("ALMA-7 systems online: \(rawLog.count) log lines, \(crew.count) crew members.")

// MARK: - ================= END OF STARTER CODE =================


// MARK: - =================== YOUR SOLUTION ===================
// Uncomment each signature when you start working on it.


// MARK: Level 1 · Decoding Telemetry

// 1.1

func parseReading(_ raw: String) -> Reading? {
    guard let (sensor, value) = splitOnce(raw, by: ":"),
          sensor.isEmpty == false,
          let value = Int(value),
          value >= 0 || sensor == "TEMP"
    else {
        return nil
    }
    return (sensor,value)
}

/*
 print(parseReading("O2:87")as Any)
print(parseReading("TEMP:-12")as Any)
print(parseReading("RAD:-1")as Any)
print(parseReading(":55")as Any)
print("")
*/

// 1.2
func parseLog(_ lines: [String]) -> (valid: [Reading], invalidCount: Int) {
    var valid: [Reading] = []
    var invalidCount = 0
    for line in lines {
        if let reading = parseReading(line) {
            valid.append(reading)
        } else {
            invalidCount += 1
        }
    }
    return (valid, invalidCount)
}

let parsed = parseLog(rawLog)
let A = parsed.invalidCount

/*
 print("valid: \(parsed.valid) , invalid: \(A)")
print("")
print (parseLog(["RAD:-1", "TEMP:4", "PRESS:1o2", "O2:90"]))
*/




// MARK: Level 2 · Analysis

// 2.1
func select(_ readings: [Reading], where isIncluded: (Reading) -> Bool) -> [Reading] {
    var selected: [Reading] = []
    for reading in readings {
        if isIncluded(reading) {
            selected.append(reading)
        }
    }
    return selected
}

func values(of readings: [Reading]) -> [Int] {
    var result: [Int] = []
    for reading in readings {
        result.append(reading.value)
    }
    return result
}

let o2Readings = select(parsed.valid) { $0.sensor == "O2" }
let o2Values = values(of: o2Readings)

/*
 print(o2Readings)
print(" ")
print(o2Values)
*/

// 2.2
func stats(of values: [Int]) -> (min: Int, max: Int, average: Double)? {
    guard values.isEmpty == false else {
        return nil
    }
    
    var minValue = values[0]
    var maxValue = values[0]
    var sum = 0
    
    for value in values {
        if value < minValue {
            minValue = value
        }
        if value > maxValue {
            maxValue = value
        }
        
        sum += value
    }
    
    let average = Double(sum) / Double(values.count)
    return (min: minValue, max: maxValue, average: average)
}


func stats(_ values: Int...) -> (min: Int, max: Int, average: Double)? {
    stats(of: values)
}



let o2Stats = stats(of: o2Values)
let B = Int(o2Stats?.average ?? 0)

/*
print(stats(3, 8, 1) as Any) //checked
print(stats() as Any)
print(B)
*/

// 2.3 · The Closure Ladder (5 sorts, then compare results in code)
// 1. Full closure syntax with types and return
let sort1 = parsed.valid.sorted(by: { (a: Reading , b: Reading) -> Bool in
    return a.value > b.value
})

// 2. Types inferred from context
let sort2 = parsed.valid.sorted(by: {a , b in
    return a.value > b.value
})

// 3. Implicit return
let sort3 = parsed.valid.sorted(by: {a, b in
    return a.value > b.value
})

// 4. Shorthand argument names $0 , $1
let sort4 = parsed.valid.sorted(by: { $0.value > $1.value })
                                
// 5. Trailing closure
let sort5 = parsed.valid.sorted { $0.value > $1.value}

let values1 = values(of: sort1)
let values2 = values(of: sort2)
let values3 = values(of: sort3)
let values4 = values(of: sort4)
let values5 = values(of: sort5)

let allMatch = (values1 == values2) && (values2 == values3) && (values3 == values4) && (values4 == values5)

print("all fives are equal: \(allMatch)")

// MARK: Level 3 · Temperature Stabilization

// 3.1
func heatUp(_ t: Int) -> Int {
    return t + 5
}

func coolDown(_ t: Int) -> Int {
    return t - 3
}

func hold(_ t: Int) -> Int {
    return t
}

func chooseProtocol(for temp: Int) -> (Int) -> Int {
    if temp < 18 {
        return heatUp
    }else if temp > 24 {
        return coolDown
    }else {
        return hold
    }
}
/*
print(chooseProtocol(for: 13)(13))
print(chooseProtocol(for: 23)(23))
print(chooseProtocol(for: 28)(28))
*/

// 3.2
func runUntilStable(from start: Int, maxSteps: Int = 10) -> (finalTemp: Int, steps: Int, isStable: Bool) {
    var currentTemp = start
    var steps = 0
    
    
    while (currentTemp < 18 || currentTemp > 24) && steps < maxSteps {
        currentTemp = chooseProtocol(for: currentTemp)(currentTemp)
        steps += 1
    }
    
    
    let isStable = currentTemp >= 18 && currentTemp <= 24
    return (currentTemp, steps, isStable)
}

let tempReading = select(parsed.valid) {$0.sensor == "TEMP"}

let tempValues = values(of: tempReading)
let minTemp = stats(of: tempValues)?.min ?? 0


let C = runUntilStable(from: minTemp).steps


print("C:", C)
print(runUntilStable(from: 30) as Any)
print(runUntilStable(from: -67, maxSteps: 7) as Any)


// MARK: Level 4 · The Crew

// 4.1
func oxygenLevel(of member: CrewMember) -> Int? {
    member.module?.oxygenTank?.level
}
print(oxygenLevel(of: crew[1]) as Any)
print(oxygenLevel(of: crew[2]) as Any)

// 4.2
// MARK: Task 4.2 — status(of:)

func status(of member: CrewMember) -> String {
    guard let module = member.module else {
        return "\(member.name): no data (open space)"
    }
    
    guard let level = oxygenLevel(of: member) else {
        return "\(member.name): no data (\(module.name))"
    }
    
    if level < 20 {
        return "\(member.name): \(level)% CRITICAL"
    } else {
        return "\(member.name): \(level)% OK"
    }
}

for member in roster.values {
    print(status(of: member))
}

// 4.3
@discardableResult
func transferOxygen(from source: inout Int, to target: inout Int, amount: Int) -> Int {
    guard amount > 0 else {
        return 0
    }
    let freeSpace = 100 - target
    
    var actualTransfer = amount
    if actualTransfer > source {actualTransfer = source}
    if actualTransfer > freeSpace { actualTransfer = freeSpace}
    
    source -= actualTransfer
    target += actualTransfer
    
    return actualTransfer
    
    
}

if let labTank = lab.oxygenTank,
   let habTank = hab.oxygenTank {
    
    transferOxygen(from: &labTank.level, to: &habTank.level, amount: 30)
}

let D = hab.oxygenTank?.level ?? 0
print("D:",D)

// 4.4
func evacuationOrder(_ names: String..., roster: [String: CrewMember]) -> [String] {
    var foundMembers: [CrewMember] = []
    
    for name in names{
        guard let member = roster[name] else {
            print("unknown member name: \(name)")
            continue
        }
        foundMembers.append(member)
    }
    
    foundMembers.sort {$0.priority < $1.priority}
    
    var resultNames: [String] = []
    for member in foundMembers {
        resultNames.append(member.name)
    }
    return resultNames
}



print(evacuationOrder("Dana", "Ghost", "Timur", "Aigerim", roster:roster))



// MARK: Level 5 · The Saboteur's Logbook
// The saboteur's code is below, commented out (it needs your
// oxygenLevel(of:) to compile). Comment on every problem, then
// write fixed versions and a test that proves the logic bug is gone.


/*
 func reportOxygen(for member: CrewMember) -> String {
    let tank = member.module!.oxygenTank!
    return "\(member.name): \(tank.level)%"
}

func firstCritical(in crew: [CrewMember]) -> String {
    var result: String?
    for member in crew {
        if oxygenLevel(of: member)! < 20 {
            result = member.name
        }
    }
    return result!
}

print(reportOxygen(for: crew[1]))
 */


/*
!!!!!! 1 problem:
member.module! crashes if crew has no module (Nurlan - his module id nill)
!!!!!! 2 problem:
.oxygenTank! crashes if the module has no tank (dock)
*/
 
 
//decision:

 func reportOxygen(for member: CrewMember) -> String {
     guard let level = oxygenLevel(of: member) else {
         return "\(member.name): no data"
     }
     return "\(member.name): \(level)%"
 }

 print(reportOxygen(for: crew[2]))
 print(reportOxygen(for: crew[3]))

 
/*
3 problem: oxygenLevel(of: member)! crashes whenever oxygenLevel
returns nil (same cases as above — no module, or module with no tank).
 
4 problem: return result! crashes if no one in crew is critical
(result stays nil the whole loop).

5 problem: the loop never stops after
finding a critical member — it keeps overwriting `result` on every
match. So if several crew members are critical, the function
returns the LAST one found, not the FIRST — despite being named
"firstCritical". This doesn't show up on the starter data because
only one crew member (Aigerim) is critical there.
 
Fixed by returning immediately inside the loop on the first match,
and returning String? (nil when no one is critical) instead of
force-unwrapping an empty result.
*/


 func firstCritical(in crew: [CrewMember]) -> String? {
    for member in crew {
        if let level = oxygenLevel(of: member) , level < 20 {
            return member.name
        }
    }
    return nil
}

let criticalTank1 = Tank(level: 25)
let criticalTank2 = Tank(level: 10)
let criticalModule1 = Module(name: "Test1", oxygenTank: criticalTank1)
let criticalModule2 = Module(name: "Test2", oxygenTank: criticalTank2)

let testCrew = [
    CrewMember(name: "First", role: "Test", priority: 1, module: criticalModule1),
    CrewMember(name: "Second", role: "Test", priority: 2, module: criticalModule2)
]

print(firstCritical(in: testCrew) as Any)






// MARK: Finale · Launch Code

let launchCode = "\(A)-\(B)-\(C)-\(D)"
print("LAUNCH CODE: \(launchCode)")


// MARK: Bonus

func makeAlarm(threshold: Int) -> (Int) -> Bool {
    var count = 0
    return { level in
        if level < threshold {
            count += 1
            print("Alarm #\(count)")
            return true
        }
        return false
    }
}

let alarm = makeAlarm(threshold: 20)
print(alarm(12))
print(alarm(25))
print(alarm(15))
print(alarm(18))



// MARK: - ================= DEFENSE QUESTIONS =================
/*
1. guard let vs if let beyond syntax:
    With `if let`, the unwrapped value exists only inside its own curly braces.
    With `guard let`, the value stays available for the rest of the function after
    the guard, and the `else` block must exit the scope (return, continue, break,
    fatalError). This way the "bad" cases are rejected right away and the main logic
    stays at one indentation level.
    `if let` makes code noticeably worse when there are several optionals in a row,
    because it creates a "pyramid of doom":

        func area(_ w: String, _ h: String) -> Int? {
            if let width = Int(w) {
                if let height = Int(h) {
                    if width > 0 && height > 0 {
                        return width * height
                    }
                }
            }
            return nil
        }

    With `guard let` the same code is flat:

        func area(_ w: String, _ h: String) -> Int? {
            guard let width = Int(w), let height = Int(h), width > 0, height > 0 else { return nil }
            return width * height
        }

2. Why can't you pass [Int] to stats(_ values: Int...)?
    A variadic parameter expects separate Int values separated by commas at the call
    site: stats(1, 2, 3). An [Int] array is a different type, not a list of separate
    Ints. Inside the function `Int...` is turned into [Int], but from the outside Swift
    cannot "spread" an array into an argument list. That is why there is a separate
    function stats(of: someArray). We made two versions for exactly this reason: the
    variadic one simply calls the array version.
3. Why doesn't transferOxygen(from: &x, to: &x, amount: 5) compile?
    It violates Swift's exclusive access rule: the same variable x is passed to two
    inout parameters, so two writers would access the same memory at the same time
    (an "overlapping accesses" error). The bug it prevents: the source and the target
    would be the same tank, and when the function finishes, both inout values are
    written back to x in an undefined order, so oxygen could be lost or duplicated.
    The compiler forbids this in advance.

4. Why doesn't oxygenLevel(of: dana) ?? "no data" compile?
    oxygenLevel returns Int?. The ?? operator requires the right-hand side to have the
    type stored inside the optional, which is Int. "no data" is a String, so the types
    do not match.
    Solutions: oxygenLevel(of: dana) ?? 0, or use guard let / if let, as in status(of:):
        if let level = oxygenLevel(of: dana) { print(level) } else { print("no data") }

5. Full type of chooseProtocol and how to read it:
    chooseProtocol(for:) has the type  (Int) -> (Int) -> Int
    Read it as: "a function that takes an Int (the temperature) and returns a function,
    which takes an Int and returns an Int". The arrow is right-associative, so this is
    the same as (Int) -> ((Int) -> Int). That is why chooseProtocol(for: 10)(10) is two
    calls in a row: first we choose a function (heatUp), then we apply it to 10 and get 15.

Bonus. Where does the alarm counter live after makeAlarm returns?
    The variable `count` is local to makeAlarm, but the returned closure uses it, so
    Swift "captures" it: it moves the variable from the stack to the heap, into a box
    owned by the closure. As long as `alarm` is alive, the box with `count` is alive too.
    Each call to makeAlarm creates a new box, so different alarms have separate counters.
*/
