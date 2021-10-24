"""
Read transactional files in csv format.

"""

import csv

class Transaction_Factory(object):
    translate_target_key = "payee"
    is_translated_key = "is translated"
    account_key = "account"
    header = ["account", "posted date", "payee", "cost", is_translated_key]
    
    account = ""
    rename_columns = dict()
    translations = []
    rows = []

    def __init__(self, account, rename_columns, translations):
        self.account = account
        self.rename_columns = rename_columns
        self.translations = translations    

        if not self.translate_target_key in self.header:
            raise ValueError(
                "{} - must be a column in the header".format(translate_target_key))

    def process_transactions(self, input_filename, output_filename):
        self._read_transactions(input_filename)
        self._transform_transactions()
        self._apply_translations()
        self._write_transactions(output_filename)

    def _read_transactions(self, filename):
        with open(filename, 'r') as csvfile:
            reader = csv.DictReader(csvfile)
            self.rows.append(next(reader))

    def _write_transactions(self, filename):
        with open(filename, 'w') as csvfile:
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

