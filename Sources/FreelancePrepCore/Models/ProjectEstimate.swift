import Foundation

public struct ProjectEstimate: Equatable {
    public let estimatedRevenue: Decimal
    public let estimatedHours: Decimal

    public init(estimatedRevenue: Decimal, estimatedHours: Decimal) throws {
        guard estimatedRevenue >= .zero else {
            throw ModelValidationError.negativeEstimatedRevenue
        }
        guard estimatedHours > .zero else {
            throw ModelValidationError.nonPositiveEstimatedHours
        }

        self.estimatedRevenue = estimatedRevenue
        self.estimatedHours = estimatedHours
    }
}
