//
//  main.swift
//  cypher
//
//  Created by Manuel Carvalho on 18/11/20.
//

import Foundation
import Cocoa


decrypting()

func encrypting(){
    let str = readFile(str: "cypher.txt")
    
}


func decrypting(){
    
    let str = readFile(str: "cypher.txt")
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


func readFile(str: String) -> String {
   var text = ""
    do {
        text =  try String(contentsOfFile:"/Users/manuelcarvalho/Documents/" + str)
    } catch {
        print("Unexpected error: \(error).")
    }
    return text
}





