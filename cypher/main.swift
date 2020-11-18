//
//  main.swift
//  cypher
//
//  Created by Manuel Carvalho on 18/11/20.
//

import Foundation
import Cocoa

print("Hello, World!")

print(readFile())


func readFile() -> String {
   var text = ""
    do {
        text =  try String(contentsOfFile:"/Users/manuelcarvalho/Documents/cypher.txt")
    } catch {
        print("Unexpected error: \(error).")
    }
    return text
}





