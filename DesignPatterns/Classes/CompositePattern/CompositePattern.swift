//
//  CompositePattern.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/7/18.
//

import Foundation

/// 创建 Employee 类，该类带有 Employee 对象的列表。
public class Employee {
    
    public var id: String
    public var name: String
    public var dept: String
    public var salary: Int
    public var subordinates: [Employee]!
    
    // subordinates: [səˈbɔ:dnits] n. 部属；（subordinate的复数） adj. 下级的；从属的；次要的
    public init(id: String, name: String, dept: String, salary: Int) {
        self.id = id
        self.name = name
        self.dept = dept
        self.salary = salary
        self.subordinates = [Employee]()
    }
    
    public func add(_ employee: Employee) {
        subordinates.append(employee)
    }
    
    public func remove(_ employee: Employee) {
        subordinates.removeAll {
            $0.id == employee.id
        }
    }
    
    private var currDateString: String {
        let df = DateFormatter()
        df.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return df.string(from: Date())
    }
    
    public var description: String {
        return "\(currDateString) Employee: [id: \(id) name: \(name) dept: \(dept) salary: \(salary)]"
    }
    
}

/// 使用 Employee 类来创建和打印员工的层次结构。
public class CompositePatternDemo {
    
    public static func main() {
        let ceo = Employee(id: "001", name: "John", dept: "CEO", salary: 30000)
        
        let headSales = Employee(id: "100", name: "Robert", dept: "Head Sales", salary: 20000)
        let salesExecutive1 = Employee(id: "101", name: "Richard", dept: "Sales", salary: 10000)
        let salesExecutive2 = Employee(id: "102", name: "Rob", dept: "Sales", salary: 10000)
        headSales.add(salesExecutive1)
        headSales.add(salesExecutive2)
        ceo.add(headSales)
        
        let headMarketing = Employee(id: "200", name: "Michel", dept: "Head Marketing", salary: 2000)
        let clerk1 = Employee(id: "201", name: "Michel", dept: "Marketing", salary: 10000)
        let clerk2 = Employee(id: "202", name: "Bob", dept: "Marketing", salary: 10000)
        headMarketing.add(clerk1)
        headMarketing.add(clerk2)
        ceo.add(headMarketing)
        
        print(ceo.description)
        for headEe in ceo.subordinates {
            print(headEe.description)
            for ee in headEe.subordinates {
                print(ee.description)
            }
        }
    }
    
}

//Output result:
//2023:07:20 17:29:39 Employee: [id: 001 name: John dept: CEO salary: 30000]
//2023:07:20 17:29:39 Employee: [id: 100 name: Robert dept: Head Sales salary: 20000]
//2023:07:20 17:29:39 Employee: [id: 101 name: Richard dept: Sales salary: 10000]
//2023:07:20 17:29:39 Employee: [id: 102 name: Rob dept: Sales salary: 10000]
//2023:07:20 17:29:39 Employee: [id: 200 name: Michel dept: Head Marketing salary: 2000]
//2023:07:20 17:29:39 Employee: [id: 201 name: Michel dept: Marketing salary: 10000]
//2023:07:20 17:29:39 Employee: [id: 202 name: Bob dept: Marketing salary: 10000]
