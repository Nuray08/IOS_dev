//HARD TASKS
//1. Dictionary Key Addition:Create a dictionary with names of countries as keys and their populations as values. Add
//a new country to the dictionary and print the updated dictionary.
var countryPopulation = ["Kazakhstan":20604819 ,"South Korea":51811000 ,"China": 1400000000]
countryPopulation["Japan"] = 125000000
print(countryPopulation)


//2. Set Union and Subtract:
//Create two sets. The first set contains [“cat”, “dog”], and the second set contains [“dog”,
//“mouse”]. Perform the union of these two sets, then subtract the second set from the result. Print the final set.
var firstSet: Set<String> = ["cat", "dog"]
var secondSet: Set<String> = ["dog", "mouse"]
var unitedSet = firstSet.union(secondSet)
print(unitedSet)

var finalSet = unitedSet.subtracting(secondSet)
print(finalSet)

//3. Nested Collection:
//Create a dictionary where each key is a student’s name, and the value is an array of the
//grades they received in diﬀerent subjects. Access and print the second grade for a specific student.
let studentGrades = ["Aruna": [90, 89, 79], "Arailym":[58, 85, 95], "Assem": [99, 48, 58], "Nuray": [77, 88, 99]]
print(studentGrades)
print(studentGrades["Nuray"]![1])
