"""
Process Bank of America Transaction Exports
"""
from factory import Transaction_Factory
from constants import PAYEE_TRANSLATIONS

account = "BoA - Play Yourself"
rename_columns = {
    "Posted Date": "posted date",
    "Payee": "payee",
    "Amount": "cost"
}

class BoA_Transaction(Transaction_Factory):

    def __init__(self):
        super(BoA_Transaction, self).__init__(
            account, rename_columns, PAYEE_TRANSLATIONS)
