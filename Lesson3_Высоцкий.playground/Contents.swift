import UIKit
import Foundation

enum CarState {
    case engine_on
    case engine_off
    case windows_on
    case windows_off
    case trunk_full(gruz: Int)
    case trunk_empty(gruz: Int)
}

enum Brand_auto {
    case BMW , Audi, Mercedes
}
enum Brand_Truck {
    case MAN, KAMAZ, RENO
}

struct SportCar {
    let model_auto : Brand_auto
    let year_auto : Int
    let volume_auto : Int
    var engineState : Bool
    var windowState : Bool
    var trunk : Bool
    var wheel : Int
    
    mutating func changeAction(action: CarState) {
        switch action {
        case .engine_on: engineState = true
        case .engine_off: engineState = false
        case .windows_on: windowState = true
        case .windows_off: windowState = false
        case .trunk_full(let gruz):
            if (gruz + wheel) <= 4 && wheel >= 0{
                wheel += gruz
            } else if gruz >= 5 {
                print ("Can't put!")
            }
            
            if wheel >= 4 {
                trunk = true
            }
            print(printCarInfo())
        case .trunk_empty(let gruz):
            print(printCarInfo())
            if  wheel >= 4 {
                wheel -= gruz
                
            }
            
            if wheel < 4 && wheel >= 0 {
                trunk = false
                print("Can't get it!")
            } else if wheel < 0 {
                wheel = 0
                trunk = false
                print("Can't!")
            }
        }
    }
    
    init(model_auto: Brand_auto, year_auto: Int, volume_auto : Int, windowState : Bool, engineState: Bool, wheel: Int) {
        self.model_auto = model_auto
        self.year_auto = year_auto
        self.volume_auto = volume_auto
        self.windowState = windowState
        self.engineState = engineState
        self.wheel = wheel
        if wheel >= 4 {
            trunk = true
        } else {
            trunk = false
        }
    }
    func printCarInfo(){
        print("------------")
        print("Model auto: \(model_auto)")
        print("Year auto: \(year_auto)")
        print("Volume auto: \(volume_auto) ")
        print("Windows auto: \(windowState ? "Open" : "Close")")
        print("Engine auto: \(engineState ? "On" : "Off")")
        print("Trunk auto: \(trunk ? "Full" : "Empty")")
        print("Wheel in auto: \(wheel)")
    }
    
    
}

var car1 = SportCar(model_auto: .Audi, year_auto: 2020, volume_auto: 3459, windowState: false, engineState: false, wheel: 1)
var car2 = SportCar(model_auto: .BMW, year_auto: 2019, volume_auto: 2789, windowState: true, engineState: false, wheel: 3)
var car3 = SportCar(model_auto: .Mercedes, year_auto: 2021, volume_auto: 4000, windowState: false, engineState: true, wheel: 0)
car1.changeAction(action: .windows_on)
car1.changeAction(action: .engine_on)
car1.changeAction(action: .trunk_full(gruz: 2))
car2.changeAction(action: .windows_off)
car2.changeAction(action: .engine_off)
car2.changeAction(action: .trunk_full(gruz: 3))
car3.changeAction(action: .windows_on)
car3.changeAction(action: .engine_on)
car3.changeAction(action: .trunk_empty(gruz: 6))


struct TruckCar {
    let model_auto : Brand_Truck
    let year_auto : Int
    let volume_auto : Int
    var engineState : Bool
    var windowState : Bool
    var trunk : Bool
    var wheel : Int
    
    mutating func changeAction(action: CarState) {
        switch action {
        case .engine_on: engineState = true
        case .engine_off: engineState = false
        case .windows_on: windowState = true
        case .windows_off: windowState = false
        case .trunk_full(let gruz):
            if (gruz + wheel) <= 60 && wheel >= 0{
                wheel += gruz
            } else if gruz >= 61 {
                print ("Can't put!")
            }
            
            if wheel >= 60 {
                trunk = true
            }
            print(printCarInfo())
        case .trunk_empty(let gruz):
            print(printCarInfo())
            if  wheel >= 60 {
                wheel -= gruz
                
            }
            
            if wheel < 60 && wheel >= 0 {
                trunk = false
                print("Can't get it!")
            } else if wheel < 0 {
                wheel = 0
                trunk = false
                print("Can't!")
            }
        }
    }
    
    init(model_auto: Brand_Truck, year_auto: Int, volume_auto : Int, windowState : Bool, engineState: Bool, wheel: Int) {
        self.model_auto = model_auto
        self.year_auto = year_auto
        self.volume_auto = volume_auto
        self.windowState = windowState
        self.engineState = engineState
        self.wheel = wheel
        if wheel >= 60 {
            trunk = true
        } else {
            trunk = false
        }
    }
    func printCarInfo(){
        print("------------")
        print("Model auto: \(model_auto)")
        print("Year auto: \(year_auto)")
        print("Volume auto: \(volume_auto) ")
        print("Windows auto: \(windowState ? "Open" : "Close")")
        print("Engine auto: \(engineState ? "On" : "Off")")
        print("Trunk auto: \(trunk ? "Full" : "Empty")")
        print("Wheel in auto: \(wheel)")
    }
    
    
}

var truck1 = TruckCar(model_auto: .MAN, year_auto: 1998, volume_auto: 73459, windowState: true, engineState: true, wheel: 10)
var truck2 = TruckCar(model_auto: .KAMAZ, year_auto: 2009, volume_auto: 52789, windowState: false, engineState: true, wheel: 45)
var truck3 = TruckCar(model_auto: .RENO, year_auto: 2001, volume_auto: 12000, windowState: true, engineState: false, wheel: 34)
truck1.changeAction(action: .windows_on)
truck1.changeAction(action: .engine_on)
truck1.changeAction(action: .trunk_full(gruz: 23))
truck2.changeAction(action: .windows_off)
truck2.changeAction(action: .engine_off)
truck2.changeAction(action: .trunk_full(gruz: 37))
truck3.changeAction(action: .windows_on)
truck3.changeAction(action: .engine_on)
truck3.changeAction(action: .trunk_empty(gruz: 64))

    

