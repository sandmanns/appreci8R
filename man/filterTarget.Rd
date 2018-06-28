\name{filterTarget}
\alias{filterTarget}
\title{
Excludes all off-target calls from further analysis.
}
\description{
\bold{appreci8R} combines and filters the output of different variant calling tools according to the 'appreci8'-algorithm. In the 1st analysis step, all off-target calls are excluded from further analysis. A list of data.frames (one list per sample) with all on-target calls is returned.
}
\usage{
filterTarget (output_folder, caller_name, caller_folder, caller_file_names_add,
              caller_file_type, caller_snv_indel, caller_snv_names_add,
              caller_indel_names_add, caller_chr = 1, caller_pos = 2,
              caller_ref = 4, caller_alt = 5, targetRegions)
}
\arguments{
  \item{output_folder}{
The folder to write the output files into. If an empty string is provided, no files are written out.
}
  \item{caller_name}{
Name of the variant calling tool (only necessary if an output folder is provided).
}
  \item{caller_folder}{
Folder containing the variant calling results.
}
  \item{caller_file_names_add}{
Suffix for naming the variant calling files. If an empty string is provided, it is assumed that the files only contain the sample name, e.g. "Sample1.vcf".
}
  \item{caller_file_type}{
File type of the variant calling results (".vcf" or ".txt").
}
  \item{caller_snv_indel}{
SNVs and indels are reported in the same file (\code{TRUE} or FALSE).
}
  \item{caller_snv_names_add}{
Suffix for naming the variant calling files containing SNVs (only evaluated if \code{caller_snv_indel==TRUE}).
}
  \item{caller_indel_names_add}{
Suffix for naming the variant calling files containing indels (only evaluated if \code{caller_snv_indel==TRUE}).
}
  \item{caller_chr}{
Column of the variant calling input containing information on chr (default: 1).
}
  \item{caller_pos}{
Column of the variant calling input containing information on pos (default: 2).
}
  \item{caller_ref}{
Column of the variant calling input containing information on ref (default: 4).
}
  \item{caller_alt}{
Column of the variant calling input containing information on alt (default: 5).
}
  \item{targetRegions}{
Data.frame object containing the target regions to be analyzed (bed-format: 1st column chr, 2nd column 0-based start pos, 3rd column 1-based end pos).
}
}
\details{
The function \code{filterTarget} covers two steps: reading input and target filtration.

First, all files in \code{caller_folder} of the file type \code{caller_file_type} with the suffix \code{caller_file_names_add} are read. Sample names are automatically derived from the file names (e.g. a sample name would be called "Sample1" if a file was called "Sample1.txt" and no suffix was defined; a sample would be called "Sample1.mutations" if a file was called "Sample1.mutations.vcf" and no suffix was defined, but "Sample1" if the suffix ".mutations" was defined).

If SNVs and indels are reported in separated files (in the same folder), \code{caller_snv_indel==TRUE} and \code{caller_snv_names_add} and \code{caller_indel_names_add} are defined, input from two files per sample is read and automatically combined (e.g. a sample would be called "Sample1" if files "Sample1.SNV.vcf" and "Sample1.indel.vcf" are read and \code{caller_snv_indel==TRUE}, \code{caller_snv_names_add} was defined as ".SNV" and \code{caller_indel_names_add} was defined as ".indel").

Subsequently, the read variant calling results are filtered according to the defined target region. All off-target calls are excluded from further analysis.

}
\value{
A list of data.frames is returned. Every list element contains the information on one sample. Every data.frame contains the columns: the SampleID (taken from the input file names), Chr, Pos, Ref and Alt.
}
\author{
Sarah Sandmann <sarah.sandmann@uni-muenster.de>
}
\seealso{
\code{\link{appreci8R}}, \code{\link{appreci8Rshiny}}, \code{\link{normalize}}, \code{\link{annotate}}, \code{\link{combineOutput}}, \code{\link{evaluateCovAndBQ}}, \code{\link{determineCharacteristics}}, \code{\link{finalFiltration}}
}
\examples{
output_folder<-""
target<-data.frame(chr = c("2","4","12","17","21","X"),
                   start = c(25469500,106196950,12046280,7579470,36164400,15838363),
                   end = c(25469510,106196960,12046350,7579475,36164410,15838366))
caller_folder <- system.file("extdata", package = "appreci8R")
targetFiltered<-filterTarget(output_folder, "GATK", caller_folder,
                             ".rawMutations", ".vcf", TRUE, "", "",
                             targetRegions = target)
}
