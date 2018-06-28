readInput<-function(caller_folder,caller_file_names_add,caller_file_type,
                    caller_snv_indel,caller_snv_names_add,
                    caller_indel_names_add,caller_chr,
                    caller_pos,caller_ref,caller_alt){
    readCalls<-list()
    if(caller_snv_indel=="Yes"||caller_snv_indel==TRUE){
        inputFiles<-file.path(caller_folder,
                              dir(file.path(caller_folder),
                                  pattern=paste("*",caller_file_names_add,
                                                caller_file_type,sep="")))
        for(i in 1:length(inputFiles)){
            if(caller_file_type==".vcf"){
                temp<-data.frame(x=1)
                data<-lapply(temp,function(x){
                    tryCatch(read.table(inputFiles[i],header=FALSE,sep="\t",
                                        stringsAsFactors=FALSE,quote=""),
                             error=function(e) NULL)
                })
                if(!is.null(data[[1]])){
                    temp<-read.table(inputFiles[i],header=FALSE,sep="\t",
                                     stringsAsFactors=FALSE,quote="")
                    temp2<-temp[,c(1,2,4,5)]
                }
            }
            if(caller_file_type==".txt"){
                temp<-data.frame(x=1)
                data<-lapply(temp,function(x){
                    tryCatch(read.table(inputFiles[i],header=FALSE,sep="\t",
                                        stringsAsFactors=FALSE,quote="",skip=1),
                             error=function(e) NULL)
                })
                if(!is.null(data[[1]])){
                    temp<-read.table(inputFiles[i],header=FALSE,sep="\t",
                                     stringsAsFactors=FALSE,quote="",skip=1)
                    temp2<-temp[,c(as.numeric(caller_chr),
                                   as.numeric(caller_pos),
                                   as.numeric(caller_ref),
                                   as.numeric(caller_alt))]
                }
            }
            for(j in 1:length(temp2[,1])){
                if(temp2[j,3]==TRUE){
                    temp2[j,3]<-"T"
                }
                if(temp2[j,4]==TRUE){
                    temp2[j,4]<-"T"
                }
            }
            samplename_temp<-dir(file.path(caller_folder),
                                 pattern=paste("*",caller_file_names_add,
                                               caller_file_type,sep=""))[i]
            sampleNames<-substr(samplename_temp,1,
                                nchar(samplename_temp)-nchar(caller_file_names_add)-4)
            if(!is.null(data[[1]])){
                readCalls[[i]]<-cbind(SampleID=rep(sampleNames,length(temp[,1])),
                                      temp2)
            }
            if(is.null(data[[1]])){
                readCalls[[i]]<-data.frame(SampleID=sampleNames,Calls=NA)
            }
        }
        return(readCalls)
    }
    if(caller_snv_indel=="No"||caller_snv_indel==FALSE){
        inputFiles1<-file.path(caller_folder,
                               dir(file.path(caller_folder),
                                   pattern=paste("*",caller_snv_names_add,
                                                 caller_file_type,sep="")))
        for(i in 1:length(inputFiles1)){
            if(caller_file_type==".vcf"){
                temp<-data.frame(x=1)
                data<-lapply(temp,function(x){
                    tryCatch(read.table(inputFiles1[i],header=FALSE,sep="\t",
                                        stringsAsFactors=FALSE,quote=""),
                             error=function(e) NULL)
                })
                if(!is.null(data[[1]])){
                    temp<-read.table(inputFiles1[i],header=FALSE,sep="\t",
                                     stringsAsFactors=FALSE,quote="")
                    temp2<-temp[,c(1,2,4,5)]
                }
            }
            if(caller_file_type==".txt"){
                temp<-data.frame(x=1)
                data<-lapply(temp,function(x){
                    tryCatch(read.table(inputFiles1[i],header=FALSE,sep="\t",
                                        stringsAsFactors=FALSE,quote="",skip=1),
                             error=function(e) NULL)
                })
                if(!is.null(data[[1]])){
                    temp<-read.table(inputFiles1[i],header=FALSE,sep="\t",
                                     stringsAsFactors=FALSE,quote="")
                    temp2<-temp[,c(as.numeric(caller_chr),
                                   as.numeric(caller_pos),
                                   as.numeric(caller_ref),
                                   as.numeric(caller_alt))]
                }
            }
            for(j in 1:length(temp2[,1])){
                if(temp2[j,3]==TRUE){
                    temp2[j,3]<-"T"
                }
                if(temp2[j,4]==TRUE){
                    temp2[j,4]<-"T"
                }
            }
            samplename_temp<-dir(file.path(caller_folder),
                                 pattern=paste("*",caller_snv_names_add,
                                               caller_file_type,sep=""))[i]
            sampleNames<-substr(samplename_temp,1,
                                nchar(samplename_temp)-nchar(caller_snv_names_add)-4)
            if(!is.null(data[[1]])){
                readCalls[[i]]<-cbind(SampleID=rep(sampleNames,length(temp[,1])),
                                      temp2)
            }
            if(is.null(data[[1]])){
                readCalls[[i]]<-NA
            }
        }
        inputFiles2<-file.path(caller_folder,
                               dir(file.path(caller_folder),
                                   pattern=paste("*",caller_indel_names_add,
                                                 caller_file_type,sep="")))
        for(i in 1:length(inputFiles2)){
            if(caller_file_type==".vcf"){
                temp<-data.frame(x=1)
                data<-lapply(temp,function(x){
                    tryCatch(read.table(inputFiles2[i],header=FALSE,sep="\t",
                                        stringsAsFactors=FALSE,quote=""),
                             error=function(e) NULL)
                })
                if(!is.null(data[[1]])){
                    temp<-read.table(inputFiles2[i],header=FALSE,sep="\t",
                                     stringsAsFactors=FALSE,quote="")
                    temp2<-temp[,c(1,2,4,5)]
                }
            }
            if(caller_file_type==".txt"){
                temp<-data.frame(x=1)
                data<-lapply(temp,function(x){
                    tryCatch(read.table(inputFiles2[i],header=FALSE,sep="\t",
                                        stringsAsFactors=FALSE,quote="",skip=1),
                             error=function(e) NULL)
                })
                if(!is.null(data[[1]])){
                    temp<-read.table(inputFiles2[i],header=FALSE,sep="\t",
                                     stringsAsFactors=FALSE,quote="")
                    temp2<-temp[,c(as.numeric(caller_chr),
                                   as.numeric(caller_pos),
                                   as.numeric(caller_ref),
                                   as.numeric(caller_alt))]
                }
            }
            for(j in 1:length(temp2[,1])){
                if(temp2[j,3]==TRUE){
                    temp2[j,3]<-"T"
                }
                if(temp2[j,4]==TRUE){
                    temp2[j,4]<-"T"
                }
            }
            samplename_temp<-dir(file.path(caller_folder),
                                 pattern=paste("*",caller_indel_names_add,
                                               caller_file_type,sep=""))[i]
            sampleNames<-substr(samplename_temp,1,
                                nchar(samplename_temp)-nchar(caller_indel_names_add)-4)
            if(!is.null(data[[1]])){
                readCalls[[i]]<-rbind(readCalls[[i]],
                                      cbind(SampleID=rep(sampleNames,
                                                         length(temp2[,1])),
                                            temp2))
            }
            if(is.null(data[[1]])&&is.na(readCalls[[i]])){
                readCalls[[i]]<-NA
            }
        }
        return(readCalls)
    }
}

