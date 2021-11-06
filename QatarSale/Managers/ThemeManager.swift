//
//  ThemeManager.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import Foundation
import UIKit

class ThemeManager {
    
    enum Font {
        enum NunitoType {
            case regular
            case bold
        }
        
        case nunito(type: NunitoType, size: CGFloat)
        
        var font: UIFont {
            switch self {
            case .nunito(_, let size): return UIFont(name: fontName, size: size)!
            }
        }
        
        var fontName: String {
            switch self {
            case .nunito(let type, _):
                switch type {
                case .regular: return "Nunito-Regular"
                case .bold: return "Nunito-Bold"
                }
            }
        }
    }
    
    enum Color {
        case _282828
        case _878787
        case _ebebeb
        case f6f6f6
        case _252933
        case _919191
        
        var color: UIColor {
            switch self {
            case ._282828: return UIColor(named: "#282828")!
            case ._878787: return UIColor(named: "#878787")!
            case ._ebebeb: return UIColor(named: "#EBEBEB")!
            case .f6f6f6: return UIColor(named: "#F6F6F6")!
            case ._252933: return UIColor(named: "#252933")!
            case ._919191: return UIColor(named: "#919191")!
            }
        }
        
        var cgColor: CGColor {
            return color.cgColor
        }
    }
    
}
