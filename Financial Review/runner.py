import argparse
from boa_transactions import BoA_Transaction

BOA_PROCESSOR_ARG = "boa"
boa = BoA_Transaction()

parser = argparse.ArgumentParser(description="Financial runner argument parser")
parser.add_argument(
    '-bank', choices=[BOA_PROCESSOR_ARG],help='Transaction processor')
parser.add_argument(
    '-ifp', help='Input file path')
parser.add_argument(
    '-ofp', help='Output file path')


args = parser.parse_args()
print(args.bank)
print(BOA_PROCESSOR_ARG)
if args.bank == BOA_PROCESSOR_ARG:
    print("process boa")
    boa.process_transactions(args.ifp, args.ofp)
