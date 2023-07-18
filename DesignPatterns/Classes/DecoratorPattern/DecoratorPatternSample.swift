//
//  DecoratorPatternSample.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/6/21.
//

import Foundation

/// 创建实现了 Shape 接口的抽象装饰类。
public class AbstractShapeDecorator: Shape {
    
    internal var decoratedShape: Shape
    
    init(decoratedShape: Shape) {
        self.decoratedShape = decoratedShape
    }
    
    public func draw() {
        fatalError("Can't invoke this method")
    }
    
}

/// 创建扩展了 ShapeDecorator 类的实体装饰类。
public class RedShapeDecorator: AbstractShapeDecorator {
    
    override init(decoratedShape: Shape) {
        super.init(decoratedShape: decoratedShape)
    }
    
    public override func draw() {
        decoratedShape.draw()
        setBorderColor()
    }
    
    private func setBorderColor() {
        print("Set border color of \(type(of: decoratedShape)): Red")
    }
    
}

/// 使用 RedShapeDecorator 来装饰 Shape 对象。
public struct DecoratorPatternDemo {
    
    public static func main() {
        let circle = Circle()
        let redCircle = RedShapeDecorator(decoratedShape: Circle())
        let redRectangle = RedShapeDecorator(decoratedShape: Rectangle())
        print("Circle with normal border")
        circle.draw()
        print("Circle of red border")
        redCircle.draw()
        print("Rectangle of red border")
        redRectangle.draw()
    }
    
}

//Output result:
//Circle with normal border
//Circle.draw()
//Circle of red border
//Circle.draw()
//Set border color of Circle: Red
//Rectangle of red border
//Rectangle.draw()
//Set border color of Rectangle: Red
