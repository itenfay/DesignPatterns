//
//  CXShapeFactory.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/5/22.
//

import Foundation

/// Step1: 创建一个接口:
public protocol Shape {
    func draw()
}

/// Step2: 创建实现接口的实体类。
public class Rectangle: Shape {
    public func draw() {
        print("\(type(of: self)).draw()")
    }
}

public class Square: Shape {
    public func draw() {
        print("\(type(of: self)).draw()")
    }
}

public class Circle: Shape {
    public func draw() {
        print("\(type(of: self)).draw()")
    }
}

public enum ShapeType: String {
    case rectangle, square, circle
}

/// Step3: 创建一个工厂，生成基于给定信息的实体类的对象。
public class ShapeFactory {
    
    public func makeShape(_ type: ShapeType) -> Shape {
        switch type {
        case .rectangle: return Rectangle()
        case .square: return Square()
        case .circle: return Circle()
        }
    }
    
}

/// Step4: 创建一个工厂，生成基于给定信息的实体类的对象。
public class FactoryPatternDemo {
    
    public static func main() {
        let shapeFactory = ShapeFactory()
        
        // 获取 Rectangle 的对象，并调用它的 draw 方法
        let rectangle = shapeFactory.makeShape(.rectangle)
        rectangle.draw()
        
        // 获取 Square 的对象，并调用它的 draw 方法
        let square = shapeFactory.makeShape(.square)
        square.draw()
        
        // 获取 Circle 的对象，并调用它的 draw 方法
        let circle = shapeFactory.makeShape(.circle)
        circle.draw()
    }
    
}

//Output result:
//Rectangle.draw()
//Square.draw()
//Circle.draw()
