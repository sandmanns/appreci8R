#Perform 1st analysis step - Target Filtration
filterTarget <- function(output_folder,caller_name,caller_folder,
                         caller_file_names_add,caller_file_type,
                         caller_snv_indel,caller_snv_names_add,
                         caller_indel_names_add,caller_chr=1,caller_pos=2,
                         caller_ref=4,caller_alt=5,targetRegions) {
    #check if input really exists
    if(output_folder!=""&&file.exists(output_folder)==FALSE){
        message("Your output folder does not exist")
        return()
    }
    if(!is.null(caller_folder)&&file.exists(caller_folder)==FALSE){
        message("Your caller folder does not exist")
        return()
    }

    #0. Reading Input
    message("0. Reading input")
    raw_calls<-list()

    raw_calls<-readInput(caller_folder,caller_file_names_add,
                         caller_file_type,caller_snv_indel,
                         caller_snv_names_add,caller_indel_names_add,
                         caller_chr,caller_pos,caller_ref,caller_alt)
    sampleNameTest<-getSampleNames(caller_folder,caller_file_names_add,
                                   caller_file_type,caller_snv_indel,
                                   caller_snv_names_add,caller_indel_names_add)

    #1. Target filtration
    message("1. Target filtration")
    if((is.data.frame(targetRegions)==TRUE&&sum(is.na(targetRegions))>0)
       ||(is.data.frame(targetRegions)==FALSE&&length(targetRegions)==0)){
        message("Please provide a target regions file")
        return()
    }
    if((is.data.frame(targetRegions)==TRUE&&sum(is.na(targetRegions))==0)
       ||(is.data.frame(targetRegions)==FALSE&&length(targetRegions)>0)){
        if(is.data.frame(targetRegions)==FALSE){
            temp<-as.data.frame(targetRegions)
            targetRegions<-temp
        }
        target_calls<-list()
        for(i in seq_along(raw_calls)){
            if(length(raw_calls[[i]])>0){
                if(!is.na(raw_calls[[i]][1,2])){
                    include<-rep(FALSE,length(raw_calls[[i]][,1]))
                    for(k in seq_along(raw_calls[[i]][,1])){
                        flag1<-as.character(raw_calls[[i]][k,2])==as.character(targetRegions[,1])
                        flag2<-raw_calls[[i]][k,3]>targetRegions[,2]
                        flag3<-raw_calls[[i]][k,3]<=targetRegions[,3]
                        if(sum(rowSums(cbind(flag1,flag2,flag3))==3)>0){
                            include[k]<-TRUE
                        }
                    }
                    target_calls[[i]]<-raw_calls[[i]][include,]
                    names(target_calls[[i]])<-c("SampleID","Chr","Pos","Ref",
                                                "Alt")
                    if(output_folder!=""){
                        write.table(target_calls[[i]],
                                    paste(output_folder,"/",
                                          as.character(caller_name),".",
                                          sampleNameTest[i,1],".target.txt",
                                          sep=""),
                                    row.names=FALSE,quote=FALSE,sep="\t")
                    }
                }
                if(is.na(raw_calls[[i]][1,2])){
                    target_calls[[i]]<-data.frame(noCalls=NA)
                    if(output_folder!=""){
                        write.table(target_calls[[i]],
                                    paste(output_folder,"/",
                                          as.character(caller_name),".",
                                          sampleNameTest[i,1],".target.txt",
                                          sep=""),
                                    row.names=FALSE,quote=FALSE,sep="\t")
                    }
                }
            }
        }
        return(target_calls)
    }
}

#Perform 2nd analysis step - Normalization
normalize <- function(output_folder,caller_name,target_calls,caller_indels_pm,
                      caller_mnvs) {
    #check if output folder really exists
    if(output_folder!=""&&file.exists(output_folder)==FALSE){
        message("Your output folder does not exist")
        return()
    }

    #2. Normalization
    message("2. Normalize")
    if(length(target_calls)>0){
        temp<-target_calls[[1]]
        if(!is.na(temp[1,2])&&length(target_calls)>1){
            for(j in 2:length(target_calls)){
                temp<-rbind(temp,target_calls[[j]])
            }
        }
        if(caller_indels_pm==TRUE){
            temp2<-indel_converter(temp)
            temp<-temp2
        }
        temp2<-check_alternative_bases(temp)
        temp<-temp2
        if(caller_mnvs=="Yes"||caller_mnvs==TRUE){
            temp2<-mnv_converter(temp)
            temp<-temp2
        }
        temp2<-string_diff_finder(temp)
        temp<-temp2
        normalized_calls<-temp
        if(output_folder!=""){
            write.table(normalized_calls,paste(output_folder,"/",
                                               caller_name,
                                               ".normalized.txt",sep=""),
                        row.names=FALSE,quote=FALSE,sep="\t")
        }
    }
    normalized_calls_g<-exportAsGRanges(normalized_calls)
    return(normalized_calls_g)
}

