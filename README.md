## 设计模式简介

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](LICENSE)

### 设计模式

设计模式（Design pattern）简单来说是被无数优秀的面向对象的软件开发者总结出来的编程思想。它代表了最佳的实践，通常被有经验的面向对象的软件开发人员所采用。使用设计模式是为了重用代码、让代码更容易被他人理解、保证代码可靠性。

### 什么是 GOF（四人帮，全拼 Gang of Four）？

在 1994 年，由 Erich Gamma、Richard Helm、Ralph Johnson 和 John Vlissides 四人合著出版了一本名为 Design Patterns - Elements of Reusable Object-Oriented Software（中文译名：设计模式 - 可复用的面向对象软件元素） 的书，该书首次提到了软件开发中设计模式的概念。

四位作者合称 GOF（四人帮，全拼 Gang of Four）。他们所提出的设计模式主要是基于以下的面向对象设计原则。

- 对接口编程而不是对实现编程。
- 优先使用对象组合而不是继承。

### 设计模式的使用

设计模式在软件开发中的两个主要用途。

#### 开发人员的共同平台

设计模式提供了一个标准的术语系统，且具体到特定的情景。例如，单例设计模式意味着使用单个对象，这样所有熟悉单例设计模式的开发人员都能使用单个对象，并且可以通过这种方式告诉对方，程序使用的是单例模式。

#### 最佳的实践

设计模式已经经历了很长一段时间的发展，它们提供了软件开发过程中面临的一般问题的最佳解决方案。学习这些模式有助于经验不足的开发人员通过一种简单快捷的方式来学习软件设计。

### 设计模式的类型

根据设计模式的参考书 Design Patterns - Elements of Reusable Object-Oriented Software（中文译名：设计模式 - 可复用的面向对象软件元素） 中所提到的，总共有 23 种设计模式。这些模式可以分为三大类：创建型模式（Creational Patterns）、结构型模式（Structural Patterns）、行为型模式（Behavioral Patterns）。当然，我们还会讨论另一类设计模式：J2EE 设计模式。

|   序号   | 模式 & 描述 |   包括  |
| :-----: | :--------: | :-----: |  
| 1 | 创建型模式<br> 这些设计模式提供了一种在创建对象的同时隐藏创建逻辑的方式，而不是使用 new 运算符直接实例化对象。这使得程序在判断针对某个给定实例需要创建哪些对象时更加灵活。|    
工厂模式（Factory Pattern）<br>
抽象工厂模式（Abstract Factory Pattern）<br>
单例模式（Singleton Pattern）<br>
建造者模式（Builder Pattern）<br>
原型模式（Prototype Pattern）|
| 2 | 结构型模式<br> 这些设计模式关注类和对象的组合。继承的概念被用来组合接口和定义组合对象获得新功能的方式。| 
适配器模式（Adapter Pattern）<br>
桥接模式（Bridge Pattern）<br>
过滤器模式（Filter、Criteria Pattern）<br>
组合模式（Composite Pattern）<br>
装饰器模式（Decorator Pattern）<br>
外观模式（Facade Pattern）<br>
享元模式（Flyweight Pattern）<br>
代理模式（Proxy Pattern）|
| 3 | 行为型模式<br> 这些设计模式特别关注对象之间的通信。| 
责任链模式（Chain of Responsibility Pattern）<br>
命令模式（Command Pattern）<br>
解释器模式（Interpreter Pattern）<br>
迭代器模式（Iterator Pattern）<br>
中介者模式（Mediator Pattern）<br>
备忘录模式（Memento Pattern）<br>
观察者模式（Observer Pattern）<br>
状态模式（State Pattern）<br>
空对象模式（Null Object Pattern）<br>
策略模式（Strategy Pattern）<br>
模板模式（Template Pattern）<br>
访问者模式（Visitor Pattern）|
| 4 | J2EE 模式<br> 这些设计模式特别关注表示层。这些模式是由 Sun Java Center 鉴定的。|
MVC 模式（MVC Pattern）<br>
业务代表模式（Business Delegate Pattern）<br>
组合实体模式（Composite Entity Pattern）<br>
数据访问对象模式（Data Access Object Pattern）<br>
前端控制器模式（Front Controller Pattern）<br>
拦截过滤器模式（Intercepting Filter Pattern）<br>
服务定位器模式（Service Locator Pattern）<br>
传输对象模式（Transfer Object Pattern）|
