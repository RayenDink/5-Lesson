//
//  main.swift
//  5 Lesson
//
//  Created by Rayen on 7/16/20.
//  Copyright © 2020 Rayen. All rights reserved.
//

import Foundation

enum EngineCar: CustomStringConvertible {
    case on
    case off
    var description: String {
        switch self {
        case .off:
            return "заглушен"
        case .on:
            return "запущен"
        }
    }
}

enum WindowCar: CustomStringConvertible {
    case open
    case closed
    var description: String {
        switch self {
        case .closed:
            return "открыты"
        case .open:
            return "закрыты"
        }
    }
}
enum Action {
    case switchEngine (EngineCar)
    case switchWindow (WindowCar)
    //case switchTrunk (TrunkDescription)
}
protocol Car {
    
    var marka: String {get}
    var productionYear: Int {get}
    var engine: EngineCar {get set}
    var window: WindowCar {get set}
    
    func action(action: Action)
}
extension Car {
    
    mutating func setEngineCar(status: EngineCar) {
        engine = status
    }
    mutating func setWindowCar(status: WindowCar) {
        
        window = status
    }
}
class TrunkCar: Car {
    
    enum TrunkDescription: CustomStringConvertible {
        case unload
        case fill
        var description: String{
            switch self {
            case .fill:
                return "загрузить"
            case .unload:
                return "выгрузить"
            }
        }
    }
    
    enum BodyCar: CustomStringConvertible {
        case open
        case close
        case cistern
        var description: String {
            
            switch self {
            case .open:
                return "закрытый"
            case .close:
                return "открытый"
            case .cistern:
                return "цистерна"
            }
        }
    }
    
    var marka: String
    var body: BodyCar?
    var productionVear: Int
    var trunk: TrunkDescription?
    var volumeTrunk: Double
    var engine: EngineCar
    var window: WindowCar
    var fillTrunk: Double?
    
    init?(marka: String, body: BodyCar,
          productionYear: Int, trunk: TrunkDescription, volumeTrunk: Double, engine: EngineCar, window: WindowCar, fillTrunk: Double){
        if volumeTrunk < 0 || fillTrunk < 0 || fillTrunk > volumeTrunk {
            print("ERROR: \n введены не верно!\n объем багажника не может быть меньше 0!\n багажника не может быть меньше 0!\n багажника не может превышать объем багажника!\n введите правильные данные!")
            return nil
        }
        self.marka = marka
        self.productionYear = productionYear
        self.body = body
        self.trunk = trunk
        self.engine = engine
        self.window = window
        self.fillTrunk = fillTrunk
        self.volumeTrunk = volumeTrunk
    }
    func action(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindow(let status):
            window = status
        }
    }
}
extension TrunkCar: CustomStringConvertible {
    
    var description: String {
        return "Автомобиль \(marka) \n год выпуска \(productionYear) \n кузов (body?. description ?? ";отцеплен")\n объем кузова \(volumeTrunk)\n состояние двигателя \(engine)\n окна\ (window.description)\n действие с багажником ";\(trunk?.description ?? "нет багажника");  груз; объемом; \(String(describing: fillTrunk))}
}
    var lorry = TrunkCar(marka: "Volvo", body: . cistern, productionYear: 2010, trunk: .fill, volumeTrunk: 20000, engine: .off, window: .open, fillTrunk: 10000)
    lorry?.description
lorry?.action(action: .switchWindow(.closed))
lorry?.description

class SportCar: Car {
    
    enum TurboCar: CustomStringConvertible {
        case on
        case off
        var description: String {
            switch self {
            case .on:
                return "активна"
            case .off:
                return "выключена"
            }
        }
    }
    var marka: String
    var productionYear: Int
    var engine: EngineCar
    var window: WindowCar
    var turbo: TurboCar?
    
    init (marka: String, productionYear: Int, engine: EngineCar, window: WindowCar, turbo: TurboCar){
        self.marka = marka
        self.productionYear = productionYear
        self.engine = engine
        self.window = window
        self.turbo = turbo
    }
    func action(action: Action) {
        switch action
        case .switchEngine(let status):
        engine = status
        case .switchWindow(let status):
        window = status
        extension SportCar: CustomStringConvertible {
            
            var description: String{
                return "Автомобиль \(marka) \n год выпуска \(productionYear) \n Состояние двигателя \(engine.description) \n Окна \(window.description) \n Турбина \(turbo?.description ?? "без турбины") "
            }
        }
        
        var car = SportCar(marka: "Ferrari", productionYear: 2020, engine: .off, window:.closed, turbo: .on)
        car.description
        car.action(action: .switchEngine(.on))
        car.description
