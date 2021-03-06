\name{EaCoN.BedGC.chr}
\alias{EaCoN.BedGC.chr}
\title{Compute GC-content of genomic regions defined by a BED file using chromosomic FASTA files.}
\usage{
EaCoN.BedGC.chr(binned.bed.file = NULL, genome = "hg19", fasta.dir = NULL, na.to0 = TRUE,
nt.add = c(0,50,100, 250, 500, 1000, 2500, 5000), out.dir = getwd(), return.data = FALSE,
nthread = 2)
}
\arguments{
\item{binned.bed.file}{BED file with binned region (ie, neither the WES capture BED, nor its cleaned version. See \code{Details}).}
\item{genome}{Genome build (one supported by datasets in the \code{chromosomes} package).}
\item{fasta.dir}{A directory containing (samtools-indexed) FASTA files corresponding the nucleotidic sequence of the given \code{genome} chromosomes.}
\item{na.to0}{Replace putative NA values of the computed GC-content by zero.}
\item{nt.add}{A numeric vector corresponding to Window(s) of extension of the BED regions (see \code{Details}).}
\item{out.dir}{Output directory.}
\item{return.data}{Return the computed GC-content as a data.frame (and still write it as a BED-like file).}
\item{nthread}{Number of threads for multithreading (see \code{Details}).}
}
\description{
This computes the GC-content of a BED file, and possibly extensions of these regions, using (samtools-indexed) FASTA files for each chromosome.
}
\value{
A new BED-like file (with a ".gc" extension) containing the computed GC-content, and returned as a \code{data.frame} if \code{return.data} is set to \code{TRUE}.
}
\details{
\itemize{
\item{\code{binned.bed.file} : This BED file corresponds to the BED generated by \code{EaCoN::EaCoN.BAMConv()}, thus corresponding to binning of the capture BED after being processed through \code{EaCoN::EaCoN.BedCheck()}.}
\item{\code{nt.add} : To simulate different states of degradation of DNA, GC-content can be computed on several tracks corresponding to different sizes of extension of the regions defined by te \code{binned.bed.file}. The \code{nt.add} parameter corresponds to a numeric vector containing the different extension size(s) desired. Please note that these sizes are expressed in nucleotides unit, and that the extension will be performed on both sides of the regions. Example : with an extension size of 50, the genomic region chr1:1000-1100 will get extended to chr1:950-1150. Default value for this parameter is recommended for WES data.}
\item{\code{nthread} : When \code{nthread} > 1, multithreading is performed using one chromosome (one extension) per thread, so please do not use a value greater than the length of chromosomes in \code{binned.bed.file}.}
}
}
\author{
Bastien Job
}

