"""
Process Bank of America Transaction Exports
"""
from factory import Transaction_Factory
from constants import PAYEE_TRANSLATIONS

account = "BoA - Play Yourself"
payment_payee = "Online payment from CHK"
rename_columns = {
    "Posted Date": "posted date",
    "Payee": "payee",
    "Amount": "cost"
}
output_filename = "boa_transaction.csv"

class BoA_Transaction(Transaction_Factory):
    def __init__(self):
        super(BoA_Transaction, self).__init__(
            account, payment_payee,rename_columns, PAYEE_TRANSLATIONS, output_filename)
