import Testing

struct UnitTests {
    @Test func example() async throws {
        let maxCapacity = 50
        let designCapacity = 100
        
        let percentage = maxCapacity / designCapacity * 100
        let intPercentage = Int(percentage)
        
        print(intPercentage)
    }
}
