\name{finalFiltration}
\alias{finalFiltration}
\title{
Perform final filtration according to the appreci8-algorithm
}
\description{
\bold{appreci8R} combines and filters the output of different variant calling tools according to the 'appreci8'-algorithm. In the 7th analysis step, the final filtration according to the appreci8-algorithm is performed. A data.frame with all calls and their categorization as ``Probably true'', ``Polymorphism'' or ``Artifact'' is reported.
}
\usage{
finalFiltration(output_folder, frequency_calls, database_calls, combined_calls,
                damaging_safe, tolerated_safe, primer = NA, hotspots = NA,
                overlapTools, nrsamples = 3, dp = 50, nr_alt = 20, vaf = 0.01,
                bq = 15, bq_diff = 7, detectedLow = 2, detectedHigh = 2,
                isIndel = 1, isIndelVAF = 1, detectedLowVAF = 2, noPrimerP = 1,
                primerPAlt = -1, noPrimerPFwd = 1, primerPFwd = -1,
                noPrimerPRev = 1, primerPRev = -1, primerLocation = -1,
                vafLow = 2, databaseVAF = 1, databaseHigh = 1,
                predictionSafe = -1, predictionVAF = 1, nrcaller4 = 4,
                reward4 = -1, nrcaller5 = 5, reward5 = -1, nrcaller6 = 6,
                reward6 = -1, oneCaller = 1, BQ_AltMean = 4, knownHotspot = -3,
                overlapReward = -3, artifactThreshold = 0, polyDetected = 1,
                polyDetectedOnce = -1, polyDatabasesPolyLow = 2,
                polyDatabasesPolyLowReward = 1, polyDatabasesPolyHigh = 4,
                polyDatabasesPolyHighReward = 1, polyDatabasesMut = 2,
                polyDatabasesMutReward = -1, polyNoDatabase = -1,
                polyDatabases = 6, polyDatabasesReward = 1, polyEffect = 1,
                polyVAF = 1, polyPrediction = 1, polyPredictionEffect = -1,
                polyCosmic = 100, polyThresholdCritical = 2, polyThreshold = 3,
                PolymorphismVAF10 = 5, PolymorphismVAF20 = 2,
                PolymorphismFrame = 2)
}
\arguments{
  \item{output_folder}{
The folder to write the output files into. If an empty string is provided, no files are written out.
}
  \item{frequency_calls}{
A data.frame object. The data.frame contains one call per line. EvaluateCovAndBQ()-output can directly be taken as input.
}
  \item{database_calls}{
A data.frame object. The data.frame contains one call per line. EvaluateCharacteristics()-output can directly be taken as input.
}
  \item{combined_calls}{
A data.frame object. The data.frame contains one call per line. CombineOutput()-output can directly be taken as input.
}
  \item{damaging_safe}{
Threshold for the impact prediction score, identifying reliably damaging calls. For example, if Provean has been selected as the impact prediction tool, the internal threshold of the tool is -2.5. However, calls with a score of -2.51 are less likely to have a correct ``Damaging'' prediction compared to calls with a score of -12.0. A threshold of -5.0 for \code{damaging_safe} marks all calls with a score below -5.0 as reliably damaging.
}
  \item{tolerated_safe}{
Threshold for the impact prediction score, identifying reliably tolerated calls. For example, if Provean has been selected as the impact prediction tool, the internal threshold of the tool is -2.5. However, calls with a score of -2.49 are less likely to have a correct ``Neutral'' prediction compared to calls with a score of +7.0. A threshold of -1.0 for \code{tolerated_safe} marks all calls with a score above -1.0 as reliably tolerated.
}
  \item{primer}{
Optional: Data.frame containing primer positions in bed-format, i.e. 1st column chromosome, 2nd column 0-based start position, 3rd column 1-based end position (default: NA).
}
  \item{hotspots}{
Optional: Data.frame containing expected/hotspot mutations: 1st column gene name (e.g. ASXL1), 2nd column mutation on AA level (e.g. G12S or E628fs or I836del or G12 if any AA change at this position is considered an expected/hotspot mutation), 3rd column minimum VAF or NA (default: NA).
}
  \item{overlapTools}{
Vector of strings containing the names of variant calling tools that, should a call be overlappingly reported by these tools, will be rewarded.
}
  \item{nrsamples}{
Threshold for the number of samples. Shold a variant be detected in more than the threshold defined by \code{nrsamples}, it will be interpreted as possible evidence for an artifact (default: 3).
}
  \item{dp}{
Minimum depth that is required for a call (default: 50).
}
  \item{nr_alt}{
Minimum number of reads carrying the alternate allele that is required for a call (default: 20).
}
  \item{vaf}{
Minimum VAF that is required for a call (default: 0.01).
}
  \item{bq}{
Minimum base quality that is required for a call (default: 15; values above 44 not recommended).
}
  \item{bq_diff}{
Maximum difference in basequality between reference and alternative that is allowed for a call (default: 7).
}
  \item{detectedLow}{
Value added to the artifact score if more than \code{nrsamples} number of samples feature the same call (default: 2).
}
  \item{detectedHigh}{
Value added to the artifact score if more than 50\% of the samples analyzed (if more than 1 sample is analyzed) feature the same call, which is not an expected/hotspot mutation (default: 2).
}
  \item{isIndel}{
Value added to the artifact score if the call is an indel (default: 1).
}
  \item{isIndelVAF}{
Value added to the artifact score if the call is an indel and the VAF is below 0.05 (default: 1).
}
  \item{detectedLowVAF}{
Value added to the artifact score if more than \code{nrsamples} number of samples feature the same call and the VAF is above 0.85 (default: 2).
}
  \item{noPrimerP}{
Value added to the artifact score if no primer information is provided or no primer is located at this position and the p value (Fisher's Exact Test evaluating forward and reverse reads to determine strandbias) is below 0.001 (default: 1).
}
  \item{primerPAlt}{
Value added to the artifact score if no primer information is provided or no primer is located at this position and the p value (Fisher's Exact Test evaluating forward and reverse reads to determine strandbias) is below 0.001 and Nr_Alt_fwd is at least \code{Nr_Alt/2} and Nr_Alt_rev is at least \code{Nr_Alt/1} (default: -1).
}
  \item{noPrimerPFwd}{
Value added to the artifact score if no primer information is provided or no primer is located at this position and the p value (Fisher's Exact Test evaluating forward and reverse reads to determine strandbias) is at least 0.001 and Nr_Ref_fwd is at least \code{(DP-Nr_Alt)/2} and Nr_Alt_fwd is below 3 (default: 1).
}
  \item{primerPFwd}{
Value added to the artifact score if no primer information is provided or no primer is located at this position and the p value (Fisher's Exact Test evaluating forward and reverse reads to determine strandbias) is below 0.001 and Nr_Ref_fwd is below \code{(DP-Nr_Alt)/2} and Nr_Alt_fwd is below 3 (default: -1).
}
  \item{noPrimerPRev}{
Value added to the artifact score if no primer information is provided or no primer is located at this position and the p value (Fisher's Exact Test evaluating forward and reverse reads to determine strandbias) is at least 0.001 and Nr_Ref_rev is at least \code{(DP-Nr_Alt)/2} and Nr_Alt_rev is below 3 (default: 1).
}
  \item{primerPRev}{
Value added to the artifact score if no primer information is provided or no primer is located at this position and the p value (Fisher's Exact Test evaluating forward and reverse reads to determine strandbias) is below 0.001 and Nr_Ref_rev is below \code{(DP-Nr_Alt)/2} and Nr_Alt_rev is below 3 (default: -1).
}
  \item{primerLocation}{
Value added to the artifact score if a call is located at a position where a primer is located (default: -1).
}
  \item{vafLow}{
Value added to the artifact score if the VAF is below 0.02 (default: 2).
}
  \item{databaseVAF}{
Value added to the artifact score if the VAF is below 0.10 and the variant was not found in any database (default: 1).
}
  \item{databaseHigh}{
Value added to the artifact score if the variant was detected in at least 50\% of all samples, but not found in any database (default: 1).
}
  \item{predictionSafe}{
Value added to the artifact score if the variant has a reliable damaging prediction (default: -1).
}
  \item{predictionVAF}{
Value added to the artifact score if the variant has a reliable tolerated prediction and a VAF below 0.35 or between 0.65 and 0.85 (default: 1).
}
  \item{nrcaller4}{
Intermediate number of callers that overlappingly reported a variant (default: 4).
}
  \item{reward4}{
Value added to the artifact score if a variant is overlappingly reported by \code{nrcaller4} callers (default: -1).
}
  \item{nrcaller5}{
High number of callers that overlappingly reported a variant (default: 5).
}
  \item{reward5}{
Value added to the artifact score if a variant is overlappingly reported by \code{nrcaller5} callers (default: -1).
}
  \item{nrcaller6}{
Very high number of callers that overlappingly reported a variant (default: 6).
}
  \item{reward6}{
Value added to the artifact score if a variant is overlappingly reported by \code{nrcaller6} callers (default: -1).
}
  \item{oneCaller}{
Value added to the artifact score if a variant is only reported by one caller (default: 1).
}
  \item{BQ_AltMean}{
Value added to the artifact score if the base quality of a variant is below \code{mean(BQ_Alt)-3*(BQ_Alt)} over all variants (default: 4).
}
  \item{knownHotspot}{
Value added to the artifact score if a variant is an expected/hotspot mutation (default: -3).
}
  \item{overlapReward}{
Value added to the artifact score if a variant is overlappingly reported by the tools defined in \code{overlapTools} (default: -3).
}
  \item{artifactThreshold}{
Threshold for the artifact score, i.e. variants with a score below this threshold will be categorized as ``probably true'' (default: 0).
}
  \item{polyDetected}{
Value added to the polymorphism score if more than \code{nrsamples} number of samples feature the same call (default: 1).
}
  \item{polyDetectedOnce}{
Value added to the polymorphism score if a variant is only detected in one sample (default: -1).
}
  \item{polyDatabasesPolyLow}{
Intermediate number of polymorphism databases that have information on a variant (default: 2).
}
  \item{polyDatabasesPolyLowReward}{
Value added to the polymorphism score if a variant is present in at least \code{polyDatabasesPolyLow} databases (default: 1).
}
  \item{polyDatabasesPolyHigh}{
High number of polymorphism databases that have information on a variant (default: 4).
}
  \item{polyDatabasesPolyHighReward}{
Value added to the polymorphism score if a variant is present in at least \code{polyDatabasesPolyHigh} databases (default: 1).
}
  \item{polyDatabasesMut}{
Critical number of mutation databases that have information on a variant (default: 2).
}
  \item{polyDatabasesMutReward}{
Value added to the polymorphism score if a variant is present in at least \code{polyDatabasesMut} databases (default: -1).
}
  \item{polyNoDatabase}{
Value added to the polymorphism score if a variant is not present in any polymorphism database (default: -1).
}
  \item{polyDatabases}{
High number of databases that have information on a variant (default: 6).
}
  \item{polyDatabasesReward}{
Value added to the polymorphism score if a variant is present in at least \code{polyDatabases} databases (default: 1).
}
  \item{polyEffect}{
Value added to the polymorphism score if a variant is not a frameshift variant, not a stop gain variant and not a stop lost variant (default: 1).
}
  \item{polyVAF}{
Value added to the polymorphism score if the VAF of a variant is between 0.65 and 0.35 or above 0.85 (default: 1).
}
  \item{polyPrediction}{
Value added to the polymorphism score if the variant has a reliable tolerated prediction (default: 1).
}
  \item{polyPredictionEffect}{
Value added to the polymorphism score if a variant has a reliable damaging prediction or is a stop gain variant or is a stop lost variant (default: -1).
}
  \item{polyCosmic}{
Critical number of COSMIC entries (default: 100).
}
  \item{polyThresholdCritical}{
Threshold for the polymorphism score if the number of COSMIC entries is not critical, i.e. variants with at least this score will be categorized as ``polymorphism'' (default: 2).
}
  \item{polyThreshold}{
Threshold for the polymorphism score if the number of COSMIC entries is critical, i.e. variants with at least this score will be categorized as ``polymorphism'' (default: 3).
}
  \item{PolymorphismVAF10}{
Value added to the artifact score if a variant is a ``polymorphism'' based on the polymorphism score, but the VAF is below 0.10 (default: 5).
}
  \item{PolymorphismVAF20}{
Value added to the artifact score if a variant is a ``polymorphism'' based on the polymorphism score, but the VAF is below 0.20 (default: 2).
}
  \item{PolymorphismFrame}{
Value added to the artifact score if a variant is a ``polymorphism'' based on the polymorphism score, but it is a frameshift variant (default: 2).
}
}
\details{
The function \code{finalFiltration} performs the final filtration according to the appreci8-algorithm. The previously determined characteristics of the calls are evaluated and an automatic categorization of the calls is performed. Possible categories are: Probably true or Hotspot, Polymorphism and Artifact. Final filtration consists of several steps:

1) Frequency and base quality are re-considered. Stricter thresholds compared to \code{evaluateCovAndBQ} can be defined.

2) Samples with the same call are considered. Counting is based on the normalized and annotated calls, not on the coverage- and base quality filtered calls.

3) Samples with a call at the same position are considered (e.g. A>AG at pos 1 in sample 1 and A>AGG at pos 1 in sample 2 are reported as 2 calls at the same position). Counting is based on the normalized and annotated calls, not on the coverage- and base quality filtered calls.

4) Background information is considered. The number of samples with the same variant in the coverage- and base quality filtered data are considered.

5) Number of databases is considered. Dependent on the previously selected number of databases. The presence of a variant in mutation- and polymorphism databases is evaluated.

6) VAF in relation to a predicted effect is considered. Variants are marked if their VAF is typical of polymorphisms and their predicted effect is ``tolerated''.

7) VAF in relation to the number of samples is considered. Variants are marked if they are detected in more than \code{nrsamples} samples and the VAF is at least 0.85 in more than 90\% of these samples.

