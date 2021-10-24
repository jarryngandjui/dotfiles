"""
Read transactional files in csv format.

"""

import csv
from constants import PAYEE_TRANSLATIONS, RECURRING_TRANSACTIONS

DOWNLOADS_DIR = "/Users/jarry/Downloads"

class Transaction_Factory(object):
    translations = PAYEE_TRANSLATIONS
    recurring_transactions = RECURRING_TRANSACTIONS
    translate_target_key = "payee"
    is_translated_key = "is translated"
    account_key = "account"
    header = ["account", "posted date", "payee", "cost", is_translated_key]
    output_filename = "~/Downloads/"
    
    account = ""
    payment_payees = []
    rename_columns = dict()
    rows = []

    def __init__(self, account, payment_payees, rename_columns, output_filename):
        self.account = account
        self.payment_payee = payment_payees
        self.rename_columns = rename_columns
        self.output_filename = "{}/{}".format(DOWNLOADS_DIR,
            output_filename)

        if not self.translate_target_key in self.header:
            raise ValueError(
                "{} - must be a column in the header".format(translate_target_key))

    def process_transactions(self, filename):
        self._read_transactions(filename)
        self._transform_transactions()
        self._apply_translations()
        self._delete_reccuring_transactions_transform()
        self._write_transactions()

    def _read_transactions(self, filename):
        with open(filename, 'r') as csvfile:
            reader = csv.DictReader(csvfile)

            for row in reader:
                self.rows.append(row)

    def _write_transactions(self):
        with open(self.output_filename, 'w+') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=self.header)
            writer.writeheader()
            writer.writerows(self.rows)

    def _apply_translations(self):
        for row in self.rows:
            if not row[self.is_translated_key]:
                for tanslation in self.translations:
                    for synonym in tanslation.synonyms:
                        if synonym in row[self.translate_target_key]:
                            row[self.translate_target_key] = tanslation.translate()
                            row[self.is_translated_key] = True
                            break

    def _transform_transactions(self):
      self._rename_columns_transform()
      self._delete_payment_transaction_transform()
      self._delete_non_header_columns_transform()
      self._add_is_translated_column_transform()
      self._add_account_column_transform()

    def _add_is_translated_column_transform(self):
        for i in range(len(self.rows)):
            self.rows[i][self.is_translated_key] = False

    def _add_account_column_transform(self):
        if self.account:
            for i in range(len(self.rows)):
                self.rows[i][self.account_key] = self.account

    def _rename_columns_transform(self):
        for row in self.rows:
            for column, rename in self.rename_columns.items():
                if column in row:
                    row[rename] = row.pop(column)
    
    def _delete_non_header_columns_transform(self):
        for row in self.rows:
            for cell in row.copy():
                if not cell in self.header:
                    row.pop(cell)

    def _delete_payment_transaction_transform(self):
        payment_indices = []
        
        for i in range(len(self.rows)):
            for payee in self.payment_payees:
                if payee in self.rows[i][self.translate_target_key]:
                    payment_indices.append(i)

        print(payment_indices)
        for i in range(len(payment_indices)):
            self.rows.pop(payment_indices[i] - i)

    def _delete_reccuring_transactions_transform(self):
        recurring_indices = []

        for i in range(len(self.rows)):
            if self.rows[i][self.translate_target_key] in self.recurring_transactions:
                recurring_indices.append(i)
        
        for i in range(len(recurring_indices)):
            self.rows.pop(recurring_indices[i] - i)


