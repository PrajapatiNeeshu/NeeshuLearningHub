# Q001 - Complex Scenario

## Scenario
A banking application allows users to transfer money between accounts. A defect is reported where a user can transfer funds even when the account balance is insufficient.

## How to Approach
- Review the business rules for balance validation.
- Check if validation exists before transaction processing.
- Verify backend and UI logic together.
- Test valid, invalid, edge-case, and concurrency scenarios.

## Example Answer
This is a critical validation defect. The application should prevent transactions when the available balance is lower than the transfer amount. I would test the validation logic at the UI, service, and database layers to ensure no bypass occurs and then report the defect with steps, expected result, and actual result.
