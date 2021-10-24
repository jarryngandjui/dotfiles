import argparse
from boa_transactions import BoA_Transaction
from capital_one_transaction import Capital_One_Transaction

BOA_PROCESSOR_ARG = "boa"
CAPITAL_ONE_PROCESSOR_ARG = "capone"

boa = BoA_Transaction()
capone = Capital_One_Transaction()

parser = argparse.ArgumentParser(description="Financial runner argument parser")
parser.add_argument(
    '-bank', choices=[BOA_PROCESSOR_ARG],help='Transaction processor')
parser.add_argument(
    '-ifp', help='Input file path')

args = parser.parse_args()
if args.bank == BOA_PROCESSOR_ARG:
    boa.process_transactions(args.ifp)
if args.bank == CAPITAL_ONE_PROCESSOR_ARG:
    capone.process_transactions(args.ifp)
