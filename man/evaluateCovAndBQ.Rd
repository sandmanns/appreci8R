\name{evaluateCovAndBQ}
\alias{evaluateCovAndBQ}
\title{
Evaluate coverage and base quality
}
\description{
\bold{appreci8R} combines and filters the output of different variant calling tools according to the 'appreci8'-algorithm. In the 5th analysis step, all calls are evaluated with respect to coverage and basequality (using Rsamtools). Calls with insufficient coverage and/or basequality are filtered from further analysis. A data.frame with all calls featuring sufficient coverage and basequality is returned.
}
\usage{
evaluateCovAndBQ(output_folder, combined_calls, bam_folder,
                 dp = 50, nr_alt = 20, vaf = 0.01, bq = 15, bq_diff = 7)
}
\arguments{
  \item{output_folder}{
The folder to write the output files into. If an empty string is provided, no files are written out.
}
  \item{combined_calls}{
A data.frame; necessary input object. The data.frame contains one call per line. CombineOutput()-output can directly be taken as input.
}
  \item{bam_folder}{
The folder containing the bam- and bai-files for every sample. The file names have to match the sample names, i.e. Sample1.bam and Sample1.bai if Sample1.vcf (without any defined suffixes) was analyzed for caller1.
}
  \item{dp}{
Minimum depth that is required for a call to pass the filter (default: 50).
}
  \item{nr_alt}{
Minimum number of reads carrying the alternate allele that is required for a call to pass the filter (default: 20).
}
  \item{vaf}{
Minimum VAF that is required for a call to pass the filter (default: 0.01).
}
  \item{bq}{
Minimum base quality that is required for a call to pass the filter (default: 15; values above 44 not recommended).
}
  \item{bq_diff}{
Maximum difference in basequality between reference and alternative that is allowed for a call to pass the filter (default: 7).
}
}
\details{
The function \code{evaluateCovAndBQ} evaluates coverage and base quality of all calls and filteres them according to user-definable thresholds. Only those calls that feature sufficient coverage and base quality are reported. Filtration is performed in a 2-step procedure:

First, coverage is evaluated using Rsamtools \code{pileup} and a threshold of \code{min_base_quality=0}. If depth is below the defined threshold \code{dp} and/or the number of reads carrying the alternate allele is below the defined threshold \code{nr_alt} and/or VAF is below the defined threshold \code{VAF}, a call is excluded. However, if coverage is sufficient, base quality - which is more time-consuming - is evaluated.

To evaluate base quality, the threshold for \code{min_base_quality} is successively increased from 0 to 44 (thus, no values above 44 are recommended for \code{bq}). The average base quality for all reads carrying the reference and the alternate allele is calculated. For indels, which are always summed up as ``+'' by Rsamtools, no base quality can be determined. If the average base quality of the alternate allele is lower than \code{bq}, the call is filtered. If ``average base quality reference allele'' - ``average base quality alternate allele'' is higher than \code{bq_diff}, the call is filtered.

Coverage is reported with respect to the forward- and reverse reads separately. It is not yet evaluated. This is done in the 7th analysis step (\code{finalFiltration}).
}
\value{
A data.frame is returned containing all calls with sufficient coverage and base quality.  Reported columns are: SampleID, Chr, Pos, Ref, Alt, Location, c. (position of variant on cDNA level), p. (position of variant on protein level), AA_ref, AA_alt, Codon_ref, Codon_alt, Consequence, Gene, GeneID, TranscriptID, Caller1 to CallerX (dependent on the number of callers that is evaluated), Nr_Ref, Nr_Alt, DP, VAF, BQ_REF, BQ_ALT, Nr_Ref_fwd, Nr_Alt_fwd, DP_fwd, VAF_rev, Nr_Ref_rev, Nr_Alt_rev, DP_rev, VAF_rev.

If an output folder is provided, the data.frame is saved as Results_Frequency.txt.
}
\author{
Sarah Sandmann <sarah.sandmann@uni-muenster.de>
}
\references{
Rsamtools: \url{http://bioconductor.org/packages/release/bioc/html/Rsamtools.html}
}
\seealso{
\code{\link{appreci8R}}, \code{\link{appreci8Rshiny}}, \code{\link{filterTarget}}, \code{\link{normalize}}, \code{\link{annotate}}, \code{\link{combineOutput}}, \code{\link{determineCharacteristics}}, \code{\link{finalFiltration}}
}
\examples{
combined<-data.frame(SampleID = c("Sample2","Sample1"), Chr = c("4","X"),
                     Pos = c(106196951,15838366), Ref = c("A","C"),
                     Alt = c("G","A"), Location = c("coding,coding","coding"),
                     c. = c("5284,5347","864"), p. = c("1762,1783","288"),
                     AA_ref = c("I,I","N"), AA_alt = c("V,V","K"),
                     Codon_ref = c("ATA,ATA","AAC"),
                     Codon_alt = c("GTA,GTA","AAA"),
                     Consequence = c("nonsynonymous,nonsynonymous","nonsynonymous"),
                     Gene = c("TET2,TET2","ZRSR2"),
                     GeneID = c("54790,54790","8233"),
                     TranscriptID = c("18308,18309","75467"),
                     GATK = c(1,1), VarScan = c(NA,1), stringsAsFactors = FALSE)
bam_folder <- system.file("extdata", package = "appreci8R")
bam_folder <- paste(bam_folder, "/", sep="")
\donttest{
filtered<-evaluateCovAndBQ("", combined, bam_folder)
}
}
