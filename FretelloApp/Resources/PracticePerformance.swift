//
//  PracticePerformance.swift
//  FretelloApp
//
//  Created by Decagon on 13/06/2021.
//

import Foundation

 class maximumIncrease {
     func max(inputArr: [[Int]]) -> Int {
         var numArr = [Double]()
         var numAvg: Double = 0.0
         var maxNum: Double = 0.0
         var maxNums = [Double]()
         var averagePercent = [Int]()
         
         for i in 0..<inputArr.count {
             for _ in 0..<inputArr[i].count {
                 var sum = 0.0
                 for value in inputArr[i] {
                     sum += Double(value)
                 }
                 numAvg = sum / Double((inputArr[i].count))
             }
             numArr.append(numAvg)
         }
         
         for i in 1..<inputArr.count {
             for _ in 1..<inputArr[i].count {
                 maxNum = Double(inputArr[i].max() ?? 0)
             }
             maxNums.append(maxNum)
         }
         for i in 0..<maxNums.count {
             averagePercent.append(Int((maxNums[i] * 100) / numArr[i]))
         }
         let solution = averagePercent.max() ?? 0
         return solution
     }

 }
