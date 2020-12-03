#!/usr/bin/env nextflow

// process can receive as input and produce as output tuple of values, which is useful to keep together related meta data.

params.in = "$baseDir/data/sample.fa"
params.db = "$baseDir/blast-db/pdb/tiny"

db_name = file(params.db).name
db_path = file(params.db).parent

Channel
     .fromPath(params.in)
     .splitFasta( record: [id: true, seqString: true ])
     .set { seq }

process blast {
    tag { "seq: $id" }  

    input:
    set id, file('seq.fa') from seq
    file db_path 
    
    output:
    set id, file('out.txt') into blast_result

    """
    blastp -db $db_path/$db_name -query seq.fa -outfmt 6 | head -n 10 > out.txt
    """
}

blast_result.println { id, result -> 
    
    "Blast result for query >> $id\n${result.text}"
    
}