\name{appreci8Rshiny}
\alias{appreci8Rshiny}
\title{
A user interface to perform the whole appreci8-analysis
}
\description{
\bold{appreci8R} combines and filters the output of different variant calling tools according to the 'appreci8'-algorithm. The whole analysis-pipeline consists of seven steps. Individual functions for executing these steps are available. However, an additional user-interface is available that enables easy execution of the analysis-pipeline, restarting parts of the pipeline from checkpoints, changing parameters, exporting and importing the configuration and evaluation of the results. The user-interface is opend by executing the function \code{appreci8Rshiny}.
}
\usage{
appreci8Rshiny()
}
\arguments{
No arguments have to be provided.
}
\details{
The user-interface is structured by tabs: \bold{Analysis}, \bold{Overview results} and \bold{Detailed results}.

\bold{Analysis}: The tab is essential for performing the whole analysis. It is further separated into 10 additional tabs:

* \code{Important notes}: General information on prerequisites for performing the analysis and current limitations (only hg19).

* \code{0. Preparations}: Defining the general output folder and the varaint caller input. GATK, Platypus, VarScan, FreeBayes, LoFreq, SNVer, SamTools and VarDict are available as these make up the classical appreci8-pipeline. The tools can be \code{added} or \code{removed}. For every tool the following parameters have to be defined: the folder containing the variant calling results, the output file type (vcf or txt; as vcf is a standardized format, the columns containing chr, pos, ref and alt are assumed to be fixed; when selecting txt, the columns containing chr, pos, ref and alt have to be defined), a possible suffix for naming the output, if MNVs are reported (AG>CT instead of A>C and G>T), if SNVs and indels are reported in one file (if not, what is the suffix for the SNV files and what is the suffix for the indel files?), and how are indels reported. In addition to the eight tools, up to 5 additional tools can be added (select the number and click \code{Go}). In addition to the previous parameters, a name can be defined for each additionally added tool.

* \code{1. Target filtration}: Upload your target region (bed file; chromosome definition without 'chr').

* \code{2. Normalization}

* \code{3. Annotation}: Annotates the variants and filters them according to the selected locations (coding, intron, threeUTR, fiveUTR, intergenic, spliceSite, promoter) and consequences (synonymous, nonsynonymous, frameshift, nonsense, not translated) of interest.

* \code{4. Combine output}

* \code{5. Evaluate Coverage and BQ}: Evaluate coverage and base quality by analyzing the bam files. Calls with insufficient coverage and or base quality are filtered. The following parameters have to be defined: the folder containing the bam- and bai files, minimum coverage, minimum number of reads carrying the alternate allele, minimum VAF, minimum base quality and the maximum difference in base quality between reference and alternative.

* \code{6. Extended Set of Characteristics}: Select the databases you would like to query (dbSNP, 1000Genomes, ExAC, ESP6500, Genome Aggregation Database, COSMIC, ClinVar) and the source you would like to use for impact prediction (SIFT, Provean, PolyPhen2).

* \code{7. Final Filtration}: Adjust parameters and define input for the final filtration. A bed file containing the primer positions can be uploaded (optional). A txt file containing expected/hotspot mutations (defined via gene, mutation on AA level, and an optional minimum VAF) can be uploaded (optional). Stricter thresholds for coverage and base quality can be defined (see parameters for \code{5. Evaluate Coverage and BQ}). The number of samples making a call striking can be defined. Dependent on the previously selected source for impact prediction (SIFT, Provean, PolyPhen2), a threshold can be defined to identify reliable damaging predictions and reliable tolerated prediction. Furthermore, the default scoring for the artifact- and the polymorphism score can be changed (just recommended for experts).

* \code{Action}: The complete analysis can be executed (\code{Start complete analysis}). The availability of checkpoints can be checked (\code{Check for possible checkpoints}). If checkpoints are available, one can be selected and the analysis can be started from the selected checkpoint. The defined configuration can be exported (\code{Export current configuration}) as well as imported (\code{Import configuration}). Press \code{Done} if you are done with your analysis.

\bold{Overview results}: The tab provides an overview of the results. It is further separated into 5 additional tabs:

* \code{Log}: The log of the analysis is displayed here. In case of errors, e.g. input not being available, these messages are also reported in the log.

* \code{Raw Calls}: The raw number of calls per sample and per caller are reported.

* \code{Calls On Target}: The number of calls on target per sample and per caller are reported.

* \code{Annotaed Calls}: The number of annotated (and filtered according to annotation) calls per sample and per caller are reported.

* \code{Filtered Calls}: The number of coverage and base quality filtered calls per sample is reported.

\bold{Detailed results}: The tab provides detailed information on the results. It is further separated into 3 additional tabs:

* \code{Mutations}: Variant calls classified as likely true mutations.

* \code{Polymorphisms}: Variant calls classified as likely polymorphisms.

* \code{Artifacts}: Variant calls classified as likely artifacts.
}
\value{
No value is returned.
}
\author{
Sarah Sandmann <sarah.sandmann@uni-muenster.de>
}
\seealso{
\code{\link{appreci8R}}, \code{\link{filterTarget}}, \code{\link{normalize}}, \code{\link{annotate}}, \code{\link{combineOutput}}, \code{\link{evaluateCovAndBQ}}, \code{\link{determineCharacteristics}}, \code{\link{finalFiltration}}
}
\examples{
\donttest{
appreci8Rshiny()
}
}
