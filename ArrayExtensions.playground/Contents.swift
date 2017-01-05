//: Playground - noun: a place where people can play

import UIKit

protocol DoubleConvertibleType {
    var doubleValue: Double { get }
}

extension Double : DoubleConvertibleType { var doubleValue: Double { return self         } }
extension Float  : DoubleConvertibleType { var doubleValue: Double { return Double(self) } }
extension CGFloat: DoubleConvertibleType { var doubleValue: Double { return Double(self) } }

extension Array where Element: Integer {
    var total: Element {
        guard !isEmpty else { return 0 }
        return reduce(0){$0 + $1}
    }
    var average: Double {
        guard let total = total as? Int , !isEmpty else { return 0 }
        return Double(total)/Double(count)
    }
}

extension Array where Element: DoubleConvertibleType {
    var total: DoubleConvertibleType {
        guard !isEmpty else { return Double(0) }
        return  reduce(0.0){$0 + $1.doubleValue}
    }
    var average: DoubleConvertibleType {
        guard !isEmpty else { return Double(0) }
        return  total.doubleValue / Double(count)
    }
}

extension Array where Element: Equatable {
    var orderedSetValue: Array  {
        return reduce([]){ $0.contains($1) ? $0 : $0 + [$1] }
    }
}