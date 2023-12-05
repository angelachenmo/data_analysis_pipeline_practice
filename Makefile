# Makefile
# Angela Chen 2023 Dec 4th
# Adapted from Tiffany Timbers

# This driver scripippt completes the textual analysis of
# 3 novels and creates figures on the 10 most frequently
# occuring words from each of the 3 novels. This script
# takes no arguments.

# example usage:
# make all

all : report/_build/html/index.html

# count the words
results/isles.dat: data/isles.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=data/isles.txt \
	--output_file=results/isles.dat

results/abyss.dat: data/abyss.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=data/abyss.txt \
	--output_file=results/abyss.dat

results/last.dat: data/last.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=data/last.txt \
	--output_file=results/last.dat

results/sierra.dat: data/sierra.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=data/sierra.txt \
	--output_file=results/sierra.dat

# create the plots
results/figure/isles.png: results/isles.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=results/isles.dat \
	--output_file=results/figure/isles.png

results/figure/abyss.png: results/abyss.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=results/abyss.dat \
	--output_file=results/figure/abyss.png

results/figure/last.png: results/last.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=results/last.dat \
	--output_file=results/figure/last.png

results/figure/sierra.png: results/sierra.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=results/sierra.dat \
	--output_file=results/figure/sierra.png

# write the report
report/_build/html/index.html : report/count_report.ipynb \
	report/_toc.yml \
	report/_config.yml
	jupyter-book build report

clean:
	rm -f results/isles.dat
	rm -f results/figure/isles.png
	rm -f results/abyss.dat
	rm -f results/figure/abyss.png
	rm -f results/last.dat
	rm -f results/figure/last.png
	rm -f results/sierra.dat
	rm -f results/figure/sierra.png
	rm -f report/_build/html/index.html


