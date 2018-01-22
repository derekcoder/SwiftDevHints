//
//  SortDescriptorTests.swift
//  SwiftDevHintsTests
//
//  Created by Derek on 22/1/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class SortDescriptorTests: XCTestCase {
    final class Person: Equatable {
        var first: String
        var last: String
        var yearOfBirth: Int
        
        init(first: String, last: String, yearOfBirth: Int) {
            self.first = first
            self.last = last
            self.yearOfBirth = yearOfBirth
        }
        
        static func ==(lhs: Person, rhs: Person) -> Bool {
            return (lhs.first == rhs.first) && (lhs.last == rhs.last) && (lhs.yearOfBirth == rhs.yearOfBirth)
        }
    }
    
    let person1 = Person(first: "Jo", last: "Smith", yearOfBirth: 1970)
    let person2 = Person(first: "Joanne", last: "Williams", yearOfBirth: 1985)
    let person3 = Person(first: "Annie", last: "Williams", yearOfBirth: 1985)
    let person4 = Person(first: "Robert", last: "Jones", yearOfBirth: 1990)
    
    func testLastName() {
        let people = [person1, person2, person4]
        let lastName: SortDescriptor<Person> = sortDescriptor(property: {$0.last }, comparator: String.localizedCaseInsensitiveCompare)
        XCTAssertEqual(people.sorted(by: lastName), [person4, person1, person2])
    }
    
    func testYearOfBirth() {
        let people = [person1, person2, person4]
        let yearOfBirth: SortDescriptor<Person> = sortDescriptor { $0.yearOfBirth }
        XCTAssertEqual(people.sorted(by: yearOfBirth), [person1, person2, person4])
    }
    
    func testLastNameAndFirstName() {
        let people = [person1, person2, person3, person4]
        let lastName: SortDescriptor<Person> = sortDescriptor(property: {$0.last }, comparator: String.localizedCaseInsensitiveCompare)
        let firstName: SortDescriptor<Person> = sortDescriptor(property: {$0.first }, comparator: String.localizedCaseInsensitiveCompare)
        XCTAssertEqual(people.sorted(by: combine(sortDescriptors: [lastName, firstName])), [person4, person1, person3, person2])
    }
    
    func testYearOfBirthAndLastNameAndFirstName() {
        let people = [person1, person2, person3, person4]
        let yearOfBirth: SortDescriptor<Person> = sortDescriptor { $0.yearOfBirth }
        let lastName: SortDescriptor<Person> = sortDescriptor(property: {$0.last }, comparator: String.localizedCaseInsensitiveCompare)
        let firstName: SortDescriptor<Person> = sortDescriptor(property: {$0.first }, comparator: String.localizedCaseInsensitiveCompare)
        XCTAssertEqual(people.sorted(by: combine(sortDescriptors: [yearOfBirth, lastName, firstName])), [person1, person3, person2, person4])
    }
}
