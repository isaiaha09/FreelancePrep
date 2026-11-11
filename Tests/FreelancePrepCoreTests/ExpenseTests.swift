import Foundation
import Testing
@testable import FreelancePrepCore

@Test func expenseDefaultsToANewID() throws {
    let first = try Expense(
        projectID: UUID(),
        description: "Software subscription",
        amount: Decimal(string: "12.34")!,
        incurredAt: Date(timeIntervalSince1970: 1_700_000_000)
    )
    let second = try Expense(
        projectID: UUID(),
        description: "Software subscription",
        amount: Decimal(string: "12.34")!,
        incurredAt: Date(timeIntervalSince1970: 1_700_000_000)
    )

    #expect(first.id != second.id)
}

@Test func expensePreservesSuppliedValuesAndTrimsDescription() throws {
    let id = UUID(uuidString: "8C93C593-7907-4EC8-9D36-A1CB2A211925")!
    let projectID = UUID(uuidString: "42CBAB2E-8C5D-4825-8E1F-BA71AC950416")!
    let amount = Decimal(string: "1234.56789")!
    let incurredAt = Date(timeIntervalSince1970: 1_700_000_123.456)

    let expense = try Expense(
        id: id,
        projectID: projectID,
        description: " \n  Equipment rental \t ",
        amount: amount,
        incurredAt: incurredAt
    )

    #expect(expense.id == id)
    #expect(expense.projectID == projectID)
    #expect(expense.description == "Equipment rental")
    #expect(expense.amount == amount)
    #expect(expense.incurredAt == incurredAt)
}

@Test func expenseAcceptsPositiveAmountAndAnUnverifiedProjectID() throws {
    let projectID = UUID()
    let expense = try Expense(
        projectID: projectID,
        description: "Domain registration",
        amount: Decimal(string: "0.01")!,
        incurredAt: Date(timeIntervalSince1970: 0)
    )

    #expect(expense.projectID == projectID)
    #expect(expense.amount == Decimal(string: "0.01")!)
}

@Test func expenseRejectsBlankDescription() {
    do {
        _ = try Expense(
            projectID: UUID(),
            description: " \t\n \r ",
            amount: 1,
            incurredAt: Date(timeIntervalSince1970: 0)
        )
        Issue.record("Expected an empty expense description to be rejected.")
    } catch let error as ModelValidationError {
        #expect(error == .emptyExpenseDescription)
    } catch {
        Issue.record("Unexpected error: \(error)")
    }
}

@Test(arguments: [Decimal.zero, Decimal(-1)])
func expenseRejectsNonPositiveAmount(amount: Decimal) {
    do {
        _ = try Expense(
            projectID: UUID(),
            description: "Travel",
            amount: amount,
            incurredAt: Date(timeIntervalSince1970: 0)
        )
        Issue.record("Expected a non-positive expense amount to be rejected.")
    } catch let error as ModelValidationError {
        #expect(error == .nonPositiveExpenseAmount)
    } catch {
        Issue.record("Unexpected error: \(error)")
    }
}

@Test func expensesAreEquatableByTheirValues() throws {
    let id = UUID()
    let projectID = UUID()
    let incurredAt = Date(timeIntervalSince1970: 1_700_000_000)
    let first = try Expense(
        id: id,
        projectID: projectID,
        description: "Travel",
        amount: Decimal(string: "45.50")!,
        incurredAt: incurredAt
    )
    let equal = try Expense(
        id: id,
        projectID: projectID,
        description: "Travel",
        amount: Decimal(string: "45.50")!,
        incurredAt: incurredAt
    )
    let different = try Expense(
        id: UUID(),
        projectID: projectID,
        description: "Travel",
        amount: Decimal(string: "45.50")!,
        incurredAt: incurredAt
    )

    #expect(first == equal)
    #expect(first != different)
}