getSampleNames<-function(caller_folder,caller_file_names_add,caller_file_type,
                         caller_snv_indel,caller_snv_names_add,
                         caller_indel_names_add){
    if(caller_snv_indel=="Yes"||caller_snv_indel==TRUE){
        sampleNames<-data.frame(Names=NA)
        inputFiles<-file.path(caller_folder,
                              dir(file.path(caller_folder),
                                  pattern=paste("*",caller_file_names_add,
                                                caller_file_type,sep="")))
        for(i in 1:length(inputFiles)){
            samplename_temp<-dir(file.path(caller_folder),
                                 pattern=paste("*",caller_file_names_add,
                                               caller_file_type,sep=""))[i]
            sampleNames[i,1]<-substr(samplename_temp,1,
                                     nchar(samplename_temp)-nchar(caller_file_names_add)-4)
        }
        return(sampleNames)
    }
    if(caller_snv_indel=="No"||caller_snv_indel==FALSE){
        sampleNames<-data.frame(Names=NA,Names2=NA)
        inputFiles<-file.path(caller_folder,
                              dir(file.path(caller_folder),
                                  pattern=paste("*",caller_snv_names_add,
                                                caller_file_type,sep="")))
        for(i in 1:length(inputFiles)){
            samplename_temp<-dir(file.path(caller_folder),
                                 pattern=paste("*",caller_snv_names_add,
                                               caller_file_type,sep=""))[i]
            sampleNames[i,1]<-substr(samplename_temp,1,
                                     nchar(samplename_temp)-nchar(caller_snv_names_add)-4)
        }
        inputFiles2<-file.path(caller_folder,
                               dir(file.path(caller_folder),
                                   pattern=paste("*",caller_indel_names_add,
                                                 caller_file_type,sep="")))
        for(i in 1:length(inputFiles2)){
            samplename_temp<-dir(file.path(caller_folder),
                                 pattern=paste("*",
                                               caller_indel_names_add,
                                               caller_file_type,sep=""))[i]
            sampleNames[i,2]<-substr(samplename_temp,1,
                                     nchar(samplename_temp)-nchar(caller_indel_names_add)-4)
        }
        if(sum(sampleNames[,1]==sampleNames[,2])==length(sampleNames[,1])){
            return(data.frame(Names=sampleNames[,1]))
        }
        if(sum(sampleNames[,1]==sampleNames[,2])!=length(sampleNames[,1])){
            return()
        }
    }
}

