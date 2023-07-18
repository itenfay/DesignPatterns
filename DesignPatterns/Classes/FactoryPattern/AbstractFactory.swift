//
//  AbstractFactory.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/5/22.
//

import Foundation

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
    
    init() {
        assert(type(of: self) != AbstractFactory.self, "Abstract Factory")
    }
    
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
    
    public static func main() {
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

//Output result:
//RedColor.fill()
//GreenColor.fill()
//BlueColor.fill()
//Rectangle.draw()
//Circle.draw()
//Square.draw()
