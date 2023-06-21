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
        FactoryPatternDemo.main()
        AbstractFactoryPatternDemo.main()
        BuilderPatternDemo.main()
        AdaptorPatternDemo.main()
        BridgePatternDemo.main()
        CriteriaPatternDemo.main()
        DecoratorPatternDemo.main()
        FacadePatternDemo.main()
    }
    
}
