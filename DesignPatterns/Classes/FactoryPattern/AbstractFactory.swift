//
//  AbstractFactory.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/5/22.
//

import Foundation

//抽象工厂模式
//抽象工厂模式（Abstract Factory Pattern）是围绕一个超级工厂创建其他工厂。该超级工厂又称为其他工厂的工厂。这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。
//
//在抽象工厂模式中，接口是负责创建一个相关对象的工厂，不需要显式指定它们的类。每个生成的工厂都能按照工厂模式提供对象。
//
//介绍
//意图：提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。
//
//主要解决：主要解决接口选择的问题。
//
//何时使用：系统的产品有多于一个的产品族，而系统只消费其中某一族的产品。
//
//如何解决：在一个产品族里面，定义多个产品。
//
//关键代码：在一个工厂里聚合多个同类产品。
//
//应用实例：工作了，为了参加一些聚会，肯定有两套或多套衣服吧，比如说有商务装（成套，一系列具体产品）、时尚装（成套，一系列具体产品），甚至对于一个家庭来说，可能有商务女装、商务男装、时尚女装、时尚男装，这些也都是成套的，即一系列具体产品。假设一种情况（现实中是不存在的，但有利于说明抽象工厂模式），在您的家中，某一个衣柜（具体工厂）只能存放某一种这样的衣服（成套，一系列具体产品），每次拿这种成套的衣服时也自然要从这个衣柜中取出了。用 OOP 的思想去理解，所有的衣柜（具体工厂）都是衣柜类的（抽象工厂）某一个，而每一件成套的衣服又包括具体的上衣（某一具体产品），裤子（某一具体产品），这些具体的上衣其实也都是上衣（抽象产品），具体的裤子也都是裤子（另一个抽象产品）。
//
//优点：当一个产品族中的多个对象被设计成一起工作时，它能保证客户端始终只使用同一个产品族中的对象。
//
//缺点：产品族扩展非常困难，要增加一个系列的某一产品，既要在抽象的 Creator 里加代码，又要在具体的里面加代码。
//
//使用场景： 1、QQ 换皮肤，一整套一起换。 2、生成不同操作系统的程序。
//
//注意事项：产品族难扩展，产品等级易扩展。

/// Step1: 为颜色创建一个接口。
public protocol Color {
    func fill()
}

/// Step2: 创建实现接口的实体类。
public class Red: Color {
    public func fill() {
        print("\(type(of: self))Color.fill()")
    }
}

public class Green: Color {
    public func fill() {
        print("\(type(of: self))Color.fill()")
    }
}

public class Blue: Color {
    public func fill() {
        print("\(type(of: self))Color.fill()")
    }
}

/// Step3: 为 Color 和 Shape 对象创建抽象类来获取工厂。
public protocol IAbstractFactory {
    func getColor(_ color: String) -> Color?
    func getShare(type: ShapeType) -> Shape?
}

/// 对子类进行约束，统一标准
public class AbstractFactory: IAbstractFactory {
    
    public func getColor(_ color: String) -> Color? {
        fatalError("Don't impl this method.")
    }
    
    public func getShare(type: ShapeType) -> Shape? {
        fatalError("Don't impl this method.")
    }
    
}

/// Step4: 创建扩展了 AbstractFactory 的工厂类，基于给定的信息生成实体类的对象。
public class XShapeFactory: AbstractFactory {
    
    public override func getColor(_ color: String) -> Color? {
        return nil
    }
    
    public override func getShare(type: ShapeType) -> Shape {
        switch type {
        case .rectangle: return Rectangle()
        case .square: return Square()
        case .circle: return Circle()
        }
    }
    
}

public class XColorFactory: AbstractFactory {
    
    public override init() {
        
    }
    
    public override func getColor(_ color: String) -> Color? {
        switch color {
        case "Red": return Red()
        case "Green": return Green()
        case "Blue": return Blue()
        default: return nil
        }
    }
    
    public override func getShare(type: ShapeType) -> Shape? {
        return nil
    }
    
}

/// Step5: 创建一个工厂创造器/生成器类，通过传递形状或颜色信息来获取工厂。
public class XFactoryProducer {
    
    public enum Choice {
        case color, shape
    }
    
    public class func getFactory(_ choice: Choice) -> IAbstractFactory {
        if choice == .color {
            return XColorFactory()
        } else {
            return XShapeFactory()
        }
    }
    
}

/// Step6: 使用 XFactoryProducer 来获取 AbstractFactory，通过传递类型信息来获取实体类的对象。
public class AbstractFactoryPatternDemo {
    
    public func exec() {
        let colorFactory = XFactoryProducer.getFactory(.color)
        
        let redColor = colorFactory.getColor("Red")
        redColor?.fill()
        let greenColor = colorFactory.getColor("Green")
        greenColor?.fill()
        let blueColor = colorFactory.getColor("Blue")
        blueColor?.fill()
        
        let shapeFactory = XFactoryProducer.getFactory(.shape)
        let shape1 = shapeFactory.getShare(type: .rectangle)
        shape1?.draw()
        let shape2 = shapeFactory.getShare(type: .circle)
        shape2?.draw()
        let shape3 = shapeFactory.getShare(type: .square)
        shape3?.draw()
    }
    
}
