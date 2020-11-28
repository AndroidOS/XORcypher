//
//  main.swift
//  cypher
//
//  Created by Manuel Carvalho on 18/11/20.
// git Added menu (1)

import Foundation
import Cocoa


//let raw = readFile(str: "cypher.txt")
//let nums = splitString(str: raw)
let key = [101,120,112]
var text = ""
var nums = [Int]()
var choice = ""
var fileLoaded = false
var statFile = ""
while true {
    if fileLoaded {
        statFile = " - File is loaded"
    } else {
        statFile = " - File not loaded"
    }
    print("MENU" + statFile + "\n")
    print("1. Read text file")
    print("2. Decrypt file")
    print("3. Encrypt file")
    if fileLoaded {
        print("4. Read Buffer")
    }
    print("\n")
    print("Q to quit\n\n")
    
    print("Please Enter your choice", terminator: ".")
    choice = readLine() ?? ""
    if choice.lowercased() == "q" {
        break
    }
    if choice == "1" {
        text = readFile()
        createNumArray()
        //print(text)
    }
    if fileLoaded && choice == "3" {
        encrypting()
        printArray()
    } else {
        print("File not loaded")
    }
    if choice == "4" {
        
        print(text)
        print(nums)
    }
    print(choice)
    print("Your choice is \(choice).")
    
}


//let nums = encrypting(key: [101,120,112])
//print(nums)
//decrypting2(nums: nums)

func encrypting(){
    var index = 0
    var xorNums = [Int]()
   
    for n in nums {
        let num = n ^ key[index]
        index += 1
        if index > 2 {
            index = 0
        }
        xorNums.append(num)
        
    }
   nums = xorNums
}

func printArray() {
    var str = ""
    for n in nums {
        let u = UnicodeScalar(n)
        let char = Character(u ?? "?")
        str.append(char)
    }
    print(str)
}

func decrypting2(nums: [Int]){
    let a = 101
    let b = 120
    let c = 112
    let clear_text = decypher(num: nums, key: [a,b,c])
    print(clear_text)
}


func decrypting(){
    
    let str = readFile()
    let nums = splitString(str: str)

    print("Decrypting ....\n")

    for a in 97...122 {
        for b in 97...122 {
            for c in 97...122 {
            
            
                let clear_text = decypher(num: nums, key: [a,b,c])
                if englishTest(str: clear_text){
                    print(clear_text)
                    print("key: \(a) \(b) \(c)")
                }
            }
        }
        
    }
}

print("\n\nEnd decrypting")

func englishTest(str: String) -> Bool{
    
    if str.contains(" the "){
        return true
    }

    return false
}

func decypher(num: [Int], key:[Int]) -> String{
    //let key = [101,120,112]
    var a = ""
    var index = 0
    for n in num {
        let ch = n ^ key[index]
        let u = UnicodeScalar(ch)
        let char = Character(u ?? "?")
        a.append(char)
        index += 1
        if index > 2 {
            index = 0
        }
    }
   
    return a
}



func splitString(str:String) -> [Int] {
    var numsArray = [Int]()
    let nums = str.split(separator: ",")
    for i in nums {
        guard let n = Int(i) else { return [Int]() }
        numsArray.append(n)
    }
    return numsArray
}


func readFile() -> String {
    print("Enter name of file")
    choice = readLine() ?? ""
       var text = ""
        do {
            text =  try String(contentsOfFile:"/Users/manuelcarvalho/Documents/" + choice)
        } catch {
            print("Unexpected error: \(error).")
            fileLoaded = false
            return ""
        }
        fileLoaded = true
        return text
}

func createNumArray() {
    for ch in text {
        let n = ch.asciiValue
        nums.append(n)
    }
}


extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}


