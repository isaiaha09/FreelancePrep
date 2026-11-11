import Foundation

public struct Project: Identifiable, Equatable {
    public let id: UUID
    public let name: String
    public let currencyCode: String
    public let estimate: ProjectEstimate?

    public init(
        id: UUID = UUID(),
        name: String,
        currencyCode: String,
        estimate: ProjectEstimate? = nil
    ) throws {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedName.isEmpty else {
            throw ModelValidationError.emptyProjectName
        }

        let currencyScalars = currencyCode.unicodeScalars
        guard currencyScalars.count == 3,
              currencyScalars.allSatisfy({ (65...90).contains(Int($0.value)) })
        else {
            throw ModelValidationError.invalidCurrencyCode
        }

        self.id = id
        self.name = trimmedName
        self.currencyCode = currencyCode
        self.estimate = estimate
    }
}
