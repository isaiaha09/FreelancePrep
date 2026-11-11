public enum ModelValidationError: Error, Equatable {
    case emptyProjectName
    case invalidCurrencyCode
    case negativeEstimatedRevenue
    case nonPositiveEstimatedHours
    case emptyExpenseDescription
    case nonPositiveExpenseAmount
    case nonPositiveTimeEntryHours
}
