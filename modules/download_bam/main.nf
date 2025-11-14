#!/usr/bin/env nextflow

process DOWNLOAD_BAM {
   
    input:
    tuple val(sample), val(url)

    output:
    tuple val(sample), path('*bam*')

    script:
    """
    wget $url
    """
}