# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)i

EntryType.create(entry_type: "Credit")
EntryType.create(entry_type: "Debit")

EntryCategory.create(category: "ATM Deposit", entry_type_id: EntryType.find_by(entry_type: "Credit").id)
EntryCategory.create(category: "Balance Fwd", entry_type_id: EntryType.find_by(entry_type: "Credit").id)
EntryCategory.create(category: "Commission", entry_type_id: EntryType.find_by(entry_type: "Credit").id)
EntryCategory.create(category: "Daily Deposit", entry_type_id: EntryType.find_by(entry_type: "Credit").id)
EntryCategory.create(category: "Bank Interest", entry_type_id: EntryType.find_by(entry_type: "Credit").id)
EntryCategory.create(category: "Lottery Commission", entry_type_id: EntryType.find_by(entry_type: "Credit").id)
EntryCategory.create(category: "Lottery Deposit", entry_type_id: EntryType.find_by(entry_type: "Credit").id)
EntryCategory.create(category: "SMO Refund", entry_type_id: EntryType.find_by(entry_type: "Credit").id)

EntryCategory.create(category: "Accounting Expenses", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Balance Fwd", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Federal Taxes", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Insurance", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Inventory", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Lottery Withdrawal", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Payroll", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Payroll Taxes", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Rent", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Security Expenses", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "SMO Charge", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "SMO Withdrawal", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "State Taxes", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
EntryCategory.create(category: "Utilities", entry_type_id: EntryType.find_by(entry_type: "Debit").id)
