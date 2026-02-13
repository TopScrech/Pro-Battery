import OSLog
import Testing

private let logger = Logger(subsystem: "ProBatteryTests", category: "UnitTests")

struct UnitTests {
    @Test func example() async throws {
        let maxCapacity = 50
        let designCapacity = 100
        
        let percentage = maxCapacity / designCapacity * 100
        let intPercentage = Int(percentage)
        
        logger.info("intPercentage: \(intPercentage)")
    }
}
