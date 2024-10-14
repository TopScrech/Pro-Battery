func fetchChargeWidgetInfo() -> ChargeWidgetInfo {
    guard let props = fetchBatteryInfo() else {
        return ChargeWidgetInfo(
            charge: -1,
            cycles: -1,
            capacity: -1,
            condition: "Unknown"
        )
    }
    
    let charge = fetchBatteryLevel()
    let cycles = fetchCycles(props)
    let capacity = fetchCapacity(props)
    let condition = fetchCondition(props)
    
    return ChargeWidgetInfo(
        charge: charge,
        cycles: cycles,
        capacity: capacity,
        condition: condition
    )
}
