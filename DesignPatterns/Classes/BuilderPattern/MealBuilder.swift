//
//  MealBuilder.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/5/29.
//

import Foundation

/// Step1: 为颜色创建一个接口。
public protocol Packing {
    func pack() -> String
}

/// Step1: 为颜色创建一个接口。
public protocol Item {
    var name: String { get }
    func packing() -> Packing
    func price() -> Float
}

/// Step2: 创建实现 Packing 接口的实体类。
public class Wrapper: Packing {
    public func pack() -> String {
        return "Wrapper"
    }
}

public class Bottle: Packing {
    public func pack() -> String {
        return "Bottle"
    }
}

/// Step3: 创建实现 Item 接口的抽象类，该类提供了默认的功能。
public class AbstractBurger: Item {
    
    internal init() {
        assert(type(of: self) != AbstractBurger.self, "AbstractBurger::init error")
    }
    
    public var name: String {
        fatalError("AbstractBurger::name")
    }
    
    public func packing() -> Packing {
        return Wrapper()
    }
    
    public func price() -> Float {
        fatalError("AbstractBurger::price")
    }
    
}

public class AbstractColdDrink: Item {
    internal init() {
        assert(type(of: self) != AbstractColdDrink.self, "AbstractColdDrink::init error")
    }
    
    public var name: String {
        fatalError("AbstractColdDrink::name")
    }
    
    public func packing() -> Packing {
        return Bottle()
    }
    
    public func price() -> Float {
        fatalError("AbstractColdDrink::price")
    }
    
}

/// Step4: 创建扩展了 Burger 和 ColdDrink 的实体类。
public class VegBurger: AbstractBurger {
    
    public override var name: String {
        return "Veg Burger"
    }
    
    public override func price() -> Float {
        return 25
    }
}


public class ChickenBurger: AbstractBurger {
    
    public override var name: String {
        return "Chicken burger"
    }
    
    public override func price() -> Float {
        return 50
    }
}


public class Coke: AbstractColdDrink {
    
    public override var name: String {
        return "Coke"
    }
    
    public override func price() -> Float {
        return 30
    }
    
}

public class Pespi: AbstractColdDrink {
    
    public override var name: String {
        return "Pepsi"
    }
    
    public override func price() -> Float {
        return 35
    }
}

/// Step5: 创建一个 Meal 类，带有上面定义的 Item 对象。
public class Meal {
    
    private var items: [Item] = []
    
    public func add(item: Item) {
        items.append(item)
    }
    
    public func getCost() -> Float {
        var total: Float = 0
        items.forEach { item in
            total += item.price()
        }
        return total
    }
    
    public func showItems() {
        for item in items {
            print("name=\(item.name), price=\(item.price()), pack=\(item.packing().pack())")
        }
    }
    
}

/// Step6: 创建一个 MealBuilder 类，实际的 builder 类负责创建 Meal 对象。
public class MealBuilder {
    
    public static func prepareVegMeal() -> Meal {
        let meal = Meal()
        meal.add(item: VegBurger())
        meal.add(item: Coke())
        return meal
    }
    
    public static func prepareNonVegMeal() -> Meal {
        let meal = Meal()
        meal.add(item: ChickenBurger())
        meal.add(item: Pespi())
        return meal
    }
}

/// Step7: BuiderPatternDemo 使用 MealBuilder 来演示建造者模式（Builder Pattern）。
public class BuilderPatternDemo {
    
    public static func main() {
        let vegMeal = MealBuilder.prepareVegMeal()
        print("vegMeal: \(vegMeal)")
        vegMeal.showItems()
        print("Total cost: \(vegMeal.getCost())")
        
        let nonVegMeal = MealBuilder.prepareNonVegMeal()
        print("nonVegMeal: \(nonVegMeal)")
        nonVegMeal.showItems()
        print("Totoal cost: \(nonVegMeal.getCost())")
    }
    
}

//Output result:
//vegMeal: DesignPatterns.Meal
//name=Veg Burger, price=25.0, pack=Wrapper
//name=Coke, price=30.0, pack=Bottle
//Total cost: 55.0
//nonVegMeal: DesignPatterns.Meal
//name=Chicken burger, price=50.0, pack=Wrapper
//name=Pepsi, price=35.0, pack=Bottle
//Totoal cost: 85.0