indel_converter<-function(input){
    input[,4]<-as.character(input[,4])
    input[,5]<-as.character(input[,5])
    minus<-grep(pattern="-",input[,5],fixed=TRUE)
    plus<-grep(pattern="+",input[,5],fixed=TRUE)
    relevant<-c(minus,plus)
    for(i in relevant){
        if(substr(input[i,5],1,1)=="-"){
            ref_new<-paste(input[i,4],substr(input[i,5],2,
                                             nchar(input[i,5])),sep="")
            alt_new<-input[i,4]
            input[i,4]<-ref_new
            input[i,5]<-alt_new
        }
        if(substr(input[i,5],1,1)=="+"){
            alt_new<-paste(input[i,4],substr(input[i,5],2,
                                             nchar(input[i,5])),sep="")
            input[i,5]<-alt_new
        }
    }
    return(input)
}

mnv_converter<-function(input){
    input[,4]<-as.character(input[,4])
    input[,5]<-as.character(input[,5])
    input[,1]<-as.character(input[,1])
    ncharRef<-nchar(input[,4])
    ncharAlt<-nchar(input[,5])
    relevant<-seq(1,length(input[,1]))
    relevant<-relevant[ncharRef>1&ncharAlt>1&ncharRef==ncharAlt]
    temp1<-input[relevant,]
    temp2<-input[setdiff(seq(1,length(input[,1])),relevant),]
    tempRef<-str_split_fixed(string = temp1[,4],pattern="",n = Inf)
    tempAlt<-str_split_fixed(string = temp1[,5],pattern="",n = Inf)
    temp1.2<-cbind(temp1[,1:3],Ref=tempRef[,1],Alt=tempAlt[,1])
    temp1.2[,4]<-as.character(temp1.2[,4])
    temp1.2[,5]<-as.character(temp1.2[,5])
    temp1.2[,1]<-as.character(temp1.2[,1])
    if(length(tempRef[1,])>1){
        for(i in 2:length(tempRef[1,])){
            add<-cbind(SampleID=temp1[,1],Chr=temp1[,2],Pos=(temp1[,3]+i-1),
                       Ref=tempRef[,i],Alt=tempAlt[,i])
            add[,4]<-as.character(add[,4])
            add[,5]<-as.character(add[,5])
            add[,1]<-as.character(add[,1])
            add<-add[add[,5]!="",]
            temp1.2<-rbind(temp1.2,add)
        }
    }
    temp1.3<-temp1.2[temp1.2[,4]!=temp1.2[,5],]
    input_new<-rbind(temp2,temp1.3)
    return(input_new)
}

