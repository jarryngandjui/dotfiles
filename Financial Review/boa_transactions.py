"""
Process Bank of America Transaction Exports
"""
from factory import Transaction_Factory

account = "BoA - Play Yourself"
payment_payees = ["Online payment from CHK"]
rename_columns = {
    "Posted Date": "posted date",
    "Payee": "payee",
    "Amount": "cost"
}
output_filename = "boa_transaction.csv"

class BoA_Transaction(Transaction_Factory):
    def __init__(self):
        super(BoA_Transaction, self).__init__(
            account, payment_payees,rename_columns, output_filename=output_filename)
