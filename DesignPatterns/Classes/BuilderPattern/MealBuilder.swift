//
//  MealBuilder.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/5/29.
//

import Foundation

//建造者模式
//建造者模式（Builder Pattern）使用多个简单的对象一步一步构建成一个复杂的对象。这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。
//
//一个 Builder 类会一步一步构造最终的对象。该 Builder 类是独立于其他对象的。
//
//介绍
//意图：将一个复杂的构建与其表示相分离，使得同样的构建过程可以创建不同的表示。
//主要解决：主要解决在软件系统中，有时候面临着"一个复杂对象"的创建工作，其通常由各个部分的子对象用一定的算法构成；由于需求的变化，这个复杂对象的各个部分经常面临着剧烈的变化，但是将它们组合在一起的算法却相对稳定。
//何时使用：一些基本部件不会变，而其组合经常变化的时候。
//如何解决：将变与不变分离开。
//关键代码：建造者：创建和提供实例，导演：管理建造出来的实例的依赖关系。
//应用实例： 1、去肯德基，汉堡、可乐、薯条、炸鸡翅等是不变的，而其组合是经常变化的，生成出所谓的"套餐"。 2、JAVA 中的 StringBuilder。
//优点： 1、建造者独立，易扩展。 2、便于控制细节风险。
//缺点： 1、产品必须有共同点，范围有限制。 2、如内部变化复杂，会有很多的建造类。
//使用场景： 1、需要生成的对象具有复杂的内部结构。 2、需要生成的对象内部属性本身相互依赖。
//注意事项：与工厂模式的区别是：建造者模式更加关注与零件装配的顺序。
//
//实现
//我们假设一个快餐店的商业案例，其中，一个典型的套餐可以是一个汉堡（Burger）和一杯冷饮（Cold drink）。汉堡（Burger）可以是素食汉堡（Veg Burger）或鸡肉汉堡（Chicken Burger），它们是包在纸盒中。冷饮（Cold drink）可以是可口可乐（coke）或百事可乐（pepsi），它们是装在瓶子中。
//
//我们将创建一个表示食物条目（比如汉堡和冷饮）的 Item 接口和实现 Item 接口的实体类，以及一个表示食物包装的 Packing 接口和实现 Packing 接口的实体类，汉堡是包在纸盒中，冷饮是装在瓶子中。
//
//然后我们创建一个 Meal 类，带有 Item 的 ArrayList 和一个通过结合 Item 来创建不同类型的 Meal 对象的 MealBuilder。BuilderPatternDemo 类使用 MealBuilder 来创建一个 Meal。

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
    
    public func exec() {
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
