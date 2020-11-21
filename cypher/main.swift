//
//  main.swift
//  cypher
//
//  Created by Manuel Carvalho on 18/11/20.
//

import Foundation
import Cocoa

let key = [101,120,112]

let str = readFile()
let nums = splitString(str: str)
let clear_text = decypher(num: nums)

print(nums)

func decypher(num: [Int]) -> String{
    let key = [101,120,112]
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
    print(a)
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
   var text = ""
    do {
        text =  try String(contentsOfFile:"/Users/manuelcarvalho/Documents/cypher.txt")
    } catch {
        print("Unexpected error: \(error).")
    }
    return text
}





