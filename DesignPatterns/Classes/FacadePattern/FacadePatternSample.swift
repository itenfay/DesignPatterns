//
//  FacadePatternSample.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/6/21.
//

import Foundation

/// 创建一个外观类。
public class ShapeMaker {
    private let rectangle: Rectangle
    private let square: Square
    private let circle: Circle
    
    public init() {
        self.rectangle = Rectangle()
        self.square = Square()
        self.circle = Circle()
    }
    
    public func drawRectangle() {
        rectangle.draw()
    }
    
    public func drawSquare() {
        square.draw()
    }
    
    public func drawCircle() {
        circle.draw()
    }
}

/// 使用该外观类画出各种类型的形状。
public struct FacadePatternDemo {
    
    public static func main() {
        let shapeMaker = ShapeMaker()
        shapeMaker.drawRectangle()
        shapeMaker.drawSquare()
        shapeMaker.drawCircle()
    }
}

//Output result:
//Rectangle.draw()
//Square.draw()
//Circle.draw()