#Perform 3rd analysis step - Annotate
annotate <- function(output_folder,caller_name,normalized_calls_g,locations,
                     consequences) {
    #check if output folder really exists
    if(output_folder!=""&&file.exists(output_folder)==FALSE){
        message("Your output folder does not exist")
        return()
    }
    normalized_calls<-importAsDataFrame(normalized_calls_g)

    #3. Annotate
    message("3. Annotate")
    txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
    connection_txid_symbol<-transcripts(Homo.sapiens,columns=c("TXID","SYMBOL"))
    if(length(normalized_calls)>0){
        test<-VCF(rowRanges=GRanges(seqnames=paste("chr",
                                                   as.character(normalized_calls[,2]),
                                                   sep=""),
                                    ranges=IRanges(as.numeric(normalized_calls[,3]),
                                                   (as.numeric(normalized_calls[,3])+nchar(normalized_calls[,4])-1))),
                  fixed=DataFrame(REF=DNAStringSet(normalized_calls[,4]),
                                  ALT=DNAStringSetList(strsplit(normalized_calls[,5],
                                                                ",",fixed=TRUE)),
                                  QUAL=1,
                                  FILTER=as.character(normalized_calls[,1])))
        if(is.na(locations[1])){
            message("Please pick at least one location")
            return()
        }
        if(!is.na(locations[1])){
            located<-locateVariants(test,txdb,AllVariants())
            for(j in seq_along(locations)){
                if(j==1){
                    of_interest<-data.frame(located$LOCATION==locations[j])
                }
                if(j>1){
                    of_interest<-data.frame(of_interest,
                                            located$LOCATION==locations[j])
                }
            }
            if(length(locations)==1){
                located<-located[of_interest[,1]>0,]
            }
            if(length(locations)>1){
                located<-located[rowSums(of_interest)>0,]
            }
        }
        if(sum(locations=="coding")>0&&is.na(consequences[1])){
            message("Please pick at least one consequence")
            return()
        }
        if(!is.na(consequences[1])){
            predicted<-predictCoding(query=test,subject=txdb,seqSource=Hsapiens)
            for(j in seq_along(predicted[,1])){
                if(as.character(predicted$REFCODON[j])=="CTG"){
                    if(as.character(predicted$VARCODON[j])=="ATG"){
                        predicted$CONSEQUENCE[j]<-"nonsynonymous"
                    }
                    if(as.character(predicted$VARCODON[j])=="CTA"||
                       as.character(predicted$VARCODON[j])=="CTC"||
                       as.character(predicted$VARCODON[j])=="CTT"||
                       as.character(predicted$VARCODON[j])=="TTA"||
                       as.character(predicted$VARCODON[j])=="TTG"){
                        predicted$CONSEQUENCE[j]<-"synonymous"
                    }
                }
                if(as.character(predicted$VARCODON[j])=="CTG"){
                    if(as.character(predicted$REFCODON[j])=="ATG"){
                        predicted$CONSEQUENCE[j]<-"nonsynonymous"
                    }
                    if(as.character(predicted$REFCODON[j])=="CTA"||
                       as.character(predicted$REFCODON[j])=="CTC"||
                       as.character(predicted$REFCODON[j])=="CTT"||
                       as.character(predicted$REFCODON[j])=="TTA"||
                       as.character(predicted$REFCODON[j])=="TTG"){
                        predicted$CONSEQUENCE[j]<-"synonymous"
                    }
                }
                if(as.character(predicted$REFCODON[j])=="TTG"){
                    if(as.character(predicted$VARCODON[j])=="ATG"){
                        predicted$CONSEQUENCE[j]<-"nonsynonymous"
                    }
                    if(as.character(predicted$VARCODON[j])=="CTA"||
                       as.character(predicted$VARCODON[j])=="CTC"||
                       as.character(predicted$VARCODON[j])=="CTT"||
                       as.character(predicted$VARCODON[j])=="TTA"||
                       as.character(predicted$VARCODON[j])=="CTG"){
                        predicted$CONSEQUENCE[j]<-"synonymous"
                    }
                }
                if(as.character(predicted$VARCODON[j])=="TTG"){
                    if(as.character(predicted$REFCODON[j])=="ATG"){
                        predicted$CONSEQUENCE[j]<-"nonsynonymous"
                    }
                    if(as.character(predicted$REFCODON[j])=="CTA"||
                       as.character(predicted$REFCODON[j])=="CTC"||
                       as.character(predicted$REFCODON[j])=="CTT"||
                       as.character(predicted$REFCODON[j])=="TTA"||
                       as.character(predicted$REFCODON[j])=="CTG"){
                        predicted$CONSEQUENCE[j]<-"synonymous"
                    }
                }
            }
            for(j in seq_along(consequences)){
                if(j==1){
                    of_interest<-data.frame(predicted$CONSEQUENCE==consequences[j])
                }
                if(j>1){
                    of_interest<-data.frame(of_interest,
                                            predicted$CONSEQUENCE==consequences[j])
                }
            }
            if(length(consequences)==1){
                predicted<-predicted[of_interest[,1]>0,]
            }
            if(length(consequences)>1){
                predicted<-predicted[rowSums(of_interest)>0,]
            }
        }

        annotated_calls<-data.frame(normalized_calls,Location=NA,c.=NA,p.=NA,
                                    AA_ref=NA,AA_alt=NA,Codon_ref=NA,
                                    Codon_alt=NA,Consequence=NA,Gene=NA,
                                    GeneID=NA,TranscriptID=NA)
        counter_located<-1
        counter_predicted<-1
        keep<-rep(TRUE,length(annotated_calls[,1]))

        for(k in seq_along(annotated_calls[,1])){
            if((k%%100)==0){
                message(k," out of ",length(annotated_calls[,1]))
            }
            while(counter_located<=length(ranges(located))&&
                  start(ranges(located))[counter_located]==annotated_calls[k,3]){
                if(!is.na(annotated_calls[k,6])){
                    annotated_calls[k,6]<-paste(annotated_calls[k,6],
                                                as.character(located$LOCATION[counter_located]),
                                                sep=",")
                    annotated_calls[k,7]<-paste(annotated_calls[k,7],
                                                as.character(located$LOCSTART[counter_located]),
                                                sep=",")
                }
                if(is.na(annotated_calls[k,6])){
                    annotated_calls[k,6]<-as.character(located$LOCATION[counter_located])
                    annotated_calls[k,7]<-as.character(located$LOCSTART[counter_located])
                }
                counter_located<-counter_located+1
            }
            if(!is.na(annotated_calls[k,6])&&!is.na(consequences)){
                for(j in seq_along(strsplit(annotated_calls[k,6],",")[[1]])){
                    if(counter_predicted>length(ranges(predicted))||
                       strsplit(annotated_calls[k,6],",")[[1]][j]!="coding"){
                        if(!is.na(annotated_calls[k,8])){
                            annotated_calls[k,8]<-paste(annotated_calls[k,8],
                                                        "NA",sep=",")
                            annotated_calls[k,9]<-paste(annotated_calls[k,9],
                                                        "NA",sep=",")
                            annotated_calls[k,10]<-paste(annotated_calls[k,10],
                                                         "NA",sep=",")
                            annotated_calls[k,11]<-paste(annotated_calls[k,11],
                                                         "NA",sep=",")
                            annotated_calls[k,12]<-paste(annotated_calls[k,12],
                                                         "NA",sep=",")
                            annotated_calls[k,13]<-paste(annotated_calls[k,13],
                                                         "NA",sep=",")
                            annotated_calls[k,14]<-paste(annotated_calls[k,14],
                                                         "NA",sep=",")
                            annotated_calls[k,15]<-paste(annotated_calls[k,15],
                                                         "NA",sep=",")
                            annotated_calls[k,16]<-paste(annotated_calls[k,16],
                                                         "NA",sep=",")
                        }
                        if(is.na(annotated_calls[k,8])){
                            annotated_calls[k,8]<-"NA"
                            annotated_calls[k,9]<-"NA"
                            annotated_calls[k,10]<-"NA"
                            annotated_calls[k,11]<-"NA"
                            annotated_calls[k,12]<-"NA"
                            annotated_calls[k,13]<-"NA"
                            annotated_calls[k,14]<-"NA"
                            annotated_calls[k,15]<-"NA"
                            annotated_calls[k,16]<-"NA"
                        }
                    }
                    if(counter_predicted<=length(ranges(predicted))&&
                       strsplit(annotated_calls[k,6],",")[[1]][j]=="coding"){
                        if(start(ranges(predicted))[counter_predicted]==annotated_calls[k,3]){
                            if(!is.na(annotated_calls[k,8])){
                                annotated_calls[k,8]<-paste(annotated_calls[k,8],
                                                            as.character(predicted$PROTEINLOC[counter_predicted][[1]][1]),
                                                            sep=",")
                                if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])!="frameshift"){
                                    if(as.character(predicted$REFCODON[counter_predicted])!="CTG"){
                                        annotated_calls[k,9]<-paste(annotated_calls[k,9],
                                                                    as.character(predicted$REFAA[counter_predicted][[1]][1]),
                                                                    sep=",")
                                    }
                                    if(as.character(predicted$REFCODON[counter_predicted])=="CTG"){
                                        annotated_calls[k,9]<-paste(annotated_calls[k,9],"L",sep=",")
                                    }
                                    if(as.character(predicted$VARCODON[counter_predicted])!="CTG"){
                                        annotated_calls[k,10]<-paste(annotated_calls[k,10],
                                                                     as.character(predicted$VARAA[counter_predicted][[1]][1]),
                                                                     sep=",")
                                    }
                                    if(as.character(predicted$VARCODON[counter_predicted])=="CTG"){
                                        annotated_calls[k,10]<-paste(annotated_calls[k,10],"L",sep=",")
                                    }
                                }
                                if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])=="frameshift"){
                                    annotated_calls[k,9]<-paste(annotated_calls[k,9],
                                                                "NA",sep=",")
                                    annotated_calls[k,10]<-paste(annotated_calls[k,10],
                                                                 "NA",sep=",")
                                }
                                annotated_calls[k,11]<-paste(annotated_calls[k,11],
                                                             as.character(predicted$REFCODON[counter_predicted]),
                                                             sep=",")
                                annotated_calls[k,12]<-paste(annotated_calls[k,12],
                                                             as.character(predicted$VARCODON[counter_predicted]),
                                                             sep=",")
                                annotated_calls[k,13]<-paste(annotated_calls[k,13],
                                                             as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1]),
                                                             sep=",")
                                annotated_calls[k,14]<-paste(annotated_calls[k,14],
                                                             as.character(connection_txid_symbol[as.numeric(predicted$TXID[counter_predicted][[1]][1]),]$SYMBOL),
                                                             sep=",")
                                annotated_calls[k,15]<-paste(annotated_calls[k,15],
                                                             as.character(predicted$GENEID[counter_predicted][[1]][1]),
                                                             sep=",")
                                annotated_calls[k,16]<-paste(annotated_calls[k,16],
                                                             as.character(predicted$TXID[counter_predicted][[1]][1]),
                                                             sep=",")
                            }
                            if(is.na(annotated_calls[k,8])){
                                annotated_calls[k,8]<-as.character(predicted$PROTEINLOC[counter_predicted][[1]][1])
                                if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])!="frameshift"){
                                    if(as.character(predicted$REFCODON[counter_predicted])!="CTG"){
                                        annotated_calls[k,9]<-as.character(predicted$REFAA[counter_predicted][[1]][1])
                                    }
                                    if(as.character(predicted$REFCODON[counter_predicted])=="CTG"){
                                        annotated_calls[k,9]<-"L"
                                    }
                                    if(as.character(predicted$VARCODON[counter_predicted])!="CTG"){
                                        annotated_calls[k,10]<-as.character(predicted$VARAA[counter_predicted][[1]][1])
                                    }
                                    if(as.character(predicted$VARCODON[counter_predicted])=="CTG"){
                                        annotated_calls[k,10]<-"L"
                                    }
                                }
                                if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])=="frameshift"){
                                    annotated_calls[k,9]<-"NA"
                                    annotated_calls[k,10]<-"NA"
                                }
                                annotated_calls[k,11]<-as.character(predicted$REFCODON[counter_predicted])
                                annotated_calls[k,12]<-as.character(predicted$VARCODON[counter_predicted])
                                annotated_calls[k,13]<-as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])
                                annotated_calls[k,14]<-as.character(connection_txid_symbol[as.numeric(predicted$TXID[counter_predicted][[1]][1]),]$SYMBOL)
                                annotated_calls[k,15]<-as.character(predicted$GENEID[counter_predicted][[1]][1])
                                annotated_calls[k,16]<-as.character(predicted$TXID[counter_predicted][[1]][1])
                            }
                            counter_predicted<-counter_predicted+1
                        }
                    }
                }
            }
            if(is.na(annotated_calls[k,6])){
                keep[k]<-FALSE
            }
            if(!is.null(consequences)&&
               !is.na(annotated_calls[k,6])&&
               sum(strsplit(annotated_calls[k,6],",")[[1]]=="coding")>0&&
               (is.na(annotated_calls[k,8])||
                sum(strsplit(annotated_calls[k,8],",")[[1]]=="NA")==length(strsplit(annotated_calls[k,8],",")[[1]]))){
                keep[k]<-FALSE
            }
        }
        annotated_calls<-annotated_calls[keep,]

        if(output_folder!=""){
            write.table(annotated_calls,paste(output_folder,"/",
                                              caller_name,
                                              ".annotated.txt",sep=""),
                        row.names=FALSE,quote=FALSE,sep="\t")
        }
        annotated_calls_g<-exportAsGRanges(annotated_calls)
        return(annotated_calls_g)
    }
}

#Perform 4th analysis step - Combine
combineOutput <- function(output_folder,caller_names,annotated_calls_g) {
    #check if output folder really exists
    if(output_folder!=""&&file.exists(output_folder)==FALSE){
        message("Your output folder does not exist")
        return()
    }
    annotated_calls<-list()
    for(i in seq_along(annotated_calls_g)){
        annotated_calls[[i]]<-importAsDataFrame(annotated_calls_g[[i]])
    }

    #4. Combine output
    message("4. Combine Output")
    combined_calls<-data.frame(SampleID=NA,Chr=NA,Pos=NA,Ref=NA,Alt=NA,
                               Location=NA,c.=NA,p.=NA,AA_ref=NA,AA_alt=NA,
                               Codon_ref=NA,Codon_alt=NA,Consequence=NA,
                               Gene=NA,GeneID=NA,TranscriptID=NA)
    for(i in seq_along(annotated_calls)){
        combined_calls<-cbind(combined_calls,NA)
    }
    if(is.na(caller_names[1])){
        names(combined_calls)<-c(names(combined_calls)[1:16],
                                 paste("Caller",seq(1,length(annotated_calls)),
                                       sep=""))
    }
    if(!is.na(caller_names[1])){
        names(combined_calls)<-c(names(combined_calls)[1:16],caller_names)
    }

    combined_calls_temp<-combined_calls
    for(i in seq_along(annotated_calls)){
        if(length(annotated_calls[[i]])>0){
            temp<-annotated_calls[[i]]
            add_to_temp<-matrix(rep(NA,(length(combined_calls[1,])-16)),
                                ncol=(length(combined_calls[1,])-16))
            temp<-cbind(temp,add_to_temp)
            names(temp)<-names(combined_calls)
            temp[,16+i]<-1
            combined_calls_temp<-rbind(combined_calls_temp,temp)
        }
    }
    combined_calls_temp<-combined_calls_temp[2:length(combined_calls_temp[,1]),]
    combined_calls_temp_sorted<-combined_calls_temp[order(combined_calls_temp[,2],
                                                          combined_calls_temp[,3],
                                                          combined_calls_temp[,4],
                                                          combined_calls_temp[,5],
                                                          combined_calls_temp[,1]),]
    combined_calls<-combined_calls_temp_sorted[1,]
    counter<-1
    for(i in 2:length(combined_calls_temp_sorted[,1])){
        if(combined_calls[counter,1]==combined_calls_temp_sorted[i,1]&&
           combined_calls[counter,2]==combined_calls_temp_sorted[i,2]&&
           combined_calls[counter,3]==combined_calls_temp_sorted[i,3]&&
           combined_calls[counter,4]==combined_calls_temp_sorted[i,4]&&
           combined_calls[counter,5]==combined_calls_temp_sorted[i,5]){
            for(j in 17:length(combined_calls[1,])){
                if(!is.na(combined_calls[counter,j])||
                   !is.na(combined_calls_temp_sorted[i,j])){
                    combined_calls[counter,j]<-1
                }
            }
        }
        if(combined_calls[counter,1]!=combined_calls_temp_sorted[i,1]||
           combined_calls[counter,2]!=combined_calls_temp_sorted[i,2]||
           combined_calls[counter,3]!=combined_calls_temp_sorted[i,3]||
           combined_calls[counter,4]!=combined_calls_temp_sorted[i,4]||
           combined_calls[counter,5]!=combined_calls_temp_sorted[i,5]){
            counter<-counter+1
            combined_calls<-rbind(combined_calls,combined_calls_temp_sorted[i,])
        }
    }
    temp<-unique(combined_calls)
    combined_calls<-temp
    if(output_folder!=""){
        write.table(combined_calls,paste(output_folder,"/Results_Raw.txt",
                                         sep=""),
                    row.names=FALSE,quote=FALSE,sep="\t")
    }
    combined_calls_g<-exportAsGRanges(combined_calls)
    return(combined_calls_g)
}