8) Strandbias is considered. Fisher's Exact Test is performed to analyze the relation between forward-reverse and reference-alternate allele.

9) Hotspot list - if any is provided - is considered. Variants are marked if they are present on the hotspot list.

10) Final filtration is performed. The artifact- and the polymorphism score are calculated. On the basis of these two scores, a call is either classified as a probably true/hotspot call, polymorphism or artifact.
}
\value{
A data.frame is returned containing all calls with a predicted category. Categories can be: probably true, hotspot, polymorphism or artifact. Reported columns are: SampleID, Chr, Pos, Ref, Alt, Gene, GeneID, TranscriptID, Location, Consequence, c. (variant on cDNA level containing position and variant), c.complement (complement of the variant; if c. is c.5284A>G, then c.complement is c.5284T>C), p. (variant on protein level containing position and amino acids), Codon_ref, Codon_alt, Nr_Ref, Nr_Alt, DP, VAF, Caller1 to CallerX (dependent on the number of callers that is evaluated), dbSNP (containing the rs-ID), dbSNP_MAF, G1000_AF, ExAC_AF, ESP6500_AF, GAD_AF, CosmicID, Cosmic_Counts (number of Cosmic entries), ClinVar, Prediction (damaging or neutral), Score (on the basis of the selected prediction tool), BQ_REF, BQ_ALT, Nr_Ref_fwd, Nr_Alt_fwd, DP_fwd, VAF_rev, Nr_Ref_rev, Nr_Alt_rev, DP_rev, VAF_rev, strandbias, nr_samples (number of samples with the same variant), nr_samples_similar (number of samples with a variant at the same position), Category.

If an output folder is provided, the data.frame is saved as Results_Final.txt. Additionally, Results_Final.xlsx is saved, containing three sheets: Mutations, Polymorphisms and Artifacts.
}
\author{
Sarah Sandmann <sarah.sandmann@uni-muenster.de>
}
\seealso{
\code{\link{appreci8R}}, \code{\link{appreci8Rshiny}}, \code{\link{filterTarget}}, \code{\link{normalize}}, \code{\link{annotate}}, \code{\link{combineOutput}}, \code{\link{evaluateCovAndBQ}}, \code{\link{determineCharacteristics}}
}
\examples{
filtered<-data.frame(SampleID = c("Sample2","Sample1"), Chr = c("4","X"),
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
                     GATK = c(NA,1), VarScan = c(1,NA), Nr_Ref = c(1268,1991),
                     Nr_Alt = c(1283,31), DP = c(2551,3630),
                     VAF = c(0.5029,0.0085), BQ_REF = c(38.67,37.46),
                     BQ_ALT = c(38.81,18.00), Nr_Ref_fwd = c(428,839),
                     Nr_Alt_fwd = c(469,0), DP_fwd = c(897,1507),
                     VAF_fwd = c(0.5229,0.0000), Nr_Ref_rev = c(840,1152),
                     Nr_Alt_rev = c(814,31), DP_rev = c(1654,2123),
                     VAF_rev = c(0.4921,0.0146), stringsAsFactors = FALSE)
databases<-cbind(filtered[,1:5],data.frame(dbSNP = c("rs2454206",NA),
                                           dbSNP_MAF = c(0.2304,NA),
                                           G1000_AF = c(0.23,0.44),
                                           ExAC_AF = c(0.27,0.47),
                                           ESP6500_AF = c(0.29,0.49),
                                           GAD_AF = c(0.30,0.47),
                                           CosmicID = c(NA,NA),
                                           Cosmic_Counts = c(NA,NA),
                                           ClinVar = c(NA,NA),
                                           Prediction = c("Neutral",NA),
                                           Score = c(-0.061,NA),
                                           c. = c("c.5284A>G,c.5347A>G","c.864C>A"),
                                           c.complement = c("c.5284T>C,c.5347T>C","c.864G>T"),
                                           p. = c("p.I1762V,p.I1783V","p.N288K"),
                                           stringsAsFactors = FALSE))
combined=filtered[,1:18]

final<-finalFiltration("", frequency_calls = filtered,
                       database_calls = databases, combined_calls = combined,
                       damaging_safe = -3, tolerated_safe = -1.5,
                       overlapTools = c("VarScan"), bq_diff = 20,vaf = 0.001)
}
