# appreci8R - an R/Bioconductor package for filtering SNVs and short indels with high sensitivity and high PPV

<p align="center">
    <img height="750" src="https://uni-muenster.sciebo.de/s/b5VEUrRfIWlBfPA/download">
</p>

For the use of next-generation sequencing in clinical routine valid variant calling results are crucial. However, numerous variant calling tools are available. These tools usually differ in the variant calling algorithsms, the characteristics reported along with the varaint calls, the recommended filtration strategies for the raw calls and thus, also in the output. Especially when calling variants with a low variant allele frequency (VAF), perfect results are hard to obtain. High sensitivity is usually accompanied by low positive predictive value (PPV).

appreci8R is a package for combining and filterating the output of differen variant calling tools according to the 'appreci8'-algorithm. vcf as well as txt files containing variant calls can be evaluated. The number of variant calling tools to consider is unlimited (for the user interface version it is limited to 13). The final output contains a list of variant calls, classified as "probably true", "polymophism" or "artifact".

Important note: Currently, only hg19 is supported.


Sandmann S, Karimi M, de Graaf AO, Rohde C, Göllner S, Varghese J, Ernsting J, Walldin G, van der Reijden BA, Müller-Tidow C, Malcovati L, Hellström-Lindberg E, Jansen JH, Dugas M. appreci8: a pipeline for precise variant calling integrating 8 tools. Bioinformatics. 2018 Dec 15;34(24):4205-4212. doi: 10.1093/bioinformatics/bty518. PMID: 29945233; PMCID: PMC6289140.



## Requirements
To run appreci8R, you need R (Version 4.1.0 or higher).

## Installation
Easiest way to download and install the appreci8R is via Bioconductor:

`BiocManager::install("appreci8R")`

`library(appreci8R)`


## Important Note

You are dealing with the R-Version of appreci8 - this means that you have to perform variant calling yourself prior to analysis with the appreci8R.


## Detailed documentation
For detailed documentation, please check out the manual and the vignette available within this repsitory or on the bioconductor website (https://bioconductor.org/packages/release/bioc/html/appreci8R.html).

In case of errors or feature requests, do not hesitate to open an issue or contact Sarah Sandmann (sarah.sandmann@uni-muenster.de).
