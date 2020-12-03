#!/usr/bin/env nextflow

params.query = "$baseDir/data/sample.fa"
params.db = "$baseDir/blast-db/pdb/tiny"

proteins = file(params.query)
db_name = file(params.db).name
db_path = file(params.db).parent

process blastJob {

  input:
  file 'query.fa' from proteins
  file db_path

  """ 
  blastp -query query.fa -db $db_path/$db_name -outfmt 6
  """

}