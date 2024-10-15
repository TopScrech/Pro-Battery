import Foundation

func fetchTemp(_ props: NSDictionary) -> Double {
    guard
        let temp = props["Temperature"] as? Int
    else {
        return -1
    }
    
    return Double(temp) / 100
}
