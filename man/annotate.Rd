\name{annotate}
\alias{annotate}
\title{
Annotate and filter calls
}
\description{
\bold{appreci8R} combines and filters the output of different variant calling tools according to the 'appreci8'-algorithm. In the 3rd analysis step, all calls are annotated (using VariantAnnotation) and filtered according to the selected locations and consequences of interest. A GRanges object with all annotated calls is returned.
}
\usage{
annotate(output_folder, caller_name, normalized_calls_g, locations,
                     consequences)
}
\arguments{
  \item{output_folder}{
The folder to write the output files into. If an empty string is provided, no files are written out.
}
  \item{caller_name}{
Name of the variant calling tool (only necessary if an output folder is provided).
}
  \item{normalized_calls_g}{
A GRanges object. One normalized variant call per line. Necessary metadata columns are: SampleID, Ref, Alt. Normalize()-output can directly be taken as input.
}
  \item{locations}{
A vector containing the locations of interest. Accepted values are: coding, intron, threeUTR, fiveUTR, intergenic, spliceSite, promoter.
}
  \item{consequences}{
A vector containing the consequences of interest. Accepted values are: synonymous, nonsynonymous, frameshift, nonsense, not translated.
}
}
\details{
The function \code{annotate} performs annotations of all variants in the input GRanges object (according to VariantAnnotation) and filteres the annotated calls with respect to the selected locations and consequences of interest (based on the functions \code{locateVariants} and \code{predictCoding} of the package VariantAnnotation). At least one location of interest has to be chosen. If - among others - ``coding'' is selected, at least one consequence of interest has to be chosen as well.

All possible transcripts are investigated. If ``coding'' is chosen and a variant is annotated as ``coding'' in only 1 out of many transcripts, the matching transcript is, together with the annotation information, reported. All the other non-matching transcripts are not reported.
}
\value{
A GRanges object is returned containing only the calls at the selected locations of interest and with the selected consequences of interest. Reported metadata columns are: SampleID, Ref, Alt, Location, c. (position of variant on cDNA level), p. (position of variant on protein level), AA_ref, AA_alt, Codon_ref, Codon_alt, Consequence, Gene, GeneID, TranscriptID. TxDb.Hsapiens.UCSC.hg19.knownGene is used for annotation. Whenever there is more than one transcriptID, all of them are reported, separated by commas. The first transcriptID matches the first entry under Location, c., p. etc.

If an output folder is provided, the output is saved as <caller_name>.annotated.txt.
}
\author{
Sarah Sandmann <sarah.sandmann@uni-muenster.de>
}
\references{
VariantAnnotation: \url{https://www.bioconductor.org/packages/release/bioc/html/VariantAnnotation.html}
}
\seealso{
\code{\link{appreci8R}}, \code{\link{appreci8Rshiny}}, \code{\link{filterTarget}}, \code{\link{normalize}}, \code{\link{combineOutput}}, \code{\link{evaluateCovAndBQ}}, \code{\link{determineCharacteristics}}, \code{\link{finalFiltration}}
}
\examples{
library("GenomicRanges")
input <- GRanges(seqnames = c("2","X","4","21"),
                 ranges = IRanges(start = c (25469504,15838366,106196951,36164405),
                                  end = c (25469504,15838366,106196951,36164405)),
                 SampleID = c("Sample1","Sample1","Sample2","Sample2"),
                 Ref = c("G","C","A","G"),
                 Alt = c("T","A","G","T"))
\donttest{
annotated<-annotate("", "", input,
                    locations = c("coding","spliceSite"),
                    consequences = c("nonsynonymous","frameshift","nonsense"))
}}
