for var in `seq 0 1 9`
do
	python generate.py --outdir=./out/cargo/trunc_00$var --trunc=0.$var --seeds=0-9999 --network=./network-snapshot-000080.pkl
done

for var in `seq 1 1 9`
do
	python generate.py --outdir=./out/cargo/trunc_10$var --trunc=-0.$var --seeds=0-9999 --network=./network-snapshot-000080.pkl
done

python generate.py --outdir=./out/cargo/trunc_010 --trunc=1 --seeds=0-9999 --network=./network-snapshot-000080.pkl
python generate.py --outdir=./out/cargo/trunc_110 --trunc=-1 --seeds=0-9999 --network=./network-snapshot-000080.pkl