\name{combineOutput}
\alias{combineOutput}
\title{
Combine output of different variant calling tools
}
\description{
\bold{appreci8R} combines and filters the output of different variant calling tools according to the 'appreci8'-algorithm. In the 4th analysis step, all normalized and annotated calls of the different variant calling tools are combined. A data.frame with all combined calls is returned.
}
\usage{
combineOutput(output_folder, caller_names, annotated_calls)
}
\arguments{
  \item{output_folder}{
The folder to write the output files into. If an empty string is provided, no files are written out.
}
  \item{caller_names}{
Vector containing the name of the variant calling tools.
}
  \item{annotated_calls}{
A list of data.frames. Every list element contains the variant calls of one variant calling tool. Annotate()-output can directly be taken as input. Providing a list with only one list element, i.e. evaluating only one variant calling tool, is possible, but not assumed to be useful. The point of the appreci8-algorithm lies in the combined evaluation and filtration of the output of several variant calling tools.
}
}
\details{
The function \code{combineOutput} performs a combination of the normalized and annotated variant calls from different variant calling tools. The results are sorted according to Chr, Pos, Ref, Alt and SampleID. If two callers - caller1 and caller2 - report the same variant for the same sample, it is only reported once in the output file with a ``1'' in the column ``caller1'' and another ``1'' in the column ``caller2''.
}
\value{
A data.frame is returned containing all combined calls. Reported columns are: SampleID, Chr, Pos, Ref, Alt, Location, c. (position of variant on cDNA level), p. (position of variant on protein level), AA_ref, AA_alt, Codon_ref, Codon_alt, Consequence, Gene, GeneID, TranscriptID. In addition, one column for every variant calling tool is reported, containing a ``1'' for every call detected by that tool and ``NA'' for every call not detected by that tool.

If an output folder is provided, the data.frame is saved as Results_Raw.txt.
}
\author{
Sarah Sandmann <sarah.sandmann@uni-muenster.de>
}
\seealso{
\code{\link{appreci8R}}, \code{\link{appreci8Rshiny}}, \code{\link{filterTarget}}, \code{\link{normalize}}, \code{\link{annotate}}, \code{\link{evaluateCovAndBQ}}, \code{\link{determineCharacteristics}}, \code{\link{finalFiltration}}
}
\examples{
gatk<-data.frame(SampleID = c("Sample2","Sample1"),
                 Chr = c("4","X"),
                 Pos = c(106196951,15838366),
                 Ref = c("A","C"),
                 Alt = c("G","A"),
                 Location = c("coding,coding","coding"),
                 c. = c("5284,5347","864"),
                 p. = c("1762,1783","288"),
                 AA_ref = c("I,I","N"),
                 AA_alt = c("V,V","K"),
                 Codon_ref = c("ATA,ATA","AAC"),
                 Codon_alt = c("GTA,GTA","AAA"),
                 Consequence = c("nonsynonymous,nonsynonymous","nonsynonymous"),
                 Gene = c("TET2,TET2","ZRSR2"),
                 GeneID = c("54790,54790","8233"),
                 TranscriptID = c("18308,18309","75467"),stringsAsFactors=FALSE)
varscan<-gatk[2,]
annotated<-list()
annotated[[1]]<-gatk
annotated[[2]]<-varscan
\donttest{
combined<-combineOutput("", c("GATK","VarScan"), annotated)
}}