#Perform 5th analysis step - Evaluate Coverage and BQ
evaluateCovAndBQ <- function(output_folder,combined_calls_g,bam_folder,
                             dp=50,nr_alt=20,vaf=0.01,bq=15,bq_diff=7) {
    #check if output folder really exists
    if(output_folder!=""&&file.exists(output_folder)==FALSE){
        message("Your output folder does not exist")
        return()
    }
    combined_calls<-importAsDataFrame(combined_calls_g)

    #5. Evaluate Coverage and BQ
    message("5. Evaluate Coverage and BQ")
    results<-cbind(combined_calls[,c(1:5)],Nr_Ref=NA,Nr_Alt=NA,DP=NA,
                   VAF=NA,BQ_REF=NA,BQ_ALT=NA,Nr_Ref_fwd=NA,Nr_Alt_fwd=NA,
                   DP_fwd=NA,VAF_fwd=NA,Nr_Ref_rev=NA,Nr_Alt_rev=NA,
                   DP_rev=NA,VAF_rev=NA)
    folder<-bam_folder
    for(i in seq_along(results[,1])){
        if((i%%100)==0){
            message("Call ",i," out of ",length(results[,1]))
        }
        done<-FALSE
        #SNVs
        if(nchar(results[i,4])==1&&nchar(results[i,5])==1){
            results_temp<-getCharacteristicsFreq(results[i,2],results[i,3],
                                                 results[i,3],results[i,4],
                                                 results[i,5],folder,
                                                 results[i,1])
            results[i,6:19]<-results_temp[1,6:19]
            if(results[i,8]>=dp&&results[i,7]>=nr_alt&&(results[i,9]*100)>=vaf){
                results_temp<-getCharacteristicsBQ(results[i,2],results[i,3],
                                                   results[i,3],results[i,4],
                                                   results[i,5],folder,
                                                   results[i,1])
                results[i,10:11]<-results_temp[1,6:7]
            }
            done<-TRUE
        }
        #Deletions
        if(done==FALSE&&nchar(results[i,4])>1&&nchar(results[i,5])==1
           &&substr(results[i,4],1,1)==results[i,5]){
            if(nchar(results[i,4])==2){
                results_temp<-getCharacteristicsFreq(results[i,2],
                                                     as.numeric(results[i,3])+1,
                                                     as.numeric(results[i,3])+1,
                                                     substr(results[i,4],2,2),
                                                     "-",folder,results[i,1])
                results[i,6:19]<-results_temp[1,6:19]
                if(results[i,8]>=dp&&results[i,7]>=nr_alt&&
                   (results[i,9]*100)>=vaf){
                    results_temp<-getCharacteristicsBQ(results[i,2],
                                                       as.numeric(results[i,3])+1,
                                                       as.numeric(results[i,3])+1,
                                                       substr(results[i,4],2,2),
                                                       "-",folder,results[i,1])
                    results[i,10:11]<-results_temp[1,6:7]
                }
            }
            if(nchar(results[i,4])>2){
                results_temp<-getCharacteristicsFreq(results[i,2],
                                                     as.numeric(results[i,3])+1,
                                                     as.numeric(results[i,3])+1,
                                                     substr(results[i,4],2,2),
                                                     "-",folder,results[i,1])
                for(j in 3:nchar(results[i,4])){
                    results_temp<-rbind(results_temp,
                                        getCharacteristicsFreq(results[i,2],
                                                               as.numeric(results[i,3])+j-1,
                                                               as.numeric(results[i,3])+j-1,
                                                               substr(results[i,4],j,j),
                                                               "-",folder,
                                                               results[i,1]))
                }
                for(j in 6:19){
                    results[i,j]<-min(results_temp[,j])
                }
                if(results[i,8]>=dp&&results[i,7]>=nr_alt&&
                   (results[i,9]*100)>=vaf){
                    results_temp<-getCharacteristicsBQ(results[i,2],
                                                       as.numeric(results[i,3])+1,
                                                       as.numeric(results[i,3])+1,
                                                       substr(results[i,4],2,2),
                                                       "-",folder,results[i,1])
                    for(j in 3:nchar(results[i,4])){
                        results_temp<-rbind(results_temp,
                                            getCharacteristicsBQ(results[i,2],
                                                                 as.numeric(results[i,3])+j-1,
                                                                 as.numeric(results[i,3])+j-1,
                                                                 substr(results[i,4],j,j),
                                                                 "-",folder,
                                                                 results[i,1]))
                    }
                    for(j in 6:7){
                        results_temp[1,j]<-min(results_temp[,j])
                    }
                    results[i,10:11]<-results_temp[1,6:7]
                }

            }
            done<-TRUE
        }
        #Insertions (summed up as +)
        if(done==FALSE&&nchar(results[i,4])==1&&nchar(results[i,5])>1
           &&substr(results[i,5],1,1)==results[i,4]){
            results_temp<-getCharacteristicsFreq(results[i,2],
                                                 as.numeric(results[i,3]),
                                                 as.numeric(results[i,3]),
                                                 results[i,4],"+",folder,
                                                 results[i,1])
            results[i,6:19]<-results_temp[1,6:19]
            if(results[i,8]>=dp&&results[i,7]>=nr_alt&&(results[i,9]*100)>=vaf){
                results_temp<-getCharacteristicsBQ(results[i,2],
                                                   as.numeric(results[i,3]),
                                                   as.numeric(results[i,3]),
                                                   results[i,4],"+",folder,
                                                   results[i,1])
                results[i,10:11]<-results_temp[1,6:7]
            }
            done<-TRUE
        }
        #Complex Indels
        if(done==FALSE){
            results_temp<-getCharacteristicsFreq(results[i,2],
                                                 as.numeric(results[i,3]),
                                                 as.numeric(results[i,3]),
                                                 substr(results[i,4],1,1),
                                                 substr(results[i,5],1,1),
                                                 folder,results[i,1])
            for(j in 2:min(nchar(results[i,4]),nchar(results[i,5]))){
                results_temp<-rbind(results_temp,
                                    getCharacteristicsFreq(results[i,2],
                                                           as.numeric(results[i,3])+j-1,
                                                           as.numeric(results[i,3])+j-1,
                                                           substr(results[i,4],j,j),
                                                           substr(results[i,5],j,j),
                                                           folder,
                                                           results[i,1]))
            }
            #Del in the end
            if(nchar(results[i,4])>nchar(results[i,5])){
                results_temp<-rbind(results_temp,
                                    getCharacteristicsFreq(results[i,2],
                                                           as.numeric(results[i,3])+j,
                                                           as.numeric(results[i,3])+j,
                                                           substr(results[i,4],j+1,j+1),
                                                           "-",folder,
                                                           results[i,1]))
            }
            #Ins in the end
            if(nchar(results[i,4])>nchar(results[i,5])){
                results_temp<-rbind(results_temp,
                                    getCharacteristicsFreq(results[i,2],
                                                           as.numeric(results[i,3])+j-1,
                                                           as.numeric(results[i,3])+j-1,
                                                           substr(results[i,4],j,j),
                                                           "+",folder,
                                                           results[i,1]))
            }
            for(j in 6:19){
                results[i,j]<-min(results_temp[,j])
            }
            if(results[i,8]>=dp&&results[i,7]>=nr_alt&&(results[i,9]*100)>=vaf){
                results_temp<-getCharacteristicsBQ(results[i,2],
                                                   as.numeric(results[i,3]),
                                                   as.numeric(results[i,3]),
                                                   substr(results[i,4],1,1),
                                                   substr(results[i,5],1,1),
                                                   folder,results[i,1])
                for(j in 2:min(nchar(results[i,4]),nchar(results[i,5]))){
                    results_temp<-rbind(results_temp,
                                        getCharacteristicsBQ(results[i,2],
                                                             as.numeric(results[i,3])+j-1,
                                                             as.numeric(results[i,3])+j-1,
                                                             substr(results[i,4],j,j),
                                                             substr(results[i,5],j,j),
                                                             folder,
                                                             results[i,1]))
                }
                #Del in the end
                if(nchar(results[i,4])>nchar(results[i,5])){
                    results_temp<-rbind(results_temp,
                                        getCharacteristicsBQ(results[i,2],
                                                             as.numeric(results[i,3])+j,
                                                             as.numeric(results[i,3])+j,
                                                             substr(results[i,4],j+1,j+1),
                                                             "-",folder,
                                                             results[i,1]))
                }
                #Ins in the end
                if(nchar(results[i,4])>nchar(results[i,5])){
                    results_temp<-rbind(results_temp,
                                        getCharacteristicsBQ(results[i,2],
                                                             as.numeric(results[i,3])+j-1,
                                                             as.numeric(results[i,3])+j-1,
                                                             substr(results[i,4],j,j),
                                                             "+",folder,
                                                             results[i,1]))
                }
                for(j in 6:7){
                    results_temp[1,j]<-min(results_temp[,j])
                }
                results[i,10:11]<-results_temp[1,6:7]
            }
        }
    }
    frequency_calls_temp<-cbind(combined_calls,results[,c(6:19)])
    include1<-results[,8]>=dp
    include2<-results[,7]>=nr_alt
    include3<-(results[,9]*100)>=vaf
    include4<-results[,11]>=bq
    for(i in seq_along(results[,1])){
        if(is.na(results[i,10])){
            results[i,10]<-0
        }
    }
    include5<-(results[,10]-results[,11])<=bq_diff
    frequency_calls<-frequency_calls_temp[rowSums(cbind(include1,include2,include3,include4,include5))>=5&!is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
    if(output_folder!=""){
        write.table(frequency_calls,
                    paste(output_folder,"/Results_Frequency.txt",sep=""),
                    row.names=FALSE,quote=FALSE,sep="\t")
    }
    frequency_calls_g<-exportAsGRanges(frequency_calls)
    return(frequency_calls_g)
}

#Perform 6th analysis step - Determine Characteristics
determineCharacteristics <- function(output_folder,frequency_calls_g,predict,
                                     dbSNP=TRUE,`1kgenomes`=TRUE,exacDB=TRUE,
                                     espDB=TRUE,gadDB=TRUE,cosmicDB=TRUE,
                                     clinvarDB=TRUE) {
    #check if output folder really exists
    if(output_folder!=""&&file.exists(output_folder)==FALSE){
        message("Your output folder does not exist")
        return()
    }
    frequency_calls<-importAsDataFrame(frequency_calls_g)

    #6. Determine CharacteristicsEvaluate Coverage and BQ
    message("6. Determine Extended Set of Characteristics (databases)")
    message("-> Downloading databases ")
    results<-data.frame(frequency_calls[,c(1:5)])
    results<-cbind(results,dbSNP=NA,dbSNP_MAF=NA)
    snps<-SNPlocs.Hsapiens.dbSNP144.GRCh37
    indels<-XtraSNPlocs.Hsapiens.dbSNP144.GRCh37
    if(`1kgenomes`==TRUE){
        results<-cbind(results,G1000_AF=NA)
        g1000<-MafDb.1Kgenomes.phase3.hs37d5
    }
    if(exacDB==TRUE){
        results<-cbind(results,ExAC_AF=NA)
        exac<-MafDb.ExAC.r1.0.hs37d5
    }
    if(espDB==TRUE){
        results<-cbind(results,ESP6500_AF=NA)
        esp6500<-MafDb.ESP6500SI.V2.SSA137.hs37d5
    }
    if(gadDB==TRUE){
        results<-cbind(results,GAD_AF=NA)
        gad<-MafDb.gnomADex.r2.1.hs37d5
    }
    if(cosmicDB==TRUE){
        results<-cbind(results,CosmicID=NA,Cosmic_Counts=NA)
        cosmic_67<-c()
        data(cosmic_67,envir = environment(),package = "COSMIC.67")
    }
    if(clinvarDB==TRUE){
        results<-cbind(results,ClinVar=NA)
        clinvar<-data.frame(Gene=NA,Start=NA,Stop=NA,Ref=NA,Alt=NA,Sig=NA)
        genes_temp<-c()
        for(i in seq_along(frequency_calls[,1])){
            genes_temp<-c(genes_temp,
                          strsplit(frequency_calls[i,14],split=",")[[1]])
        }
        genes<-unique(genes_temp[genes_temp!="NA"])
        for(i in seq_along(genes)){
            res<-entrez_search("clinvar",term=genes[i])
            cv<-entrez_summary("clinvar",id=res$ids)
            info<-extract_from_esummary(cv,"variation_set",simplify=FALSE)
            significance<-extract_from_esummary(cv,"clinical_significance",
                                                simplify=FALSE)
            for(j in seq_along(res$ids)){
                info2<-info[res$ids[j]][[1]][[1]]
                significance2<-significance[res$ids[j]][[1]][[1]]
                if(length(info2$variation_loc[[1]])){
                    for(k in seq_along(info2$variation_loc[[1]][,1])){
                        if(info2$variation_loc[[1]][k,2]=="GRCh37"){
                            temp<-data.frame(Gene=NA,Start=NA,Stop=NA,Ref=NA,
                                             Alt=NA)
                            temp[1,1]<-genes[i]
                            temp[1,2]<-info2$variation_loc[[1]][k,5]
                            temp[1,3]<-info2$variation_loc[[1]][k,6]
                            temp[1,4]<-info2$variation_loc[[1]][k,15]
                            temp[1,5]<-info2$variation_loc[[1]][k,16]
                            temp[1,6]<-significance2$description
                            if(!is.na(clinvar[1,1])){
                                clinvar<-rbind(clinvar,temp)
                            }
                            if(is.na(clinvar[1,1])){
                                clinvar<-temp
                            }
                        }
                    }
                }
            }
        }
    }

    c.<-c()
    c.complement<-c()
    p.<-c()
    message("-> Pre-processing of the calls")
    for(i in seq_along(frequency_calls[,1])){
        for(j in 1:(length(strsplit(frequency_calls[i,7],split=",")[[1]]))){
            if(j==1){
                c.[i]<-paste("c.",strsplit(frequency_calls[i,7],
                                           split=",")[[1]][j],
                             frequency_calls[i,4],">",frequency_calls[i,5],
                             sep="")
                c.complement[i]<-paste("c.",strsplit(frequency_calls[i,7],
                                                     split=",")[[1]][j],
                                       as.character(complement(DNAString(frequency_calls[i,4]))),
                                       ">",
                                       as.character(complement(DNAString(frequency_calls[i,5]))),
                                       sep="")
                if(!is.na(strsplit(frequency_calls[i,11],split=",")[[1]][j])&&
                   !is.na(strsplit(frequency_calls[i,12],split=",")[[1]][j])&&
                   strsplit(frequency_calls[i,11],split=",")[[1]][j]!="NA"&&
                   strsplit(frequency_calls[i,12],split=",")[[1]][j]!="NA"&&
                   nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])==3&&
                   nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])==3){
                    p.[i]<-paste("p.",strsplit(frequency_calls[i,9],
                                               split=",")[[1]][j],
                                 strsplit(frequency_calls[i,8],
                                          split=",")[[1]][j],
                                 strsplit(frequency_calls[i,10],
                                          split=",")[[1]][j],
                                 sep="")
                }
                if(!is.na(strsplit(frequency_calls[i,11],split=",")[[1]][j])&&
                   !is.na(strsplit(frequency_calls[i,12],split=",")[[1]][j])&&
                   strsplit(frequency_calls[i,11],split=",")[[1]][j]!="NA"&&
                   strsplit(frequency_calls[i,12],split=",")[[1]][j]!="NA"&&
                   (nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])!=3||
                    nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])!=3)){
                    if((nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])%%3)!=0||
                       (nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])%%3)!=0){
                        p.[i]<-paste("p.",
                                     as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                     strsplit(frequency_calls[i,8],
                                              split=",")[[1]][j],
                                     "fs",sep="")
                    }
                    if((nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])%%3)==0&&
                       (nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])%%3)==0){
                        p.[i]<-paste("p.",
                                     as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                     strsplit(frequency_calls[i,8],
                                              split=",")[[1]][j],
                                     as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,12],split=",")[[1]][j]))),sep="")
                    }
                }

            }
            if(j>1){
                c.[i]<-paste(c.[i],paste("c.",strsplit(frequency_calls[i,7],
                                                       split=",")[[1]][j],
                                         frequency_calls[i,4],">",
                                         frequency_calls[i,5],sep=""),sep=",")
                c.complement[i]<-paste(c.complement[i],
                                       paste("c.",strsplit(frequency_calls[i,7],
                                                           split=",")[[1]][j],
                                             as.character(complement(DNAString(frequency_calls[i,4]))),
                                             ">",
                                             as.character(complement(DNAString(frequency_calls[i,5]))),
                                             sep=""),sep=",")
                if(!is.na(strsplit(frequency_calls[i,11],split=",")[[1]][j])&&
                   !is.na(strsplit(frequency_calls[i,12],split=",")[[1]][j])&&
                   strsplit(frequency_calls[i,11],split=",")[[1]][j]!="NA"&&
                   strsplit(frequency_calls[i,12],split=",")[[1]][j]!="NA"&&
                   nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])==3&&
                   nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])==3){
                    p.[i]<-paste(p.[i],paste("p.",strsplit(frequency_calls[i,9],
                                                           split=",")[[1]][j],
                                             strsplit(frequency_calls[i,8],
                                                      split=",")[[1]][j],
                                             strsplit(frequency_calls[i,10],
                                                      split=",")[[1]][j],
                                             sep=""),sep=",")
                }
                if(!is.na(strsplit(frequency_calls[i,11],split=",")[[1]][j])&&
                   !is.na(strsplit(frequency_calls[i,12],split=",")[[1]][j])&&
                   strsplit(frequency_calls[i,11],split=",")[[1]][j]!="NA"&&
                   strsplit(frequency_calls[i,12],split=",")[[1]][j]!="NA"&&
                   (nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])!=3||
                    nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])!=3)){
                    if((nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])%%3)!=0||
                       (nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])%%3)!=0){
                        p.[i]<-paste(p.[i],paste("p.",
                                                 as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                                 strsplit(frequency_calls[i,8],
                                                          split=",")[[1]][j],
                                                 "fs",sep=""),sep=",")
                    }
                    if((nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])%%3)==0&&
                       (nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])%%3)==0){
                        p.[i]<-paste(p.[i],paste("p.",
                                                 as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                                 strsplit(frequency_calls[i,8],
                                                          split=",")[[1]][j],
                                                 as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,12],split=",")[[1]][j]))),sep=""),sep=",")
                    }
                }
            }
        }
    }
    message("-> Check databases")
    for(i in seq_along(frequency_calls[,1])){
        if((i%%100)==0){
            message("Call ",i," out of ",length(frequency_calls[,1]))
        }
        #SNPs
        if(nchar(frequency_calls[i,4])==1&&nchar(frequency_calls[i,5])==1){
            snp_info<-snpsByOverlaps(snps,paste(frequency_calls[i,2],":",
                                                frequency_calls[i,3],"-",
                                                frequency_calls[i,3],sep=""))
            if(length(snp_info)>0){
                snp_info<-snp_info[pos(snp_info)==frequency_calls[i,3],]
                if(length(snp_info)>0){
                    if(length(grep(results[i,5],
                                   IUPAC_CODE_MAP[snp_info$alleles_as_ambig]))>0||
                       (length(grep(results[i,4],
                                    IUPAC_CODE_MAP[snp_info$alleles_as_ambig]))==0&&
                        length(grep(as.character(complement(DNAString(results[i,5]))),
                                    IUPAC_CODE_MAP[snp_info$alleles_as_ambig])>0))){
                        results[i,6]<-snp_info$RefSNP_id
                    }
                }

            }
            if(`1kgenomes`==TRUE){
                snp_info<-gscores(g1000,GRanges(paste(frequency_calls[i,2],":",
                                                      frequency_calls[i,3],
                                                      sep="")))
                if(length(snp_info)>0){
                    results$G1000_AF[i]<-max(snp_info$AF)
                }
            }
            if(exacDB==TRUE){
                snp_info<-gscores(exac,GRanges(paste(frequency_calls[i,2],":",
                                                     frequency_calls[i,3],
                                                     sep="")))
                if(length(snp_info)>0){
                    results$ExAC_AF[i]<-max(snp_info$AF)
                }
            }
            if(espDB==TRUE){
                snp_info<-gscores(esp6500,GRanges(paste(frequency_calls[i,2],
                                                        ":",
                                                        frequency_calls[i,3],
                                                        sep="")))
                if(length(snp_info)>0){
                    results$ESP6500_AF[i]<-max(snp_info$AF)
                }
            }
            if(gadDB==TRUE){
                snp_info<-gscores(gad,GRanges(paste(frequency_calls[i,2],":",
                                                    frequency_calls[i,3],
                                                    sep="")))
                if(length(snp_info)>0){
                    results$GAD_AF[i]<-max(snp_info$AF)
                }
            }
            if(cosmicDB==TRUE){
                snp_info<-rowRanges(cosmic_67)[as.character(seqnames(rowRanges(cosmic_67)))==frequency_calls[i,2]&start(ranges(rowRanges(cosmic_67)))==frequency_calls[i,3]]
                if(length(snp_info)>0){
                    for(j in seq_along(snp_info[,1])){
                        if(snp_info$REF==frequency_calls[i,4]&&
                           snp_info$ALT[[1]]==frequency_calls[i,5]||
                           (snp_info$REF==as.character(complement(DNAString(frequency_calls[i,4])))&&
                            snp_info$ALT[[1]]==as.character(complement(DNAString(frequency_calls[i,5]))))){
                            snp_info2<-info(cosmic_67)[rownames(info(cosmic_67))==names(snp_info[j,]),]
                            grep_c.<-grep(snp_info2$CDS,
                                          as.character(strsplit(c.[i],split=",")[[1]]))
                            grep_c.comp<-grep(snp_info2$CDS,
                                              as.character(strsplit(c.complement[i],split=",")[[1]]))
                            grep_p.<-grep(snp_info2$AA,
                                          as.character(strsplit(p.[i],split=",")[[1]]))
                            if(length(intersect(grep_c.,grep_p.))>0||
                               length(intersect(grep_c.comp,grep_p.))>0){
                                if(!is.na(results$CosmicID[i])){
                                    results$CosmicID[i]<-paste(results$CosmicID[i],
                                                               names(snp_info[j,]),
                                                               sep=",")
                                    results$Cosmic_Counts[i]<-paste(results$Cosmic_Counts[i],
                                                                    snp_info2$CNT,
                                                                    sep=",")
                                }
                                if(is.na(results$CosmicID[i])){
                                    results$CosmicID[i]<-names(snp_info[j,])
                                    results$Cosmic_Counts[i]<-snp_info2$CNT
                                }
                            }
                        }
                    }
                }
            }
            if(clinvarDB==TRUE){
                snp_info_temp<-data.frame()
                for(j in seq_along(strsplit(frequency_calls[i,14],split=",")[[1]])){
                    if(!is.na(strsplit(frequency_calls[i,14],
                                       split=",")[[1]][j])){
                        temp<-clinvar[grep(strsplit(frequency_calls[i,14],
                                                    split=",")[[1]][j],
                                           clinvar[,1]),]
                        temp2<-temp[nchar(temp[,4])==1&nchar(temp[,5])==1&temp[,4]!="-"&temp[,5]!="-",]
                        if(length(snp_info_temp)>0){
                            snp_info_temp<-rbind(snp_info_temp,temp2)
                        }
                        if(length(snp_info_temp[1,1])==0){
                            snp_info_temp<-temp2
                        }
                    }

                }
                snp_info<-unique(snp_info_temp)
                if(length(snp_info)>0){
                    snp_info2<-snp_info[snp_info[,2]==frequency_calls[i,3],]
                    if(length(snp_info2[,1])>0){
                        if((snp_info2[1,4]==frequency_calls[i,4]&&
                            snp_info2[1,5]==frequency_calls[i,5])
                           ||(snp_info2[1,4]==as.character(complement(DNAString(frequency_calls[i,4])))
                              &&snp_info2[1,5]==as.character(complement(DNAString(frequency_calls[i,5]))))){
                            results$ClinVar[i]<-snp_info2[1,6]
                        }
                    }
                }
            }
        }
        #Indels
        if(nchar(frequency_calls[i,4])!=1||nchar(frequency_calls[i,5])!=1){
            suppressWarnings(snp_info<-snpsByOverlaps(indels,
                                                      paste("ch",
                                                            frequency_calls[i,2],
                                                            ":",
                                                            frequency_calls[i,3],
                                                            "-",
                                                            (as.numeric(frequency_calls[i,3])+nchar(frequency_calls[i,4])-1),
                                                            sep="")))
            if(length(snp_info)>0){
                snp_info_rs<-snp_info$RefSNP_id[(start(ranges(snp_info))<=frequency_calls[i,3])&(end(ranges(snp_info))>=(as.numeric(frequency_calls[i,3])+nchar(frequency_calls[i,4])-1))]
                if(length(snp_info_rs)>0){
                    ncbi<-ncbi_snp_query(snp_info_rs)
                    for(j in seq_along(ncbi[,1])){
                        if(nchar(results[i,4])>nchar(results[i,5])){
                            if(length(grep(substr(results[i,4],2,
                                                  nchar(results[i,4])),
                                           ncbi[j,9]))>0){
                                results[i,6]<-ncbi[j,1]
                            }
                        }
                        if(nchar(results[i,4])<nchar(results[i,5])){
                            if(length(grep(substr(results[i,5],2,
                                                  nchar(results[i,5])),
                                           ncbi[j,9]))>0){
                                results[i,6]<-ncbi[j,1]
                            }
                        }
                    }
                }
            }
            if(cosmicDB==TRUE){
                snp_info<-rowRanges(cosmic_67)[as.character(seqnames(rowRanges(cosmic_67)))==frequency_calls[i,2]&start(ranges(rowRanges(cosmic_67)))==frequency_calls[i,3]]
                if(length(snp_info)>0){
                    for(j in seq_along(snp_info[,1])){
                        if(snp_info$REF==frequency_calls[i,4]&&
                           snp_info$ALT[[1]]==frequency_calls[i,5]||
                           (snp_info$REF==as.character(complement(DNAString(frequency_calls[i,4])))&&
                            snp_info$ALT[[1]]==as.character(complement(DNAString(frequency_calls[i,5]))))){
                            snp_info2<-info(cosmic_67)[rownames(info(cosmic_67))==names(snp_info[j,]),]
                            grep_c.<-grep(snp_info2$CDS,
                                          as.character(strsplit(c.[i],
                                                                split=",")[[1]]))
                            grep_c.comp<-grep(snp_info2$CDS,
                                              as.character(strsplit(c.complement[i],
                                                                    split=",")[[1]]))
                            grep_p.<-grep(snp_info2$AA,
                                          as.character(strsplit(p.[i],
                                                                split=",")[[1]]))
                            if(length(intersect(grep_c.,grep_p.))>0||
                               length(intersect(grep_c.comp,grep_p.))>0){
                                if(!is.na(results$CosmicID[i])){
                                    results$CosmicID[i]<-paste(results$CosmicID[i],
                                                               names(snp_info[j,]),
                                                               sep=",")
                                    results$Cosmic_Counts[i]<-paste(results$Cosmic_Counts[i],
                                                                    snp_info2$CNT,
                                                                    sep=",")
                                }
                                if(is.na(results$CosmicID[i])){
                                    results$CosmicID[i]<-names(snp_info[j,])
                                    results$Cosmic_Counts[i]<-snp_info2$CNT
                                }
                            }
                        }
                    }
                }
            }
            if(clinvarDB==TRUE){
                snp_info_temp<-data.frame()
                for(j in seq_along(strsplit(frequency_calls[i,14],
                                           split=",")[[1]])){
                    if(!is.na(strsplit(frequency_calls[i,14],split=",")[[1]][j])){
                        temp<-clinvar[grep(strsplit(frequency_calls[i,14],
                                                    split=",")[[1]][j],
                                           clinvar[,1]),]
                        temp2<-temp[nchar(temp[,4])>1|nchar(temp[,5])>1|temp[,4]=="-"|temp[,5]=="-",]
                        if(length(snp_info_temp)>0){
                            snp_info_temp<-rbind(snp_info_temp,temp2)
                        }
                        if(length(snp_info_temp[1,1])==0){
                            snp_info_temp<-temp2
                        }
                    }

                }
                snp_info<-unique(snp_info_temp)
                if(length(snp_info)>0){
                    snp_info2<-snp_info[snp_info[,2]==(as.numeric(frequency_calls[i,3])-1),]
                    if(length(snp_info2[,1])>0){
                        for(j in seq_along(snp_info2[,1])){
                            if(snp_info2[j,4]=="-"&&
                               snp_info2[j,5]==substr(frequency_calls[i,5],2,
                                                      nchar(frequency_calls[i,5]))){
                                results$ClinVar[i]<-snp_info2[j,6]
                            }
                            if(snp_info2[j,5]=="-"&&
                               snp_info2[j,4]==substr(frequency_calls[i,4],2,
                                                      nchar(frequency_calls[i,4]))){
                                results$ClinVar[i]<-snp_info2[j,6]
                            }
                        }
                    }
                }
            }

        }
    }
    if(length(results[!is.na(results[,6]),6])<=3){
        suppressWarnings(ncbi<-ncbi_snp_query(results[!is.na(results[,6]),6]))
    }
    if(length(results[!is.na(results[,6]),6])>3){
        abfrage<-results[!is.na(results[,6]),6]
        if(((length(results[!is.na(results[,6]),6])-1)%%3)==0){
            limits<-seq(1,length(results[!is.na(results[,6]),6]),3)
        }
        if(((length(results[!is.na(results[,6]),6])-1)%%3)!=0){
            limits<-c(seq(1,length(results[!is.na(results[,6]),6]),3),
                      length(results[!is.na(results[,6]),6]))
        }
        suppressWarnings(ncbi<-ncbi_snp_query2(abfrage[1:3]))
        for(i in 2:(length(limits)-1)){
            suppressWarnings(temp<-ncbi_snp_query2(abfrage[limits[i]:(limits[i+1]-1)]))
            ncbi<-rbind(ncbi,temp)
        }
    }
    for(i in seq_along(results[,1])){
        if(!is.na(results[i,6])){
            suppressWarnings(results$dbSNP_MAF[i]<-as.numeric(max(ncbi[ncbi[,1]==results[i,6],10])))
            if(sum(ncbi[ncbi[,1]==results[i,6],9]==results[i,4],na.rm=TRUE)>0){
                if(!is.na(results$dbSNP_MAF[i])){
                    results$dbSNP_MAF[i]<-1-results$dbSNP_MAF[i]
                }
                if(!is.na(results$G1000_AF[i])){
                    results$G1000_AF[i]<-1-results$G1000_AF[i]
                }
                if(!is.na(results$ExAC_AF[i])){
                    results$ExAC_AF[i]<-1-results$ExAC_AF[i]
                }
                if(!is.na(results$ESP6500_AF[i])){
                    results$ESP6500_AF[i]<-1-results$ESP6500_AF[i]
                }
                if(!is.na(results$GAD_AF[i])){
                    results$GAD_AF[i]<-1-results$GAD_AF[i]
                }
            }
        }
    }

    results<-cbind(results,Prediction=NA,Score=NA)
    message("6. Determine Extended Set of Characteristics (prediction)")
    if(predict!="PolyPhen2"){
        for(i in seq(1,length(results[,6]))[!is.na(results[,6])]){
            suppressWarnings(info<-select(SIFT.Hsapiens.dbSNP137,
                                          keys=substr(results[i,6],3,
                                                      nchar(results[i,6]))))
            if(length(info)>0){
                if(predict=="SIFT"){
                    #score <0.05 -> damaging (else: tolerated)
                    results$Prediction[i]<-info[which.min(info[,15]),16]
                    results$Score[i]<-min(info[,15])
                }
                if(predict=="Provean"){
                    #score <-2.5 -> deleterious (else: neutral)
                    results$Prediction[i]<-info[which.min(info[,11]),12]
                    results$Score[i]<-min(info[,11])
                }
            }
        }
    }
    if(predict=="PolyPhen2"){
        #Polyphen (probably damaging, possibly damaging, benign, unknown);
        #probability of variant being damaging
        for(i in seq(1,length(results[,6]))[!is.na(results[,6])]){
            suppressWarnings(info<-select(PolyPhen.Hsapiens.dbSNP131,
                                          keys=results[i,6]))
            if(length(info)>0){
                if(is.na(max(info[,19]))){
                    results$Prediction[i]<-"unknown"
                    results$Score[i]<-max(info[,19])
                }
                if(!is.na(max(info[,19]))){
                    results$Prediction[i]<-info[which.max(info[,19]),15]
                    results$Score[i]<-max(info[,19])
                }
            }
        }
    }
    if(dbSNP==FALSE){
        database_calls<-cbind(results[,c(1:5,8:(length(results[1,])))],c.,
                              c.complement,p.)
    }
    if(dbSNP==TRUE){
        database_calls<-cbind(results,c.,c.complement,p.)
    }
    if(output_folder!=""){
        write.table(database_calls,
                    paste(output_folder,"/Results_Databases.txt",sep=""),
                    row.names=FALSE,quote=FALSE,sep="\t")
    }
    database_calls_g<-exportAsGRanges(database_calls)
    return(database_calls_g)
}

