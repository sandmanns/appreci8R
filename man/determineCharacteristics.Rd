\name{determineCharaceristics}
\alias{determineCharacteristics}
\title{
Determine characteristics of the calls
}
\description{
\bold{appreci8R} combines and filters the output of different variant calling tools according to the 'appreci8'-algorithm. In the 6th analysis step, an extended set of characteristics for all calls is determined. This includes database check-ups and impact prediction on protein level. A GRanges object with all calls, their database information and their predicted impact is reported.
}
\usage{
determineCharacteristics(output_folder, frequency_calls_g, predict,
                         dbSNP = TRUE, `1kgenomes` = TRUE, exacDB = TRUE,
                         espDB = TRUE, gadDB = TRUE, cosmicDB = TRUE,
                         clinvarDB = TRUE)
}
\arguments{
  \item{output_folder}{
The folder to write the output files into. If an empty string is provided, no files are written out.
}
  \item{frequency_calls_g}{
A GRanges object. The GRanges object contains one call per line. EvaluateCovAndBQ()-output can directly be taken as input.
}
  \item{predict}{
String defining the prediction tool to use (accepted strings are: SIFT, Provean, PolyPhen2)
}
  \item{dbSNP}{
Query dbSNP (144.GRCh37) for the presence of your variants (\code{TRUE} or \code{FALSE}; default \code{TRUE}).
}
  \item{1kgenomes}{
Query 1000 Genomes (phase3) for the presence of your variants (\code{TRUE} or \code{FALSE}; default \code{TRUE}).
}
  \item{exacDB}{
Query ExAC (r1.0) for the presence of your variants (\code{TRUE} or \code{FALSE}; default \code{TRUE}).
}
  \item{espDB}{
Query ESP6500 (V2) for the presence of your variants (\code{TRUE} or \code{FALSE}; default \code{TRUE}).
}
  \item{gadDB}{
Query Genome Aggregation Database (r2.0.1) for the presence of your variants (\code{TRUE} or \code{FALSE}; default \code{TRUE}).
}
  \item{cosmicDB}{
Query COSMIC (67) for the presence of your variants (\code{TRUE} or \code{FALSE}; default \code{TRUE}).
}
  \item{clinvarDB}{
Query ClinVar (via rentrez) for the presence of your variants (\code{TRUE} or \code{FALSE}; default \code{TRUE}).
}
}
\details{
The function \code{evaluateCharacteristics} determines an extended set of characteristics for the normalized, annotated, coverage and base quality filtered calls. This includes database check-ups and impact prediction on protein level:

First, the database check-up is performed. At a maximum, dbSNP, 1000Genomes, ExAC, ESP6500, Genome Aggregation Database, COSMIC and ClinVar can be checked. If all the variables are set to \code{FALSE}, no database is checked and none will be reported. Thus, the check-up can be disabled.

Second, the impact perdiction on protein level is performed. Impact can be predicted using either SIFT, Provean or PolyPhen2. In any case, the prediction is performed on the basis of rs-IDs. For every call, the predicted effect as well as the score is reported.
}
\value{
A GRanges Object is returned containing all calls, information on their presence in the selected databases and information on the predicted effect. Reported metadata columns are (if all databases are selected): SampleID, Ref, Alt, dbSNP (containing the rs-ID), dbSNP_MAF, G1000_AF, ExAC_AF, ESP6500_AF, GAD_AF, CosmicID, Cosmic_Counts (number of Cosmic entries), ClinVar, Prediction (damaging or neutral), Score (on the basis of the selected prediction tool), c. (variant on cDNA level containing position and variant), c.complement (complement of the variant; if c. is c.5284A>G, then c.complement is c.5284T>C), p. (variant on protein level containing position and amino acids).

If an output folder is provided, the output is saved as Results_Databases.txt.
}
\author{
Sarah Sandmann <sarah.sandmann@uni-muenster.de>
}
\seealso{
\code{\link{appreci8R}}, \code{\link{appreci8Rshiny}}, \code{\link{filterTarget}}, \code{\link{normalize}}, \code{\link{annotate}}, \code{\link{combineOutput}}, \code{\link{evaluateCovAndBQ}}, \code{\link{finalFiltration}}
}
\examples{
library("GenomicRanges")
filtered<-GRanges(seqnames = c("4"),
                  ranges = IRanges(start = c (106196951),
                                   end = c (106196951)), SampleID = c("Sample2"),
                  Ref = c("A"), Alt = c("G"), Location = c("coding,coding"),
                  c. = c("5284,5347"), p. = c("1762,1783"),
                  AA_ref = c("I,I"), AA_alt = c("V,V"),
                  Codon_ref = c("ATA,ATA"), Codon_alt = c("GTA,GTA"),
                  Consequence = c("nonsynonymous,nonsynonymous"),
                  Gene = c("TET2,TET2"), GeneID = c("54790,54790"),
                  TranscriptID = c("18308,18309"), GATK = c(1),
                  VarScan = c(NA), Nr_Ref = c(1268), Nr_Alt = c(1283),
                  DP = c(2551), VAF = c(0.50294), BQ_REF = c(38.66798),
                  BQ_ALT = c(38.8145), Nr_Ref_fwd = c(428),
                  Nr_Alt_fwd = c(469), DP_fwd = c(897),
                  VAF_fwd = c(0.522854), Nr_Ref_rev = c(840),
                  Nr_Alt_rev = c(814), DP_rev = c(1654),
                  VAF_rev = c(0.4921403))
\donttest{
characteristics<-determineCharacteristics("", filtered, predict = "Provean")
}
}
