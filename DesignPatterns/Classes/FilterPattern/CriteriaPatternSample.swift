//
//  CriteriaPatternSample.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/6/20.
//

import Foundation

public class Person {
    public let name: String
    public let gender: String
    public let maritalStatus: String
    
    public init(name: String, gender: String, maritalStatus: String) {
        self.name = name
        self.gender = gender
        self.maritalStatus = maritalStatus
    }
}

public protocol Criteria {
    
    func meetCriteria(persons: [Person]) -> [Person]
    
}

public class CriteriaMale: Criteria {
    
    public func meetCriteria(persons: [Person]) -> [Person] {
        var malePersons: [Person] = []
        for person in persons {
            if person.gender.uppercased() == "MALE" {
                malePersons.append(person)
            }
        }
        return malePersons
    }
    
}

public class CriteriaFemale: Criteria {
    
    public func meetCriteria(persons: [Person]) -> [Person] {
        var femalePersons = [Person]()
        for person in persons {
            if person.gender.uppercased() == "FEMALE" {
                femalePersons.append(person)
            }
        }
        return femalePersons
    }
    
}

public class CriteriaSingle: Criteria {
    
    public func meetCriteria(persons: [Person]) -> [Person] {
        var singlePersons = [Person]()
        for person in persons {
            if person.maritalStatus.uppercased() == "SINGLE" {
                singlePersons.append(person)
            }
        }
        return singlePersons
    }
    
}

public class AndCriteria: Criteria {
    
    let criteria: Criteria
    let otherCriteria: Criteria
    
    public init(_ criteria: Criteria, _ otherCriteria: Criteria) {
        self.criteria = criteria
        self.otherCriteria = otherCriteria
    }
    
    public func meetCriteria(persons: [Person]) -> [Person] {
        let firstCriteriaPersons = criteria.meetCriteria(persons: persons)
        return otherCriteria.meetCriteria(persons: firstCriteriaPersons)
    }
    
}

public class OrCriteria: Criteria {
    
    let criteria: Criteria
    let otherCriteria: Criteria
    
    public init(_ criteria: Criteria, _ otherCriteria: Criteria) {
        self.criteria = criteria
        self.otherCriteria = otherCriteria
    }
    
    public func meetCriteria(persons: [Person]) -> [Person] {
        var firstCriteriaPersons = criteria.meetCriteria(persons: persons)
        let otherCriteriaPersons = otherCriteria.meetCriteria(persons: persons)
//        for person in otherCriteriaPersons {
//            if !firstCriteriaPersons.contains(person) {
//                firstCriteriaPersons.append(person)
//            }
//        }
        return firstCriteriaPersons
    }
    
}

public struct CriteriaPatternDemo {
    
    public static func main() {
        
    }
    
}
