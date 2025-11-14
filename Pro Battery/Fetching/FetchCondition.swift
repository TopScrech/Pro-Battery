import Foundation

func fetchCondition(_ props: NSDictionary) -> String {
    if let permanentFailureStatus = props["PermanentFailureStatus"] as? Int, permanentFailureStatus == 0 {
        "Normal"
    } else {
        "Service recommended"
    }
}
