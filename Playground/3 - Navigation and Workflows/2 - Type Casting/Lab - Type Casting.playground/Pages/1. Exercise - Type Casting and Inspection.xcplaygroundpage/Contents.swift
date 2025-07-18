/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let someCollection: [Any] = [42, 3.14, "Hello, Swift!", true, 100, false, 2.718, "Yippee!!!"]

print("Contents of the collection:")
for item in someCollection {
    print(item)
}

//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in someCollection {
    if let intValue = item as? Int {
        print("The integer has a value of \(intValue)")
    } else if let doubleValue = item as? Double {
        print("The double has a value of \(doubleValue)")
    } else if let stringValue = item as? String {
        print("The string has a value of \"\(stringValue)\"")
    } else if let boolValue = item as? Bool {
        print("The boolean has a value of \(boolValue)")
    } else {
        print("Unknown type found.")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var someDictionary : [String : Any] = [ "First" : true , "Second" : false, "Third" : 2331 , "Fourth" : "Yayy" , "Fifth" : "K.O." , "Sixth" : 2.123123]


// Print key/value pairs
for (key, value) in someDictionary {
    print("\(key): \(value)")
}



//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total : Double = 0

for (_, value) in someDictionary {
    switch value {
    case let intValue as Int:
        total += Double(intValue)
    case let doubleValue as Double:
        total += doubleValue
    case is String:
        total += 1
    case let boolValue as Bool:
        total += boolValue ? 2 : -3
    default:
        break
    }
}

print("Total\t:\(total)")
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0.0

for (_, value) in someDictionary {
    switch value {
    case let intValue as Int:
        total2 += Double(intValue)
    case let doubleValue as Double:
        total2 += doubleValue
    case let stringValue as String:
        if let number = Double(stringValue) {
            total2 += number
        }
    default:
        // Ignore booleans and any other types
        break
    }
}

print("Total2: \(total2)")

/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
