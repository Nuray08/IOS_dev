//MEDIUM TASKS
//1. Set Intersection:Create two sets of integers. The first set contains the numbers [1, 2, 3, 4] and the second
//set contains [3, 4, 5, 6]. Find and print the intersection of the two sets.

var firstSet: Set<Int> = [1, 2, 3, 4]
var secondSet: Set<Int> = [3, 4, 5, 6]
var intersection = firstSet.intersection(secondSet)
print(intersection)


//2. Dictionary Update:Create a dictionary with three student names as keys and their scores as values.
// Update the score of one student and print the updated dictionary.
var studentScores = ["Aruna": 99, "Nazerke": 88, "Ayaulym": 77]
studentScores["Nazerke"] = 90
print(studentScores)



//3. Array Merge: You have two arrays: one contains [“apple”, “banana”] and the other contains [“cherry”,“date”].
// Merge the two arrays into one and print the result.
var firstArray = ["apple", "banana"]
var secondArray = ["cherry","date"]
var mergedArray = firstArray + secondArray
print(mergedArray)

