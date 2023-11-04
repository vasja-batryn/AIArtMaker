//
//  SKProduct+Ext.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 04.07.2023.
//

import StoreKit

// MARK: - Public Properties
extension SKProduct {
    
    var localizedPrice: String {
        SKProduct.numberFormatter.locale = priceLocale
        return SKProduct.numberFormatter.string(from: price)!
    }
    
    var localizedPeriod: String? {
        guard let subscriptionPeriod = subscriptionPeriod else { return nil }
        
        var dateComponents = DateComponents()
        dateComponents.calendar = .current
        
        let calendarUnit = subscriptionPeriod.unit.calendarUnit
        SKProduct.componentFormatter.allowedUnits = [calendarUnit]
        
        switch calendarUnit {
            case .day:
                dateComponents.setValue(subscriptionPeriod.numberOfUnits, for: .day)
            case .weekOfMonth:
                dateComponents.setValue(subscriptionPeriod.numberOfUnits, for: .weekOfMonth)
            case .month:
                dateComponents.setValue(subscriptionPeriod.numberOfUnits, for: .month)
            case .year:
                dateComponents.setValue(subscriptionPeriod.numberOfUnits, for: .year)
            default:
                return nil
        }
        
        return SKProduct.componentFormatter.string(from: dateComponents)
    }
    
    var localizedProfitPricePerWeek: String? {
        var period: Double?
        
        if let unit = subscriptionPeriod?.unit {
            switch unit {
            case .month:
                period = 30.5 / 7
            case .year:
                period = 365 / 7
            default:
                break
            }
        }
        
        guard let period else { return nil }
        
        let profitValue = price.doubleValue / period
        let profitPrice = NSDecimalNumber(value: profitValue)
        SKProduct.numberFormatter.locale = priceLocale
        return SKProduct.numberFormatter.string(from: profitPrice)!
    }
}

// MARK: - Fileprivate Properties
extension SKProduct {
    
    fileprivate static var componentFormatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .full
        formatter.zeroFormattingBehavior = .dropAll
        return formatter
    }
    
    fileprivate static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
}

extension SKProduct.PeriodUnit {
    
    fileprivate var calendarUnit: NSCalendar.Unit {
        switch self {
            case .day:
                return .day
            case .month:
                return .month
            case .week:
                return .weekOfMonth
            case .year:
                return .year
            @unknown default:
                debugPrint("Unknown Period Unit")
                return .day
        }
    }
}

