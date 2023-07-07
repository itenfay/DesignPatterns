//
//  ViewController.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        execute()
    }
    
    func execute() {
        print("===================================")
        print("Factory Pattern:")
        FactoryPatternDemo.main()
        print("===================================\n")
        
        print("Abstract Factory Pattern:")
        AbstractFactoryPatternDemo.main()
        print("===================================\n")

        print("Builder Pattern:")
        BuilderPatternDemo.main()
        print("===================================\n")
        
        print("Adaptor Pattern:")
        AdaptorPatternDemo.main()
        print("===================================\n")

        print("Bridge Pattern:")
        BridgePatternDemo.main()
        print("===================================\n")

        print("Criteria Pattern:")
        CriteriaPatternDemo.main()
        print("===================================\n")

        print("Decorator Pattern:")
        DecoratorPatternDemo.main()
        print("===================================\n")
        
        print("Facade Pattern:")
        FacadePatternDemo.main()
        print("===================================\n")
    }
    
}
