//
//  Exercises.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 05/09/2022.
//

import Foundation


class AdditionalExercises {
    func generateFibonacci(n: Int) -> [Int] {
        var numbers: [Int] = [0,1]
        while numbers.count <= n {
            numbers.append(numbers[numbers.count - 1] + numbers[numbers.count - 2])
        }
        return numbers
    }
    
    func generatePrimeNumbers(endNumber: Int) -> [Int] {
        var primeNumbers: [Int] = []
        
        guard endNumber >= 2 else { return primeNumbers }
        let numbers = Array(2...endNumber)
        for number in numbers {
            var isPrime = true
            for i in 2..<number {
                if number % i == 0 {
                    isPrime = false
                    break
                }
            }
            if isPrime {
                primeNumbers.append(number)
            }
        }
        return primeNumbers
    }
}
