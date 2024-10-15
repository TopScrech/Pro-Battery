func fetchChargeWidgetInfo() -> ChargeWidgetInfo {
    guard let props = fetchBatteryProps() else {
        return ChargeWidgetInfo(
            charge: -1,
            cycles: -1,
            capacity: -1,
            condition: "Unknown",
            temperature: -1
        )
    }
    
    let charge = fetchBatteryLevel()
    let cycles = fetchCyclesCount(props)
    let capacity = fetchMaxCapacity(props)
    let condition = fetchCondition(props)
    let temperature = fetchTemp(props)
    
    return ChargeWidgetInfo(
        charge: charge,
        cycles: cycles,
        capacity: capacity,
        condition: condition,
        temperature: temperature
    )
}
