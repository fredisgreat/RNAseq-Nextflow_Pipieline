#!/usr/bin/env nextflow

process BAM_TO_FASTQ {
    container 'ghcr.io/bf528/cellranger:latest'

    input:
    tuple val(name), path(bam)

    output:
    tuple val(name), path("${name}/")

    script:
    """
    cellranger bamtofastq $bam ${name}/
    """
}