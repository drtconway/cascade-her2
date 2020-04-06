#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --job-name="htseq_all"
#SBATCH --time=0-120:00:00
#SBATCH --mail-type=ALL,TIME_LIMIT_80,TIME_LIMIT_90
#SBATCH --mail-user=franco.caramia@petermac.org
#SBATCH --mem=16G
#SBATCH --output="./logs/%j.out" # lets call the file "<jobID>"
#SBATCH --error="./logs/%j.err" # lets call the file "<jobID>"
#SBATCH --partition=prod
module load samtools/0.1.18
module load java
module load pmc-utils
module load pmc-scripts
module load ensembl/78
module load picard/1.141
module load bpipe/0.9.8.6_rc2
module load igvtools
module load perl-modules
module load R
module load vcftools
module load bedtools/2.21
module load htseq
module load pipeline
module load seqliner/dev
bamdir=$1
samps=$2
outdir=$3
srun -n 1 seqliner run rna_htseq_count_all -o ${outdir} -r rna_mm10,pairedEnd,rna_directional ${bamdir} ${samps}
