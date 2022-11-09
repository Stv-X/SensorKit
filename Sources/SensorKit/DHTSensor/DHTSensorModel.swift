//
//  DHTSensorModel.swift
//  
//
//  Created by 徐嗣苗 on 2022/11/9.
//

import Foundation

// 温度等级，用于绘制监视器视图中的动态温度计符号
public enum TemperatureLevel: String, CaseIterable, Identifiable {
    case low
    case medium
    case high
    
    public var id: Self { self }
}

// 温度记录，为温度柱状图表提供数据
public struct TemperatureRecord: Identifiable {
    
    public init(value: Double, timestamp: Date) {
        self.value = value
        self.timestamp = timestamp
    }
    
    public var value: Double
    public var timestamp: Date
    public var id = UUID()
}

// 湿度记录，为湿度柱状图表提供数据
public struct HumidityRecord: Identifiable {
    
    public init(value: Double, timestamp: Date) {
        self.value = value
        self.timestamp = timestamp
    }
    
    public var value: Double
    public var timestamp: Date
    public var id = UUID()
}

// 温度状态，包含一个以标准单位真实值表示温度数值的 value 属性
public struct TemperatureState: Equatable {
    
    public init(value: Double) {
        self.value = value
    }
    
    public var value: Double
}

// 湿度状态，包含一个以标准单位真实值表示湿度数值的 value 属性
public struct HumidityState: Equatable {
    
    public init(value: Double) {
        self.value = value
    }
    
    var value: Double
}

// 整理好的数据，包含温度状态、湿度状态、校验结果
public struct OrganizedDHTData {
    
    public init(temperature: TemperatureState, humidity: HumidityState, isVerified: Bool) {
        self.temperature = temperature
        self.humidity = humidity
        self.isVerified = isVerified
    }
    
    public var temperature: TemperatureState
    public var humidity: HumidityState
    public var isVerified: Bool
}

// 经过 DHT22 协议规定分类好的二进制原始数据，包括湿度高8位、湿度低8位、温度高8位、温度低8位、校验位
public struct DHTRawData {
    
    public init(humidityHigh: String, humidityLow: String, temperatureHigh: String, temperatureLow: String, verifyBit: String) {
        self.humidityHigh = humidityHigh
        self.humidityLow = humidityLow
        self.temperatureHigh = temperatureHigh
        self.temperatureLow = temperatureLow
        self.verifyBit = verifyBit
    }
    
    public var humidityHigh: String
    public var humidityLow: String
    public var temperatureHigh: String
    public var temperatureLow: String
    public var verifyBit: String
}

// 温湿度传感器监视器视图中可调节的选项
public struct DHTSensorMonitorOptions {
    
    public init(serialPort: Int, baudRateIndex: Int, hostname: String, port: String) {
        self.serialPort = serialPort
        self.baudRateIndex = baudRateIndex
        self.hostname = hostname
        self.port = port
    }
    
    public var serialPort: Int = 0
    public var baudRateIndex: Int = availableBaudRates.count - 1
    public var hostname: String = "127.0.0.1"
    public var port: String = "8080"
}
