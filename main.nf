#!/usr/bin/env nextflow

// Include processes
include { REFINDEX } from './processes/refindex.nf'
include { FAINDEX }  from './processes/faindex.nf'

// Logging pipeline information
log.info """\
\033[0;36m   ==========================================  \033[0m
\033[0;36m                   R E F   I N D E X           \033[0m
\033[0;36m   ==========================================  \033[0m

    reference:  ${params.reference}
    bwaidx:     ${params.bwaidx}
    faidx:      ${params.faidx}
    """
    .stripIndent(true)

// Define help
if (params.help) {
    help = """\
            |main.nf: This repository contains a Nextflow pipeline for 
            |BWA index and samtools (fai) index.
            |
            |Required arguments:
            |   --reference     Location of the reference file.
            |                   [default: ${params.reference}]
            |   --bwaidx        Location of the output BWA index files.
            |                   [default: ${params.bwaidx}]
            |   --faidx         Location of the output samtools index file.
            |                   [default: ${params.faidx}]
            |
            |Optional arguments:
            |   -profile        <docker/singularity>
            |
            """.stripMargin()
    // Print the help with the stripped margin and exit
    println(help)
    exit(0)
}

// Define input channels
reference = params.reference ? Channel.fromPath("${params.reference}", checkIfExists: true) : null

// Define the workflow
workflow {
    REFINDEX(reference)
    FAINDEX(reference)
}

// Log pipeline execution summary on completion
workflow.onComplete {
    log.info """\
        Pipeline execution summary
        ---------------------------
        Completed at: ${workflow.complete}
        Duration    : ${workflow.duration}
        Success     : ${workflow.success}
        workDir     : ${workflow.workDir}
        Exit status : ${workflow.exitStatus}
        """
        .stripIndent()
        
    log.info (workflow.success ? "\nDone" : "\nOops")
}