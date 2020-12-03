#!/usr/bin/env nextflow

// Grouping files matching a common prefix (*)

params.pairs = "$baseDir/data/ggal/*_{1,2}.fq"


Channel
    .fromFilePairs( params.pairs )                                     
    .ifEmpty { error "Cannot find any reads matching: ${params.pairs}" }  
    .set { read_pairs }
    
    
process mapping {    
    input:
    set pair_id, file(reads) from read_pairs
  
    output:
    set pair_id, "hits.bam" into bam
  
    """
    echo tophat2 genome.index ${reads}
    echo 'dummy' > hits.bam
    """
}    

bam.println()