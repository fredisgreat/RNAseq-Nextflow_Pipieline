include {DOWNLOAD_BAM} from './modules/download_bam'
include {BAM_TO_FASTQ} from './modules/bamtofastq'

workflow {

Channel.fromPath("samplesheet.csv")
    .splitCsv(header:true)
    .map { row -> tuple(row.sample, row.ftp) }
    .set { bam_download_ch }

DOWNLOAD_BAM(bam_download_ch)
BAM_TO_FASTQ(DOWNLOAD_BAM.out)

}
