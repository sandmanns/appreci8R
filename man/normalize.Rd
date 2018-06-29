\name{normalize}
\alias{normalize}
\title{
Normalize calls
}
\description{
\bold{appreci8R} combines and filters the output of different variant calling tools according to the 'appreci8'-algorithm. In the 2nd analysis step, all calls are normalized with respect to reporting indels, MNVs, reporting of several alternate alleles and reporting of complex indels. A data.frame with all normalized calls is returned.
}
\usage{
normalize(output_folder, caller_name, target_calls, caller_indels_pm,
          caller_mnvs)
}
\arguments{
  \item{output_folder}{
The folder to write the output files into. If an empty string is provided, no files are written out.
}
  \item{caller_name}{
Name of the variant calling tool (only necessary if an output folder is provided).
}
  \item{target_calls}{
List of data.frames. One list element per sample. FilterTarget()-output can directly be taken as input.
}
  \item{caller_indels_pm}{
Deletions are reported with a ``minus'' (e.g. C > -A), insertions are reported with a ``plus'' (e.g. C > +A) (\code{TRUE} or FALSE).
}
  \item{caller_mnvs}{
MNVs are reported (e.g. CA > GT instead of C > G and A > T; or CGAG > TGAT instead of C > T and G > T) (\code{TRUE} or FALSE).
}
}
\details{
The function \code{normalize} covers two to four normalization steps:

1) Check alternative bases: Calls containing a ``comma'' are split up. A call like C > A,G is converted to C > A and an additional C > G call. This enables evaluation of the output of different callers while caller1 reports C > A,G, caller2 only reports C > A and caller3 only reports C > G. This normalization step is always performed.

2) Find string differences: Calls are checked for un-mutated bases. The smallest option of reporting a variant at the left-most position is chosen. For example, CAAAC > CAAC is converted to CA > C. This normalization step is always performed.

3) Convert indels: If deletions are reported with a ``minus'' and insertions are reported with a ``plus'', these are converted. An deletion like C > -G is converted to CG > C, while an insertion like C > +G is converted to C > CG. This normalization step is only performed if \code{caller_indels_pm} is \code{TRUE}.

4) Convert MNVs: If MNVs are reported, these are converted. This enables evaluation of the output of different callers if not all callers report all mutations being part of an MNV. A call like CA > GT is split up to a C > G and an A > T variant. But also a call like CGAG > TGAT is split up to C > T and G > T (G > G and A > A are not reported as they do not pass the normalization step ``Find string differences''). This normalization step is only performed if \code{caller_mnvs} is \code{TRUE}.
}
\value{
A data.frame is returned (SampleID, Chr, Pos, Ref, Alt).

If an output folder is provided, the data.frame is saved as <caller_name>.normalized.txt.
}
\author{
Sarah Sandmann <sarah.sandmann@uni-muenster.de>
}
\seealso{
\code{\link{appreci8R}}, \code{\link{appreci8Rshiny}}, \code{\link{filterTarget}}, \code{\link{annotate}}, \code{\link{combineOutput}}, \code{\link{evaluateCovAndBQ}}, \code{\link{determineCharacteristics}}, \code{\link{finalFiltration}}
}
\examples{
sample1<-data.frame(SampleID = c("Sample1","Sample1","Sample1"),
                    Chr = c("2","17","X"),
                    Pos = c(25469502,7579472,15838366),
                    Ref = c("CAG","G","C"),
                    Alt = c("TAT","C","T,A"))
sample2<-data.frame(SampleID = c("Sample2","Sample2","Sample2","sample2"),
                    Chr = c("4","12","12","21"),
                    Pos = c(106196951,12046289,12046341,36164405),
                    Ref = c("A","C","A","GGG"),
                    Alt = c("G","+AAAG","G","TGG"))
input<-list(sample1, sample2)
\donttest{
normalized<-normalize("", "", input, TRUE, TRUE)
}}
