@files = <./24nt.fasta/*.fasta>;

foreach $file (@files) {
    system("perl ./TASR_v.1.0.pipeline/TASR.v.1.0_fixed.pl -ref DH1_v4.fasta -sfile $file -usearchv /home/apps/usearch/usearch-7.0.959 -Blastv NCBI-BLAST+ -indices indices");
}