check_alternative_bases<-function(input){
    input[,4]<-as.character(input[,4])
    input[,5]<-as.character(input[,5])
    relevant<-seq(1,length(input[,1]))
    relevant<-relevant[grep(pattern=",",input[,5],fixed=TRUE)]
    temp<-str_split_fixed(string = input[,5],pattern=",",n = Inf)
    temp2<-cbind(input[,c(1:4)],Alt=temp[,1])
    temp2[,5]<-as.character(temp2[,5])
    if(length(temp[1,])>1){
        for(i in 2:length(temp[1,])){
            add<-cbind(input[,c(1:4)],Alt=temp[,i])
            add[,5]<-as.character(add[,5])
            add<-add[add[,5]!="",]
            temp2<-rbind(temp2,add)
        }
    }
    return(temp2)
}

string_diff_finder<-function(input){
    #start from the back
    input[,4]<-as.character(input[,4])
    input[,5]<-as.character(input[,5])
    ncharRef<-nchar(input[,4])
    ncharAlt<-nchar(input[,5])
    relevant<-seq(1,length(input[,1]))
    relevant<-relevant[ncharRef>1&ncharAlt>1]
    for(i in relevant){
        ref<-strsplit(substr(input[i,4],2,(ncharRef[i])),split="")[[1]]
        alt<-strsplit(substr(input[i,5],2,(ncharAlt[i])),split="")[[1]]
        flag_diff<-FALSE
        j_ref<-length(ref)
        j_alt<-length(alt)
        while(flag_diff==FALSE&&j_ref>0&&j_alt>0){
            if(ref[j_ref]!=alt[j_alt]){
                flag_diff<-TRUE
            }
            if(flag_diff==FALSE){
                j_ref<-j_ref-1
                j_alt<-j_alt-1
            }
        }
        input[i,4]<-substr(input[i,4],1,(j_ref+1))
        input[i,5]<-substr(input[i,5],1,(j_alt+1))
    }
    #now check the front
    ncharRef<-nchar(input[,4])
    ncharAlt<-nchar(input[,5])
    relevant<-seq(1,length(input[,1]))
    relevant<-relevant[ncharRef>1&ncharAlt>1]
    for(i in relevant){
        flag_diff<-FALSE
        while(flag_diff==FALSE&&nchar(input[i,4])>1&&nchar(input[i,5])>1){
            ref<-substr(input[i,4],1,1)[[1]]
            alt<-substr(input[i,5],1,1)[[1]]
            if(ref[1]==alt[1]){
                input[i,3]<-as.numeric(input[i,3])+1
                input[i,4]<-substr(input[i,4],2,nchar(input[i,4]))
                input[i,5]<-substr(input[i,5],2,nchar(input[i,5]))
            }
            if(ref[1]!=alt[1]){
                flag_diff<-TRUE
            }
        }
    }
    return(input)
}


