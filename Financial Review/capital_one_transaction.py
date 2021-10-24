"""
Process Bank of America Transaction Exports
"""
from factory import Transaction_Factory
from constants import PAYEE_TRANSLATIONS

account = "Capital One"
payment_payee = "CAPITAL ONE MOBILE PYMT"
rename_columns = {
    "Transaction Date": "posted date",
    "Description": "payee",
    "Debit": "cost"
}
output_filename = "capital_one_transaction.csv"

class Capital_One_Transaction(Transaction_Factory):
    def __init__(self):
        super(Capital_One_Transaction, self).__init__(
            account, payment_payee, rename_columns, PAYEE_TRANSLATIONS, output_filename)
