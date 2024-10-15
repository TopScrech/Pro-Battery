import Foundation

func fetchCondition() -> String {
    guard let props = fetchBatteryProps() else {
        return "Unknown"
    }
    
    if let permanentFailureStatus = props["PermanentFailureStatus"] as? Int, permanentFailureStatus == 0 {
        return "Normal"
    } else {
        return "Service recommended"
    }
}

func fetchCondition(_ props: NSDictionary) -> String {
    if let permanentFailureStatus = props["PermanentFailureStatus"] as? Int, permanentFailureStatus == 0 {
        "Normal"
    } else {
        "Service recommended"
    }
}
