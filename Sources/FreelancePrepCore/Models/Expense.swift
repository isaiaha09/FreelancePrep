import Foundation

public struct Expense: Identifiable, Equatable {
    public let id: UUID
    public let projectID: UUID
    public let description: String
    public let amount: Decimal
    public let incurredAt: Date

    public init(
        id: UUID = UUID(),
        projectID: UUID,
        description: String,
        amount: Decimal,
        incurredAt: Date
    ) throws {
        let trimmedDescription = description.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedDescription.isEmpty else {
            throw ModelValidationError.emptyExpenseDescription
        }
        guard amount > 0 else {
            throw ModelValidationError.nonPositiveExpenseAmount
        }

        self.id = id
        self.projectID = projectID
        self.description = trimmedDescription
        self.amount = amount
        self.incurredAt = incurredAt
    }
}
