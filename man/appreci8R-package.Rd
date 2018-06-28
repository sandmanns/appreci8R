\name{appreci8R-package}
\alias{appreci8R-package}
\alias{appreci8R}
\alias{appreci8}
\alias{Variant Filtration}
\docType{package}
\title{
\packageTitle{appreci8R}
}
\description{
\packageDescription{appreci8R}
}
\details{

\packageDESCRIPTION{appreci8R}
For the use of next-generation sequencing in clinical routine valid variant calling results are crucial. However, numerous variant calling tools are available. These tools usually differ in the variant calling algorithsms, the characteristics reported along with the varaint calls, the recommended filtration strategies for the raw calls and thus, also in the output. Especially when calling variants with a low variant allele frequency (VAF), perfect results are hard to obtain. High sensitivity is usually accompanied by low positive predictive value (PPV).

appreci8R is a package for combining and filterating the output of differen variant calling tools according to the 'appreci8'-algorithm. vcf as well as txt files containing variant calls can be evaluated. The number of variant calling tools to consider is unlimited (for the user interface version it is limited to 13). The final output contains a list of variant calls, classified as "probably true", "polymophism" or "artifact".

Important note: Currently, only hg19 is supported.

\packageIndices{appreci8R}
The package contains a function performing the whole analysis using a shiny user interface - \code{appreci8Rshiny}.

Additionally, seven individual functions for performing the seven analysis steps are available:

1) \code{filterTarget}: Exclude all off-target calls from further analysis.

2) \code{normalize}: Normalize calls with respect to reporting indels, MNVs, reporting of several alternate alleles and reporting of complex indels.

3) \code{annotate}: Annotate calls (using VariantAnnotation), and filter the output according to the locations and consequences of interest.

4) \code{combineOutput}: Combine output of the different variant calling tools.

5) \code{evaluateCovAndBQ}: Evaluate coverage and base quality (using Rsamtools), and filter calls with insufficient coverage and/or base quality.

6) \code{determineCharacteristics}: Determine characteristics of the calls, including database check-ups and impact prediction on protein level.

7) \code{finalFiltration}: Perform final filtration according to the appreci8-algorithm.
}
\author{
\packageAuthor{appreci8R}

Maintainer: \packageMaintainer{appreci8R}
}
\references{
More information on appreci8 can be found in our Bioinformatics paper: appreci8: A Pipeline for Precise Variant Calling Integrating 8 Tools \url{https://doi.org/10.1093/bioinformatics/bty518}.

More information on the performance of eight commonly used variant calling tools can be found in our Scientific Reports paper: Evaluating Variant Calling Tools for Non-Matched Next-Generation Sequencing Data \url{https://www.nature.com/articles/srep43169}
}
\keyword{ package }
\seealso{
\code{\link{appreci8Rshiny}}, \code{\link{filterTarget}}, \code{\link{normalize}}, \code{\link{annotate}}, \code{\link{combineOutput}}, \code{\link{evaluateCovAndBQ}}, \code{\link{determineCharacteristics}}, \code{\link{finalFiltration}}
}
\examples{
output_folder<-""
\donttest{
target<-bedFileWithTargetRegions
targetFiltered<-list()

caller_folder<-"/test/gatk/"
targetFiltered[[1]]<-filterTarget(output_folder, "GATK", caller_folder,
                                  ".rawMutations", ".vcf", TRUE, "", "")

caller_folder<-"/test/varscan/"
targetFiltered[[2]]<-filterTarget(output_folder, "VarScan", caller_folder,
                                  "", ".txt", FALSE, "_snvs", "_indels", 1 ,
                                  2 , 3, 4)

normalized<-list()
normalized[[1]]<-normalize(output_folder, "GATK", targetFiltered[[1]], FALSE,
                           FALSE)
normalized[[2]]<-normalize(output_folder, "VarScan", targetFiltered[[2]], TRUE,
                           FALSE)

annotated<-list()
annotated[[1]]<-annotate(output_folder, "GATK", normalized[[1]],
                         locations = c("coding","spliceSite"),
                         consequences = c("nonsynonymous","frameshift","nonsense"))
annotated[[2]]<-annotate(output_folder, "VarScan", normalized[[2]],
                         locations = c("coding","spliceSite"),
                         consequences = c("nonsynonymous","frameshift","nonsense"))

combined<-combineOutput(output_folder, c("GATK","VarScan"), annotated)

bam_folder<-"/test/alignment/"
filtered<-evaluateCovAndBQ(output_folder, combined, bam_folder)

databases<-determineCharacteristics(output_folder, filtered,
                                    predict = "Provean")

final<-finalFiltration(output_folder, frequency_calls = filtered,
                       database_calls = databases, combined_calls = combined,
                       damaging_safe = -3, tolerated_safe = -1.5, primer = NA,
                       hotspots = NA, overlapTools = c("VarScan"))
}
}
