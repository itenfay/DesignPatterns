//
//  ShapeBridge.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/6/20.
//

import Foundation

/// 步骤 1: 创建桥接实现接口。
public protocol DrawAPI {
    func drawCircle(x: Int, y: Int, radius: Int)
}

/// 步骤 2: 创建实现了 DrawAPI 接口的实体桥接实现类。
public class RedCircle: DrawAPI {
    public func drawCircle(x: Int, y: Int, radius: Int) {
        print("Drawing circel [color: red, point: (\(x), \(y)), radius: \(radius)")
    }
}

public class GreenCircle: DrawAPI {
    public func drawCircle(x: Int, y: Int, radius: Int) {
        print("Drawing circel [color: green, point: (\(x), \(y)), radius: \(radius)")
    }
}

/// 步骤 3: 使用 DrawAPI 接口创建抽象类 Shape。
public class AbstractShape {
    
    internal let drawAPI: DrawAPI
    
    internal init(drawAPI: DrawAPI) {
        self.drawAPI = drawAPI
    }
    
    public func draw() {
        fatalError("Can't invoke this function in the class")
    }
}

/// 步骤 4: 创建实现了 Shape 抽象类的实体类。
public class BdCircle: AbstractShape {
    
    private let x: Int
    private let y: Int
    private let radius: Int
    
    init(x: Int, y: Int, radius: Int, drawAPI: DrawAPI) {
        self.x = x
        self.y = y
        self.radius = radius
        super.init(drawAPI: drawAPI)
    }
    
    public override func draw() {
        drawAPI.drawCircle(x: x, y: y, radius: radius)
    }
    
}

/// 步骤 5: 使用 Shape 和 DrawAPI 类画出不同颜色的圆。
public struct BridgePatternDemo {
    
    public static func main() {
        let redCircle: AbstractShape = BdCircle(x: 100, y: 50, radius: 60, drawAPI: RedCircle())
        redCircle.draw()
        let greedCircle: AbstractShape = BdCircle(x: 200, y: 200, radius: 100, drawAPI: GreenCircle())
        greedCircle.draw()
    }
    
}

//Output result:
//Drawing circel [color: red, point: (100, 50), radius: 60
//Drawing circel [color: green, point: (200, 200), radius: 100