getCharacteristicsFreq<-function(chr,start,stop,ref,alt,folder,sample){
    results<-data.frame(SampleID=sample,Chr=chr,Pos=start,Ref=ref,Alt=alt,
                        Nr_Ref=0,Nr_Alt=0,DP=0,VAF=0,BQ_REF=NA,BQ_ALT=NA,
                        Nr_Ref_fwd=0,Nr_Alt_fwd=0,DP_fwd=0,VAF_fwd=0,
                        Nr_Ref_rev=0,Nr_Alt_rev=0,DP_rev=0,VAF_rev=0)

    bf<-BamFile(file = paste(folder,sample,".bam",sep=""),
                index = paste(folder,sample,sep=""))
    sb<-ScanBamParam(which=GRanges(as.character(chr),
                                      IRanges(as.numeric(start),
                                              as.numeric(stop))))
    pp = PileupParam(max_depth=10^5,
                      min_base_quality=0,
                      min_mapq=1,
                      min_nucleotide_depth=1,
                      min_minor_allele_depth=0,
                      distinguish_strands=TRUE,
                      distinguish_nucleotides=TRUE,
                      ignore_query_Ns=TRUE,
                      include_deletions=TRUE,
                      include_insertions=TRUE)
    test<-pileup(file = bf,scanBamParam = sb,pileupParam = pp)

    if(length(test[,1])>0){
        results[1,8]<-sum(test$count)
        if(length(test$count[test$nucleotide==ref])>0){
            results[1,6]<-sum(test$count[test$nucleotide==ref])
        }
        if(length(test$count[test$nucleotide==alt])>0){
            results[1,7]<-sum(test$count[test$nucleotide==alt])
        }
        if(results[1,8]!=0){
            results[1,9]<-results[1,7]/results[1,8]
        }

        results[1,14]<-sum(test$count[test$strand=="+"])
        if(length(test$count[test$nucleotide==ref&test$strand=="+"])>0){
            results[1,12]<-test$count[test$nucleotide==ref&test$strand=="+"]
        }
        if(length(test$count[test$nucleotide==alt&test$strand=="+"])>0){
            results[1,13]<-test$count[test$nucleotide==alt&test$strand=="+"]
        }
        if(results[1,14]!=0){
            results[1,15]<-results[1,13]/results[1,14]
        }

        results[1,18]<-sum(test$count[test$strand=="-"])
        if(length(test$count[test$nucleotide==ref&test$strand=="-"])>0){
            results[1,16]<-test$count[test$nucleotide==ref&test$strand=="-"]
        }
        if(length(test$count[test$nucleotide==alt&test$strand=="-"])>0){
            results[1,17]<-test$count[test$nucleotide==alt&test$strand=="-"]
        }
        if(results[1,18]!=0){
            results[1,19]<-results[1,17]/results[1,18]
        }
    }
    return(results)
}

getCharacteristicsBQ<-function(chr,start,stop,ref,alt,folder,sample){
    results<-data.frame(SampleID=sample,Chr=chr,Pos=start,Ref=ref,Alt=alt,
                        BQ_REF=NA,BQ_ALT=NA)

    bf<-BamFile(file = paste(folder,sample,".bam",sep=""),
                index = paste(folder,sample,sep=""))
    sb<-ScanBamParam(which=GRanges(as.character(chr),
                                   IRanges(as.numeric(start),
                                           as.numeric(stop))))
    bq_ref_temp<-rep(0,45)
    bq_alt_temp<-rep(0,45)
    for(i in 0:44){
        pp = PileupParam(max_depth=10^5,
                         min_base_quality=i,
                         min_mapq=1,
                         min_nucleotide_depth=1,
                         min_minor_allele_depth=0,
                         distinguish_strands=FALSE,
                         distinguish_nucleotides=TRUE,
                         ignore_query_Ns=TRUE,
                         include_deletions=TRUE,
                         include_insertions=TRUE)
        test<-pileup(file = bf,scanBamParam = sb,pileupParam = pp)
        if(length(test$count[test$nucleotide==ref])>0){
            bq_ref_temp[i+1]<-test$count[test$nucleotide==ref]
        }
        if(length(test$count[test$nucleotide==alt])>0){
            bq_alt_temp[i+1]<-test$count[test$nucleotide==alt]
        }
    }
    bq_ref<-rep(0,44)
    bq_alt<-rep(0,44)
    for(i in 1:44){
        bq_ref[i]<-bq_ref_temp[i]-bq_ref_temp[i+1]
        bq_alt[i]<-bq_alt_temp[i]-bq_alt_temp[i+1]
    }
    results$BQ_REF[1]<-sum(seq(0,43)*bq_ref)/sum(bq_ref)
    results$BQ_ALT[1]<-sum(seq(0,43)*bq_alt)/sum(bq_alt)
    if(alt=="+"){
        results$BQ_ALT[1]<-results$BQ_REF[1]
    }
    return(results)
}

