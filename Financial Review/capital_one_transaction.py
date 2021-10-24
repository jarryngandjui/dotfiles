"""
Process Bank of America Transaction Exports
"""
from factory import Transaction_Factory

account = "Capital One"
payment_payees = ["CAPITAL ONE MOBILE PYMT", "CAPITAL ONE AUTOPAY PYMT"]
rename_columns = {
    "Transaction Date": "posted date",
    "Description": "payee",
    "Debit": "cost"
}
output_filename = "capital_one_transaction.csv"

class Capital_One_Transaction(Transaction_Factory):
    def __init__(self):
        super(Capital_One_Transaction, self).__init__(
            account, payment_payees, rename_columns, output_filename)
