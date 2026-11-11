import Foundation
import Testing
@testable import FreelancePrepCore

@Test func projectStoresItsValuesAndPreservesSuppliedID() throws {
    let id = UUID(uuidString: "12345678-1234-1234-1234-123456789ABC")!
    let estimate = try ProjectEstimate(
        estimatedRevenue: Decimal(string: "1250.75")!,
        estimatedHours: Decimal(string: "12.5")!
    )

    let project = try Project(
        id: id,
        name: "Website redesign",
        currencyCode: "USD",
        estimate: estimate
    )

    #expect(project.id == id)
    #expect(project.name == "Website redesign")
    #expect(project.currencyCode == "USD")
    #expect(project.estimate == estimate)
}

@Test func projectGeneratesIDAndAllowsMissingEstimate() throws {
    let project = try Project(name: "Consulting", currencyCode: "EUR")

    #expect(project.id != UUID.zero)
    #expect(project.name == "Consulting")
    #expect(project.currencyCode == "EUR")
    #expect(project.estimate == nil)
}

@Test func projectTrimsNameBeforeStoringIt() throws {
    let project = try Project(name: " \n  Product audit\t ", currencyCode: "CAD")

    #expect(project.name == "Product audit")
}

@Test func projectRejectsNameThatIsEmptyAfterTrimming() {
    for name in ["", "   ", "\n\t  "] {
        #expect(throws: ModelValidationError.emptyProjectName) {
            try Project(name: name, currencyCode: "USD")
        }
    }
}

@Test func projectAcceptsExactlyThreeUppercaseASCIILettersAsCurrencyCode() throws {
    for currencyCode in ["USD", "EUR", "CAD", "XYZ"] {
        let project = try Project(name: "Valid project", currencyCode: currencyCode)
        #expect(project.currencyCode == currencyCode)
    }
}

@Test func projectRejectsMalformedCurrencyCodes() {
    for currencyCode in ["", "US", "USDD", "usd", "Usd", "U1D", "\u{00C9}UR", " USD", "USD "] {
        #expect(throws: ModelValidationError.invalidCurrencyCode) {
            try Project(name: "Valid project", currencyCode: currencyCode)
        }
    }
}

@Test func projectsAreEquatableByTheirStoredValues() throws {
    let id = UUID()
    let first = try Project(id: id, name: "Same", currencyCode: "USD")
    let equal = try Project(id: id, name: " Same ", currencyCode: "USD")
    let different = try Project(id: id, name: "Same", currencyCode: "EUR")

    #expect(first == equal)
    #expect(first != different)
}

private extension UUID {
    static let zero = UUID(uuidString: "00000000-0000-0000-0000-000000000000")!
}