#Perform 7th analysis step - Final Filtration
finalFiltration <- function(output_folder,frequency_calls_g,database_calls_g,
                            combined_calls_g,damaging_safe,tolerated_safe,
                            primer=NA,hotspots=NA,overlapTools,nrsamples=3,
                            dp=50,nr_alt=20,vaf=0.01,bq=15,bq_diff=7,
                            detectedLow=2,detectedHigh=2,isIndel=1,isIndelVAF=1,
                            detectedLowVAF=2,noPrimerP=1,primerPAlt=-1,
                            noPrimerPFwd=1,primerPFwd=-1,noPrimerPRev=1,
                            primerPRev=-1,primerLocation=-1,vafLow=2,
                            databaseVAF=1,databaseHigh=1,predictionSafe=-1,
                            predictionVAF=1,nrcaller4=4,reward4=-1,nrcaller5=5,
                            reward5=-1,nrcaller6=6,reward6=-1,oneCaller=1,
                            BQ_AltMean=4,knownHotspot=-3,overlapReward=-3,
                            artifactThreshold=0,polyDetected=1,
                            polyDetectedOnce=-1,polyDatabasesPolyLow=2,
                            polyDatabasesPolyLowReward=1,
                            polyDatabasesPolyHigh=4,
                            polyDatabasesPolyHighReward=1,polyDatabasesMut=2,
                            polyDatabasesMutReward=-1,polyNoDatabase=-1,
                            polyDatabases=6,polyDatabasesReward=1,polyEffect=1,
                            polyVAF=1,polyPrediction=1,polyPredictionEffect=-1,
                            polyCosmic=100,polyThresholdCritical=2,
                            polyThreshold=3,PolymorphismVAF10=5,
                            PolymorphismVAF20=2,PolymorphismFrame=2) {
    #check if output folder really exists
    if(output_folder!=""&&file.exists(output_folder)==FALSE){
        message("Your output folder does not exist")
        return()
    }
    frequency_calls<-importAsDataFrame(frequency_calls_g)
    database_calls<-importAsDataFrame(database_calls_g)
    combined_calls<-importAsDataFrame(combined_calls_g)

    #7. Perform Final Filtration
    message("7. Perform Final Filtration")
    nrsamples_high<-ceiling(length(unique(frequency_calls[,1]))/2)
    if(nrsamples_high==1){
        nrsamples_high<-2
    }
    limit_provean<-damaging_safe
    limit_provean2<-tolerated_safe

    results<-cbind(frequency_calls[,c(1:5,14:16,6,13)],
                   database_calls[,c((length(database_calls[1,])-2):length(database_calls[1,]))],
                   frequency_calls[,c(11,12)],Nr_Ref=frequency_calls$Nr_Ref,
                   Nr_Alt=frequency_calls$Nr_Alt,DP=frequency_calls$DP,
                   VAF=frequency_calls$VAF,
                   frequency_calls[,c(17:(length(frequency_calls[1,])-14))],
                   Called=rowSums(frequency_calls[,c(17:(length(frequency_calls[1,])-14))],na.rm=TRUE),
                   database_calls[,c(6:(length(database_calls[1,])-3))],
                   frequency_calls[,c((length(frequency_calls[1,])-9):(length(frequency_calls[1,])))])

    artifact_because<-data.frame(nr_samples=rep(NA,length(frequency_calls[,1])),
                                 nr_samples_similar=rep(NA,
                                                        length(frequency_calls[,1])),
                                 nr_databases=rep(NA,
                                                  length(frequency_calls[,1])),
                                 polymorphism_db=rep(NA,
                                                     length(frequency_calls[,1])),
                                 mutation_db=rep(NA,
                                                 length(frequency_calls[,1])),
                                 cosmic_nr=rep(NA,length(frequency_calls[,1])),
                                 Poly_freq=rep(NA,length(frequency_calls[,1])))

    #filter frequency
    message("->  Consider Frequency and Base Quality")
    include1<-results$DP>=dp
    include2<-results$Nr_Alt>=nr_alt
    include3<-results$VAF>=vaf
    include4<-results$BQ_ALT>=bq
    include5<-(results$BQ_REF-results$BQ_ALT)<=bq_diff
    temp<-results[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
    results<-temp
    temp<-frequency_calls[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
    frequency_calls<-temp
    temp<-database_calls[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
    database_calls<-temp
    temp<-artifact_because[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
    artifact_because<-temp

    #nr of samples
    message("->  Consider samples with the same call")
    for(i in seq_along(results[,1])){
        if((i%%100)==0){
            message("Call ",i," out of ",length(results[,1]))
        }
        artifact_because[i,1]<-length(combined_calls[intersect(intersect(grep(results[i,2],combined_calls[,2]),grep(results[i,3],combined_calls[,3])),intersect(grep(results[i,4],combined_calls[,4]),grep(results[i,5],combined_calls[,5]))),1])
    }

    message("->  Consider samples with a call at the same position")
    for(i in seq_along(results[,1])){
        if((i%%100)==0){
            message("Call ",i," out of ",length(results[,1]))
        }
        artifact_because[i,2]<-length(combined_calls[intersect(grep(results[i,2],combined_calls[,2]),grep(results[i,3],combined_calls[,3])),1])
    }

    message("->  Consider background information")
    background_info<-rep(0,length(results[,1]))
    start<-0
    ende<-0
    neu<-TRUE
    i<-1
    while(i<=length(results[,1])){
        if(neu==TRUE){
            start<-ende<-i
        }
        i<-i+1
        if(i<=length(results[,1])&&
           as.character(results[i,2])==as.character(results[i-1,2])&&
           results[i,3]==results[i-1,3]&&
           results[i,4]==results[i-1,4]&&
           results[i,5]==results[i-1,5]){
            ende<-i
            neu<-FALSE
        }
        if(i>length(results[,1])||
           as.character(results[i,2])!=as.character(results[i-1,2])||
           results[i,3]!=results[i-1,3]||
           results[i,4]!=results[i-1,4]||
           results[i,5]!=results[i-1,5]){
            for(j in start:ende){
                background_info[j]<-ende-start+1
                neu<-TRUE
            }
        }
    }

    #databases
    message("->  Consider nr of databases")
    if(length(database_calls[1,])>10){
        if(length(grep("dbSNP",names(database_calls)))>0){
            for(i in seq_along(database_calls[,1])){
                if(!is.na(results$dbSNP[i])){
                    artifact_because[i,3]<-sum(artifact_because[i,3],1,
                                               na.rm=TRUE)
                    if(!is.na(results$dbSNP_MAF[i])&&
                       as.numeric(results$dbSNP_MAF[i])<=0.001){
                        artifact_because[i,5]<-sum(artifact_because[i,5],1,
                                                   na.rm=TRUE)
                    }
                    if(!is.na(results$dbSNP_MAF[i])&&
                       as.numeric(results$dbSNP_MAF[i])>0.001){
                        artifact_because[i,4]<-sum(artifact_because[i,4],1,
                                                   na.rm=TRUE)
                    }
                }
            }
        }
        if(length(grep("G1000_AF",names(database_calls)))>0){
            for(i in seq_along(database_calls[,1])){
                if(!is.na(results$G1000_AF[i])){
                    artifact_because[i,3]<-sum(artifact_because[i,3],1,
                                               na.rm=TRUE)
                    if(as.numeric(results$G1000_AF[i])<=0.001){
                        artifact_because[i,5]<-sum(artifact_because[i,5],1,
                                                   na.rm=TRUE)
                    }
                    if(as.numeric(results$G1000_AF[i])>0.001){
                        artifact_because[i,4]<-sum(artifact_because[i,4],1,
                                                   na.rm=TRUE)
                    }
                }
            }
        }
        if(length(grep("ExAC_AF",names(database_calls)))>0){
            for(i in seq_along(database_calls[,1])){
                if(!is.na(results$ExAC_AF[i])){
                    artifact_because[i,3]<-sum(artifact_because[i,3],1,
                                               na.rm=TRUE)
                    if(as.numeric(results$ExAC_AF[i])<=0.0005){
                        artifact_because[i,5]<-sum(artifact_because[i,5],1,
                                                   na.rm=TRUE)
                    }
                    if(as.numeric(results$ExAC_AF[i])>0.0005){
                        artifact_because[i,4]<-sum(artifact_because[i,4],1,
                                                   na.rm=TRUE)
                    }
                }
            }
        }
        if(length(grep("ESP6500_AF",names(database_calls)))>0){
            for(i in seq_along(database_calls[,1])){
                if(!is.na(results$ESP6500_AF[i])){
                    artifact_because[i,3]<-sum(artifact_because[i,3],1,
                                               na.rm=TRUE)
                    if(as.numeric(results$ESP6500_AF[i])<=0.0003){
                        artifact_because[i,5]<-sum(artifact_because[i,5],1,
                                                   na.rm=TRUE)
                    }
                    if(as.numeric(results$ESP6500_AF[i])>0.0003){
                        artifact_because[i,4]<-sum(artifact_because[i,4],1,
                                                   na.rm=TRUE)
                    }
                }
            }
        }
        if(length(grep("GAD_AF",names(database_calls)))>0){
            for(i in seq_along(database_calls[,1])){
                if(!is.na(results$GAD_AF[i])){
                    artifact_because[i,3]<-sum(artifact_because[i,3],1,
                                               na.rm=TRUE)
                    if(as.numeric(results$GAD_AF[i])<=0.001){
                        artifact_because[i,5]<-sum(artifact_because[i,5],1,
                                                   na.rm=TRUE)
                    }
                    if(as.numeric(results$GAD_AF[i])>0.001){
                        artifact_because[i,4]<-sum(artifact_because[i,4],1,
                                                   na.rm=TRUE)
                    }
                }
            }
        }
        if(length(grep("CosmicID",names(database_calls)))>0){
            for(i in seq_along(database_calls[,1])){
                if(!is.na(results$CosmicID[i])){
                    artifact_because[i,3]<-sum(artifact_because[i,3],1,
                                               na.rm=TRUE)
                    artifact_because[i,6]<-sum(as.numeric(strsplit(as.character(database_calls$Cosmic_Counts[i]),split=",")[[1]]))
                    if(artifact_because[i,6]>20){
                        artifact_because[i,5]<-sum(artifact_because[i,5],1,
                                                   na.rm=TRUE)
                    }
                    if(artifact_because[i,6]<=20){
                        artifact_because[i,4]<-sum(artifact_because[i,4],1,
                                                   na.rm=TRUE)
                    }
                }
            }
        }
        if(length(grep("ClinVar",names(database_calls)))>0){
            for(i in seq_along(database_calls[,1])){
                if(!is.na(results$ClinVar[i])){
                    artifact_because[i,3]<-sum(artifact_because[i,3],1,
                                               na.rm=TRUE)
                    if(length(grep("Pathogenic",results$ClinVar[i],
                                   ignore.case = TRUE))>0){
                        artifact_because[i,5]<-sum(artifact_because[i,5],1,
                                                   na.rm=TRUE)
                    }
                    if(length(grep("Benign",results$ClinVar[i],
                                   ignore.case = TRUE))>0){
                        artifact_because[i,4]<-sum(artifact_because[i,4],1,
                                                   na.rm=TRUE)
                    }
                }
            }
        }
    }

    #tolerated and freq
    message("->  Consider VAF when tolerated")
    for(i in seq_along(results[,1])){
        if(!is.na(results$VAF[i])&&((results$VAF[i]>=0.35&&
                                     results$VAF[i]<=0.65)||
                                    (results$VAF[i]>=0.85))){
            artifact_because[i,7]<-1
        }
        if(!is.na(results$VAF[i])&&(results$VAF[i]<0.35||
                                    (results$VAF[i]>0.65&&
                                     results$VAF[i]<0.85))){
            artifact_because[i,7]<-0
        }
    }

    #large number of samples and high VAF
    message("->  Consider VAF when high nr of samples")
    i<-1
    while(i<=length(results[,1])){
        subset<-results[i:(i+background_info[i]-1),]
        if(length(subset[,1])>nrsamples&&
           sum(!is.na(subset$VAF))==length(subset[,1])&&
           sum(subset$VAF>0.85)>=floor(0.9*length(subset[,1]))){
            artifact_because[i:(i+background_info[i]-1),7]<-2
        }
        i<-i+background_info[i]
    }

    #test for strand bias
    message("->  Consider strand bias")
    strandbias<-rep(NA,length(results[,1]))
    for(i in seq_along(results[,1])){
        if(!is.na(results$Nr_Ref_fwd[i])&&!is.na(results$Nr_Alt_fwd[i])&&
           !is.na(results$Nr_Ref_rev[i])&&!is.na(results$Nr_Alt_rev[i])){
            test<-fisher.test(x=matrix(c(results$Nr_Ref_fwd[i],
                                         results$Nr_Alt_fwd[i],
                                         results$Nr_Ref_rev[i],
                                         results$Nr_Alt_rev[i]),ncol=2))
            strandbias[i]<-test$p.value
        }
        if(sum(is.na(primer))==0){
            chr<-as.character(results[i,2])==as.character(primer[,1])
            start<-results[i,3]>primer[,2]
            end<-(as.numeric(results[i,3])+nchar(results[i,4])-1)<=primer[,3]
            if(sum(rowSums(cbind(chr,start,end))==3)>0){
                strandbias[i]<-2
            }
        }
    }

    #check for hotspots
    message("->  Consider hotspot list")
    hotspot<-rep(NA,length(results[,1]))
    if(length(hotspots)!=1){
        for(i in seq_along(hotspots[,1])){
            if((i%%100)==0){
                message("Hotspot ",i," out of ",length(hotspots[,1]))
            }
            found1<-grep(hotspots[i,1],results$Gene)
            if(length(found1)>0){
                if(length(grep("fs",hotspots[i,2]))==0&&
                   length(grep("del",hotspots[i,2]))==0&&
                   length(grep("ins",hotspots[i,2]))==0){
                    #Just an SNV
                    found2<-grep(hotspots[i,2],results$p.,fixed=TRUE)
                    flag<-NA
                    if(length(found2)>0){
                        flag<-rep(FALSE,length(results[,1]))
                        if(is.na(hotspots[i,3])){
                            for(j in seq_along(found2)){
                                flag[found2[j]]<-nchar(results$Ref[found2[j]])==1&&nchar(results$Alt[found2[j]])==1
                            }
                        }
                        if(!is.na(hotspots[i,3])){
                            for(j in seq_along(found2)){
                                flag[found2[j]]<-nchar(results$Ref[found2[j]])==1&&nchar(results$Alt[found2[j]])==1&&as.numeric(results$VAF[found2[j]])>=as.numeric(hotspots[i,3])
                            }
                        }
                    }
                }
                if(length(grep("fs",hotspots[i,2]))>0){
                    #frameshift
                    searchstring<-substr(hotspots[i,2],2,
                                         (nchar(hotspots[i,2])-2))
                    found2<-grep(searchstring,results$p.)
                    flag<-NA
                    if(length(found2)>0){
                        flag<-rep(FALSE,length(results[,1]))
                        if(is.na(hotspots[i,3])){
                            for(j in seq_along(found2)){
                                flag[found2[j]]<-(nchar(results$Ref[found2[j]])-nchar(results$Alt[found2[j]]))!=0&&(abs(nchar(results$Ref[found2[j]])-nchar(results$Alt[found2[j]]))%%3)!=0
                            }
                        }
                        if(!is.na(hotspots[i,3])){
                            for(j in seq_along(found2)){
                                flag[found2[j]]<-(nchar(results$Ref[found2[j]])-nchar(results$Alt[found2[j]]))!=0&&(abs(nchar(results$Ref[found2[j]])-nchar(results$Alt[found2[j]]))%%3)!=0&&as.numeric(results$VAF[found2[j]])>=as.numeric(hotspots[i,3])
                            }
                        }
                    }
                }
                if(length(grep("del",hotspots[i,2]))>0){
                    #deletion
                    searchstring_temp<-substr(hotspots[i,2],2,
                                              (nchar(hotspots[i,2])-3))
                    searchstring<-strsplit(searchstring_temp,split="_")[[1]][1]
                    found2<-grep(searchstring,results$p.)
                    flag<-NA
                    if(length(found2)>0){
                        flag<-rep(FALSE,length(results[,1]))
                        if(is.na(hotspots[i,3])){
                            for(j in seq_along(found2)){
                                flag[found2[j]]<-nchar(results$Ref[found2[j]])>1&&(abs(nchar(results$Ref[found2[j]])-nchar(results$Alt[found2[j]]))%%3)!=0
                            }
                        }
                        if(!is.na(hotspots[i,3])){
                            for(j in seq_along(found2)){
                                flag[found2[j]]<-nchar(results$Ref[found2[j]])>1&&(abs(nchar(results$Ref[found2[j]])-nchar(results$Alt[found2[j]]))%%3)!=0&&as.numeric(results$VAF[found2[j]])>=as.numeric(hotspots[i,3])
                            }
                        }
                    }
                }
                if(length(grep("ins",hotspots[i,2]))>0){
                    #deletion
                    searchstring_temp<-substr(hotspots[i,2],2,
                                              (nchar(hotspots[i,2])-3))
                    searchstring<-strsplit(searchstring_temp,split="_")[[1]][1]
                    found2<-grep(searchstring,results$p.)
                    flag<-NA
                    if(length(found2)>0){
                        flag<-rep(FALSE,length(results[,1]))
                        if(is.na(hotspots[i,3])){
                            for(j in seq_along(found2)){
                                flag[found2[j]]<-nchar(results$Alt[found2[j]])>1&&(abs(nchar(results$Ref[found2[j]])-nchar(results$Alt[found2[j]]))%%3)!=0
                            }
                        }
                        if(!is.na(hotspots[i,3])){
                            for(j in seq_along(found2)){
                                flag[found2[j]]<-nchar(results$Alt[found2[j]])>1&&(abs(nchar(results$Ref[found2[j]])-nchar(results$Alt[found2[j]]))%%3)!=0&&as.numeric(results$VAF[found2[j]])>=as.numeric(hotspots[i,3])
                            }
                        }
                    }
                }
                if(length(intersect(found1,found2))>0){
                    for(j in intersect(found1,found2)){
                        if(flag[j]==TRUE){
                            hotspot[j]<-1
                        }
                    }
                }
            }
        }
    }

    ##final filtration
    results<-cbind(results,strandbias,artifact_because[,c(1:2)],Category=NA)
    #artifact score
    message("->  Perform final filtration")
    artifact_score<-rep(0,length(results[,1]))
    message("Calculate Artifact Score")
    for(i in seq_along(results[,1])){
        if((i%%100)==0){
            message("Call ",i," out of ",length(results[,1]))
        }
        if(results$nr_samples[i]>nrsamples){
            artifact_score[i]<-artifact_score[i]+detectedLow
        }
        if(results$nr_samples[i]>nrsamples_high&&is.na(hotspot[i])){
            artifact_score[i]<-artifact_score[i]+detectedHigh
        }
        if((nchar(results$Ref[i])>1||nchar(results$Alt[i])>1)&&
           results$nr_samples_similar[i]>results$nr_samples[i]){
            artifact_score[i]<-artifact_score[i]+isIndel
        }
        if((nchar(results$Ref[i])>1||nchar(results$Alt[i])>1)&&
           !is.na(results$VAF[i])&&results$VAF[i]<0.05){
            artifact_score[i]<-artifact_score[i]+isIndelVAF
        }
        if(!is.na(artifact_because[i,7])&&artifact_because[i,7]==2){
            artifact_score[i]<-artifact_score[i]+detectedLowVAF
        }
        if(sum(is.na(primer))==0||(!is.na(results$strandbias[i])&&
                                   results$strandbias[i]!=2)){
            if(!is.na(results$strandbias[i])&&results$strandbias[i]<0.001){
                artifact_score[i]<-artifact_score[i]+noPrimerP
            }
            if(!is.na(results$Nr_Alt_fwd[i])&&!is.na(results$Nr_Alt_rev[i])&&
               (results$Nr_Alt_fwd[i]>=(nr_alt/2)&&
                results$Nr_Alt_rev[i]>=(nr_alt/2))&&
               results$strandbias[i]<0.001){
                artifact_score[i]<-artifact_score[i]+primerPAlt
            }
            if(!is.na(results$Nr_Ref_fwd[i])&&!is.na(results$Nr_Alt_fwd[i])&&
               (results$Nr_Alt_fwd[i]<=2&&
                results$Nr_Ref_fwd[i]>=(dp-nr_alt)/2)&&
               results$strandbias[i]>=0.001){
                artifact_score[i]<-artifact_score[i]+noPrimerPFwd
            }
            if(!is.na(results$Nr_Ref_fwd[i])&&!is.na(results$Nr_Alt_fwd[i])&&
               (results$Nr_Alt_fwd[i]<=2&&
                results$Nr_Ref_fwd[i]<(dp-nr_alt)/2)&&
               results$strandbias[i]<0.001){
                artifact_score[i]<-artifact_score[i]+primerPFwd
            }
            if(!is.na(results$Nr_Ref_rev[i])&&!is.na(results$Nr_Alt_rev[i])&&
               (results$Nr_Alt_rev[i]<=2&&
                results$Nr_Ref_rev[i]>=(dp-nr_alt)/2)&&
               results$strandbias[i]>=0.001){
                artifact_score[i]<-artifact_score[i]+noPrimerPRev
            }
            if(!is.na(results$Nr_Ref_rev[i])&&!is.na(results$Nr_Alt_rev[i])&&
               (results$Nr_Alt_rev[i]<=2&&
                results$Nr_Ref_rev[i]<(dp-nr_alt)/2)&&
               results$strandbias[i]<0.001){
                artifact_score[i]<-artifact_score[i]+primerPRev
            }
        }
        if(sum(is.na(primer))!=0&&!is.na(results$strandbias[i])&&
           results$strandbias[i]==2){
            artifact_score[i]<-artifact_score[i]+primerLocation
        }
        if(!is.na(results$VAF[i])&&results$VAF[i]<0.02){
            artifact_score[i]<-artifact_score[i]+vafLow
        }
        if(is.na(artifact_because[i,3])&&!is.na(results$VAF[i])&&
           results$VAF[i]<0.10){
            artifact_score[i]<-artifact_score[i]+databaseVAF
        }
        if(is.na(artifact_because[i,3])&&results$nr_samples[i]>nrsamples_high){
            artifact_score[i]<-artifact_score[i]+databaseHigh
        }
        if((!is.na(results$Score[i])&&results$Score[i]<limit_provean)){
            artifact_score[i]<-artifact_score[i]+predictionSafe
        }
        if(!is.na(results$Score[i])&&results$Score[i]>limit_provean2&&
           !is.na(artifact_because[i,7])&&artifact_because[i,7]==0){
            artifact_score[i]<-artifact_score[i]+predictionVAF
        }
        if(results$Called[i]>=nrcaller4){
            artifact_score[i]<-artifact_score[i]+reward4
        }
        if(results$Called[i]>=nrcaller5){
            artifact_score[i]<-artifact_score[i]+reward5
        }
        if(results$Called[i]>=nrcaller6){
            artifact_score[i]<-artifact_score[i]+reward6
        }
        if(results$Called[i]==1){
            artifact_score[i]<-artifact_score[i]+oneCaller
        }
        if(!is.na(results$BQ_ALT[i])&&
           results$BQ_ALT[i]<(mean(results$BQ_ALT,na.rm=TRUE)-3*sd(results$BQ_ALT,na.rm=TRUE))){
            artifact_score[i]<-artifact_score[i]+BQ_AltMean
        }
        if(!is.na(hotspot[i])){
            artifact_score[i]<-artifact_score[i]+knownHotspot
        }
        temp<-frequency_calls[i,17:(length(frequency_calls[1,])-14)]
        temp<-temp[,!is.na(temp)]
        if(length(intersect(names(temp),overlapTools))==length(overlapTools)){
            artifact_score[i]<-artifact_score[i]+overlapReward
        }
        if(artifact_score[i]>=artifactThreshold){
            results$Category[i]<-paste("Artifact (",artifact_score[i],")",
                                       sep="")
        }
        if(artifact_score[i]<artifactThreshold&&is.na(hotspot[i])){
            results$Category[i]<-paste("Probably True (",artifact_score[i],")",
                                       sep="")
        }
        if(artifact_score[i]<artifactThreshold&&!is.na(hotspot[i])){
            results$Category[i]<-paste("Hotspot (",artifact_score[i],")",sep="")
        }
    }

    #polymorphism score
    poly_score<-rep(0,length(results[,1]))
    cosmic_flag<-rep(FALSE,length(results[,1]))
    message("Calculate Polymorphism Score")
    for(i in seq_along(results[,1])){
        if((i%%100)==0){
            message("Call ",i," out of ",length(results[,1]))
        }
        if(!is.na(results$nr_samples[i])&&results$nr_samples[i]>nrsamples){
            poly_score[i]<-poly_score[i]+polyDetected
        }
        if(!is.na(results$nr_samples[i])&&results$nr_samples[i]==1){
            poly_score[i]<-poly_score[i]+polyDetectedOnce
        }
        if(!is.na(artifact_because[i,4])&&
           artifact_because[i,4]>=polyDatabasesPolyLow){
            poly_score[i]<-poly_score[i]+polyDatabasesPolyLowReward
        }
        if(!is.na(artifact_because[i,4])&&
           artifact_because[i,4]>=polyDatabasesPolyHigh){
            poly_score[i]<-poly_score[i]+polyDatabasesPolyHighReward
        }
        if(!is.na(artifact_because[i,5])&&
           artifact_because[i,5]>=polyDatabasesMut){
            poly_score[i]<-poly_score[i]+polyDatabasesMutReward
        }
        if(is.na(artifact_because[i,4])){
            poly_score[i]<-poly_score[i]+polyNoDatabase
        }
        if(results$Called[i]>=polyDatabases){
            poly_score[i]<-poly_score[i]+polyDatabasesReward
        }
        if(!is.na(results$Consequence[i])&&
           vcountPattern(pattern="frameshift",
                         as.character(results$Consequence[i]))>0&&
           vcountPattern(pattern="*",as.character(results$p.[i]),
                         fixed = TRUE)==0){
            poly_score[i]<-poly_score[i]+polyEffect
        }
        if(!is.na(artifact_because[i,7])&&artifact_because[i,7]==1){
            poly_score[i]<-poly_score[i]+polyVAF
        }
        if(!is.na(results$Prediction[i])&&
           (results$Prediction[i]=="Tolerated"||
            results$Prediction[i]=="benign"||
            results$Prediction[i]=="Neutral")&&
           results$Score[i]>=limit_provean2){
            poly_score[i]<-poly_score[i]+polyPrediction
        }
        if(!is.na(results$Score[i])&&!is.na(results$p.[i])&&
           as.character(results$p.[i])!="NA"&&
           (results$Score[i]<=limit_provean||
            vcountPattern(pattern="*",
                          as.character(results$p.[i]),fixed = TRUE)>0)){
            poly_score[i]<-poly_score[i]+polyPredictionEffect
        }
        if(!is.na(results$Cosmic_Counts[i])&&
           results$Cosmic_Counts[i]>polyCosmic){
            cosmic_flag[i]<-TRUE
        }
        if(is.na(hotspot[i])&&poly_score[i]>=polyThresholdCritical&&
           cosmic_flag[i]==TRUE){
            results$Category[i]<-paste(results$Category[i],
                                       "Likely Polymorphism",sep="")
        }
        if(is.na(hotspot[i])&&((poly_score[i]>=polyThresholdCritical&&
                                cosmic_flag[i]==FALSE)
                               ||poly_score[i]>=polyThreshold)){
            results$Category[i]<-"Polymorphism"
        }
    }

    #corrections
    message("Correct Scores")
    for(i in seq_along(results[,1])){
        if((i%%100)==0){
            message("Call ",i," out of ",length(results[,1]))
        }
        if((poly_score[i]>=2&&cosmic_flag[i]==TRUE&&is.na(hotspot[i]))||
           (is.na(hotspot[i])&&((poly_score[i]>=2&&cosmic_flag[i]==FALSE)||
                                poly_score[i]>=3))){
            if(!is.na(results$VAF[i])&&results$VAF[i]<=0.1){
                artifact_score[i]<-artifact_score[i]+PolymorphismVAF10
                if(artifact_score[i]>=artifactThreshold){
                    results$Category[i]<-paste("Artifact (",artifact_score[i],
                                               ")",sep="")
                }
                if(artifact_score[i]<artifactThreshold&&is.na(hotspot[i])){
                    results$Category[i]<-paste("Probably True (",
                                               artifact_score[i],")",sep="")
                }
                if(artifact_score[i]<artifactThreshold&&!is.na(hotspot[i])){
                    results$Category[i]<-paste("Hotspot (",artifact_score[i],
                                               ")",sep="")
                }
            }
            if(!is.na(results$VAF[i])&&results$VAF[i]<=0.2){
                artifact_score[i]<-artifact_score[i]+PolymorphismVAF20
                if(artifact_score[i]>=artifactThreshold){
                    results$Category[i]<-paste("Artifact (",artifact_score[i],
                                               ")",sep="")
                }
                if(artifact_score[i]<artifactThreshold&&is.na(hotspot[i])){
                    results$Category[i]<-paste("Probably True (",
                                               artifact_score[i],")",sep="")
                }
                if(artifact_score[i]<artifactThreshold&&!is.na(hotspot[i])){
                    results$Category[i]<-paste("Hotspot (",artifact_score[i],
                                               ")",sep="")
                }
            }
            if(!is.na(results$Consequence[i])&&
               vcountPattern(pattern="frameshift",results$Consequence[i])>0){
                artifact_score[i]<-artifact_score[i]+PolymorphismFrame
                if(artifact_score[i]>=artifactThreshold){
                    results$Category[i]<-paste("Artifact (",artifact_score[i],
                                               ")",sep="")
                }
                if(artifact_score[i]<artifactThreshold&&is.na(hotspot[i])){
                    results$Category[i]<-paste("Probably True (",
                                               artifact_score[i],")",sep="")
                }
                if(artifact_score[i]<artifactThreshold&&!is.na(hotspot[i])){
                    results$Category[i]<-paste("Hotspot (",artifact_score[i],
                                               ")",sep="")
                }
            }
        }
    }

    #identical calls as polymorphism
    message("->  Re-consider polymorphisms")
    i<-1
    while(i<=length(results[,1])){
        subset<-results[i:(i+background_info[i]-1),]
        if(sum(subset$Category=="Polymorphism",na.rm=TRUE)>=1){
            for(j in i:(i+background_info[i]-1)){
                if(!is.na(results$VAF[j])&&results$VAF[j]>0.2){
                    results$Category[j]<-"Polymorphism"
                }
            }
        }
        i<-i+background_info[i]
    }

    results.artifacts<-results[vcountPattern(results$Category,pattern="Artifact")>0 | is.na(results$VAF) | (results$DP-results$Nr_Ref)<nr_alt,]
    results.polymorphisms<-results[vcountPattern(results$Category,pattern="Polymorphism")>0 & !is.na(results$VAF) & (results$DP-results$Nr_Ref)>=nr_alt,]
    results.mutations<-results[(vcountPattern(results$Category,pattern="True")>0 | vcountPattern(results$Category,pattern="Hotspot")>0) & !is.na(results$VAF) & (results$DP-results$Nr_Ref)>=nr_alt,]

    if(output_folder!=""){
        write.table(results,paste(output_folder,"/Results_Final.txt",sep=""),
                    row.names=FALSE,quote=FALSE,sep="\t")
        results.workbook <- createWorkbook()
        addWorksheet(wb=results.workbook,sheetName="Mutations")
        addWorksheet(wb=results.workbook,sheetName="Polymorphisms")
        addWorksheet(wb=results.workbook,sheetName="Artifacts")
        writeData(wb=results.workbook,x=results.mutations,sheet="Mutations")
        writeData(wb=results.workbook,x=results.polymorphisms,
                  sheet="Polymorphisms")
        writeData(wb=results.workbook,x=results.artifacts,sheet="Artifacts")
        saveWorkbook(results.workbook, paste(output_folder,
                                             "/Results_Final.xlsx",sep=""),
                     overwrite = TRUE)
    }
    results_g<-exportAsGRanges(results)
    return(results_g)
}



