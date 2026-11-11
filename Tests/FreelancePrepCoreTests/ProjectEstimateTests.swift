import Foundation
import Testing
@testable import FreelancePrepCore

@Test func projectEstimateStoresValidValues() throws {
    let estimate = try ProjectEstimate(estimatedRevenue: .zero, estimatedHours: 0.25)

    #expect(estimate.estimatedRevenue == .zero)
    #expect(estimate.estimatedHours == Decimal(string: "0.25")!)
}

@Test func projectEstimateAcceptsZeroRevenue() throws {
    let estimate = try ProjectEstimate(estimatedRevenue: 0, estimatedHours: 1)

    #expect(estimate.estimatedRevenue == .zero)
}

@Test func projectEstimateRejectsNegativeRevenue() {
    #expect(throws: ModelValidationError.negativeEstimatedRevenue) {
        try ProjectEstimate(estimatedRevenue: Decimal(string: "-0.01")!, estimatedHours: 1)
    }
}

@Test func projectEstimateRejectsZeroOrNegativeHours() {
    for hours in [Decimal.zero, Decimal(-1)] {
        #expect(throws: ModelValidationError.nonPositiveEstimatedHours) {
            try ProjectEstimate(estimatedRevenue: 1, estimatedHours: hours)
        }
    }
}

@Test func projectEstimatePreservesDecimalPrecisionWithoutRounding() throws {
    let revenue = Decimal(string: "987654321098765432.123456789")!
    let hours = Decimal(string: "123456.000000007")!

    let estimate = try ProjectEstimate(estimatedRevenue: revenue, estimatedHours: hours)

    #expect(estimate.estimatedRevenue == revenue)
    #expect(estimate.estimatedHours == hours)
}

@Test func projectEstimatesAreEquatableByTheirStoredValues() throws {
    let first = try ProjectEstimate(estimatedRevenue: Decimal(string: "500.25")!, estimatedHours: 2)
    let equal = try ProjectEstimate(estimatedRevenue: Decimal(string: "500.25")!, estimatedHours: 2)
    let different = try ProjectEstimate(estimatedRevenue: Decimal(string: "500.25")!, estimatedHours: 3)

    #expect(first == equal)
    #expect(first != different)
}
