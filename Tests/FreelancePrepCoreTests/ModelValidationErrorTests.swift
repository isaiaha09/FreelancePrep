import Testing
@testable import FreelancePrepCore

@Test func modelValidationErrorsConformToError() {
    let errors: [ModelValidationError] = [
        ModelValidationError.emptyProjectName,
        .invalidCurrencyCode,
        .negativeEstimatedRevenue,
        .nonPositiveEstimatedHours,
        .emptyExpenseDescription,
        .nonPositiveExpenseAmount,
        .nonPositiveTimeEntryHours,
    ]

    #expect(errors.count == 7)
    #expect(errors.allSatisfy { $0 is ModelValidationError })
}

@Test func modelValidationErrorsAreEquatableAndDistinct() {
    let errors: [ModelValidationError] = [
        .emptyProjectName,
        .invalidCurrencyCode,
        .negativeEstimatedRevenue,
        .nonPositiveEstimatedHours,
        .emptyExpenseDescription,
        .nonPositiveExpenseAmount,
        .nonPositiveTimeEntryHours,
    ]

    #expect(ModelValidationError.emptyProjectName == .emptyProjectName)

    for leftIndex in errors.indices {
        for rightIndex in errors.indices where rightIndex > leftIndex {
            #expect(errors[leftIndex] != errors[rightIndex])
        }
    }
}
