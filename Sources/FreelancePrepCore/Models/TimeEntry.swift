import Foundation

public struct TimeEntry: Identifiable, Equatable {
    public let id: UUID
    public let projectID: UUID
    public let hoursWorked: Decimal
    public let workedAt: Date

    public init(
        id: UUID = UUID(),
        projectID: UUID,
        hoursWorked: Decimal,
        workedAt: Date
    ) throws {
        guard hoursWorked > 0 else {
            throw ModelValidationError.nonPositiveTimeEntryHours
        }

        self.id = id
        self.projectID = projectID
        self.hoursWorked = hoursWorked
        self.workedAt = workedAt
    }
}
