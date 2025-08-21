import Foundation

func fetchTemp(_ props: NSDictionary) -> Double {
    if let temp = props["Temperature"] as? Int {
        Double(temp) / 100
    } else {
        -1
    }
}
