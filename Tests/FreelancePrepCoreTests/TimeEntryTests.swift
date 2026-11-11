import Foundation
import Testing
@testable import FreelancePrepCore

@Test func timeEntryDefaultsToANewID() throws {
    let first = try TimeEntry(
        projectID: UUID(),
        hoursWorked: Decimal(string: "1.25")!,
        workedAt: Date(timeIntervalSince1970: 1_700_000_000)
    )
    let second = try TimeEntry(
        projectID: UUID(),
        hoursWorked: Decimal(string: "1.25")!,
        workedAt: Date(timeIntervalSince1970: 1_700_000_000)
    )

    #expect(first.id != second.id)
}

@Test func timeEntryPreservesSuppliedValues() throws {
    let id = UUID(uuidString: "6AA96B31-788E-4772-BB85-E9DD24428427")!
    let projectID = UUID(uuidString: "264F0D0E-F10B-4B1A-82EA-C0038C284989")!
    let hoursWorked = Decimal(string: "2.3456789")!
    let workedAt = Date(timeIntervalSince1970: 1_700_000_123.456)

    let entry = try TimeEntry(
        id: id,
        projectID: projectID,
        hoursWorked: hoursWorked,
        workedAt: workedAt
    )

    #expect(entry.id == id)
    #expect(entry.projectID == projectID)
    #expect(entry.hoursWorked == hoursWorked)
    #expect(entry.workedAt == workedAt)
}

@Test func timeEntryAcceptsPositiveHoursAndAnUnverifiedProjectID() throws {
    let projectID = UUID()
    let entry = try TimeEntry(
        projectID: projectID,
        hoursWorked: Decimal(string: "0.01")!,
        workedAt: Date(timeIntervalSince1970: 0)
    )

    #expect(entry.projectID == projectID)
    #expect(entry.hoursWorked == Decimal(string: "0.01")!)
}

@Test(arguments: [Decimal.zero, Decimal(-1)])
func timeEntryRejectsNonPositiveHours(hoursWorked: Decimal) {
    do {
        _ = try TimeEntry(
            projectID: UUID(),
            hoursWorked: hoursWorked,
            workedAt: Date(timeIntervalSince1970: 0)
        )
        Issue.record("Expected non-positive time-entry hours to be rejected.")
    } catch let error as ModelValidationError {
        #expect(error == .nonPositiveTimeEntryHours)
    } catch {
        Issue.record("Unexpected error: \(error)")
    }
}

@Test func timeEntriesAreEquatableByTheirValues() throws {
    let id = UUID()
    let projectID = UUID()
    let workedAt = Date(timeIntervalSince1970: 1_700_000_000)
    let first = try TimeEntry(
        id: id,
        projectID: projectID,
        hoursWorked: Decimal(string: "3.5")!,
        workedAt: workedAt
    )
    let equal = try TimeEntry(
        id: id,
        projectID: projectID,
        hoursWorked: Decimal(string: "3.5")!,
        workedAt: workedAt
    )
    let different = try TimeEntry(
        id: UUID(),
        projectID: projectID,
        hoursWorked: Decimal(string: "3.5")!,
        workedAt: workedAt
    )

    #expect(first == equal)
    #expect(first != different)
}
