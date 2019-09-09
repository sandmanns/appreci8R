#Open appreci8R GUI
appreci8Rshiny <- function() {
    shinyApp(
        ui=shinyUI(navbarPage("appreci8R",
                              tabPanel("Analysis",
                                       fluidRow(
                                           wellPanel(
                                               navbarPage(
                                                   title='',
                                                   tabPanel("Important notes",
                                                            h4("Important notes:"),
                                                            h5("Please make sure that all your files containing variant calling results as well as the corresponding
                                                               bam- and bai files start with the sample name (e.g. Sample1.vcf, Sample2_rawCalls.txt or Sample3.bam)."),
                                                            h5("Currently, the analysis is just available for variant calling results, target regions and bam files
                                                               using \'1\', \'2\' etc. and not \'chr1\', \'chr2\'."),
                                                            h5("Currently, the analysis is just available for hg19/GRCh37.")),

                                                   tabPanel("0. Preparations",
                                                            h3("0. Preparations:"),
                                                            uiOutput("output_folderUI"),
                                                            hr(),

                                                            h3("Variant Caller Input (appreci8R):"),
                                                            h4("GATK:"),
                                                            actionButton("gatk_add","Add"),
                                                            actionButton("gatk_remove","Remove"),
                                                            hr(),
                                                            uiOutput("gatkUI1"),
                                                            uiOutput("gatkUI2"),
                                                            uiOutput("gatkUI3"),
                                                            uiOutput("gatkUI4"),
                                                            uiOutput("gatkUI5"),
                                                            uiOutput("gatkUI6"),
                                                            uiOutput("gatkUI7"),
                                                            uiOutput("gatkUI8"),

                                                            h4("Platypus:"),
                                                            actionButton("platypus_add","Add"),
                                                            actionButton("platypus_remove","Remove"),
                                                            hr(),
                                                            uiOutput("platypusUI1"),
                                                            uiOutput("platypusUI2"),
                                                            uiOutput("platypusUI3"),
                                                            uiOutput("platypusUI4"),
                                                            uiOutput("platypusUI5"),
                                                            uiOutput("platypusUI6"),
                                                            uiOutput("platypusUI7"),
                                                            uiOutput("platypusUI8"),

                                                            h4("VarScan:"),
                                                            actionButton("varscan_add","Add"),
                                                            actionButton("varscan_remove","Remove"),
                                                            hr(),
                                                            uiOutput("varscanUI1"),
                                                            uiOutput("varscanUI2"),
                                                            uiOutput("varscanUI3"),
                                                            uiOutput("varscanUI4"),
                                                            uiOutput("varscanUI5"),
                                                            uiOutput("varscanUI6"),
                                                            uiOutput("varscanUI7"),
                                                            uiOutput("varscanUI8"),

                                                            h4("FreeBayes:"),
                                                            actionButton("freebayes_add","Add"),
                                                            actionButton("freebayes_remove","Remove"),
                                                            hr(),
                                                            uiOutput("freebayesUI1"),
                                                            uiOutput("freebayesUI2"),
                                                            uiOutput("freebayesUI3"),
                                                            uiOutput("freebayesUI4"),
                                                            uiOutput("freebayesUI5"),
                                                            uiOutput("freebayesUI6"),
                                                            uiOutput("freebayesUI7"),
                                                            uiOutput("freebayesUI8"),

                                                            h4("LoFreq:"),
                                                            actionButton("lofreq_add","Add"),
                                                            actionButton("lofreq_remove","Remove"),
                                                            hr(),
                                                            uiOutput("lofreqUI1"),
                                                            uiOutput("lofreqUI2"),
                                                            uiOutput("lofreqUI3"),
                                                            uiOutput("lofreqUI4"),
                                                            uiOutput("lofreqUI5"),
                                                            uiOutput("lofreqUI6"),
                                                            uiOutput("lofreqUI7"),
                                                            uiOutput("lofreqUI8"),

                                                            h4("SNVer:"),
                                                            actionButton("snver_add","Add"),
                                                            actionButton("snver_remove","Remove"),
                                                            hr(),
                                                            uiOutput("snverUI1"),
                                                            uiOutput("snverUI2"),
                                                            uiOutput("snverUI3"),
                                                            uiOutput("snverUI4"),
                                                            uiOutput("snverUI5"),
                                                            uiOutput("snverUI6"),
                                                            uiOutput("snverUI7"),
                                                            uiOutput("snverUI8"),

                                                            h4("SamTools:"),
                                                            actionButton("samtools_add","Add"),
                                                            actionButton("samtools_remove","Remove"),
                                                            hr(),
                                                            uiOutput("samtoolsUI1"),
                                                            uiOutput("samtoolsUI2"),
                                                            uiOutput("samtoolsUI3"),
                                                            uiOutput("samtoolsUI4"),
                                                            uiOutput("samtoolsUI5"),
                                                            uiOutput("samtoolsUI6"),
                                                            uiOutput("samtoolsUI7"),
                                                            uiOutput("samtoolsUI8"),

                                                            h4("VarDict:"),
                                                            actionButton("vardict_add","Add"),
                                                            actionButton("vardict_remove","Remove"),
                                                            hr(),
                                                            uiOutput("vardictUI1"),
                                                            uiOutput("vardictUI2"),
                                                            uiOutput("vardictUI3"),
                                                            uiOutput("vardictUI4"),
                                                            uiOutput("vardictUI5"),
                                                            uiOutput("vardictUI6"),
                                                            uiOutput("vardictUI7"),
                                                            uiOutput("vardictUI8"),

                                                            numericInput('nr_additional',"How many additional callers would you like to add? (max 5)",value=0,min=0,max=5),
                                                            actionButton("nr_additional_action","Go"),
                                                            hr(),
                                                            uiOutput("caller1UI0"),
                                                            uiOutput("caller1UI0.1"),
                                                            uiOutput("caller1UI1"),
                                                            uiOutput("caller1UI2"),
                                                            uiOutput("caller1UI3"),
                                                            uiOutput("caller1UI4"),
                                                            uiOutput("caller1UI5"),
                                                            uiOutput("caller1UI6"),
                                                            uiOutput("caller1UI7"),
                                                            uiOutput("caller1UI8"),

                                                            uiOutput("caller2UI0"),
                                                            uiOutput("caller2UI0.1"),
                                                            uiOutput("caller2UI1"),
                                                            uiOutput("caller2UI2"),
                                                            uiOutput("caller2UI3"),
                                                            uiOutput("caller2UI4"),
                                                            uiOutput("caller2UI5"),
                                                            uiOutput("caller2UI6"),
                                                            uiOutput("caller2UI7"),
                                                            uiOutput("caller2UI8"),

                                                            uiOutput("caller3UI0"),
                                                            uiOutput("caller3UI0.1"),
                                                            uiOutput("caller3UI1"),
                                                            uiOutput("caller3UI2"),
                                                            uiOutput("caller3UI3"),
                                                            uiOutput("caller3UI4"),
                                                            uiOutput("caller3UI5"),
                                                            uiOutput("caller3UI6"),
                                                            uiOutput("caller3UI7"),
                                                            uiOutput("caller3UI8"),

                                                            uiOutput("caller4UI0"),
                                                            uiOutput("caller4UI0.1"),
                                                            uiOutput("caller4UI1"),
                                                            uiOutput("caller4UI2"),
                                                            uiOutput("caller4UI3"),
                                                            uiOutput("caller4UI4"),
                                                            uiOutput("caller4UI5"),
                                                            uiOutput("caller4UI6"),
                                                            uiOutput("caller4UI7"),
                                                            uiOutput("caller4UI8"),

                                                            uiOutput("caller5UI0"),
                                                            uiOutput("caller5UI0.1"),
                                                            uiOutput("caller5UI1"),
                                                            uiOutput("caller5UI2"),
                                                            uiOutput("caller5UI3"),
                                                            uiOutput("caller5UI4"),
                                                            uiOutput("caller5UI5"),
                                                            uiOutput("caller5UI6"),
                                                            uiOutput("caller5UI7"),
                                                            uiOutput("caller5UI8"),
                                                            hr()),

                                                   tabPanel("1. Target filtration",
                                                            h3("1. Target filtration:"),
                                                            fileInput('targetRegions', 'Upload your target region (*.bed)'),
                                                            hr()),

                                                   tabPanel("2. Normalization",
                                                            h3("2. Normalization"),
                                                            hr()),

                                                   tabPanel("3. Annotation",
                                                            h3("3. Annotation:"),
                                                            h4("Important note:"),
                                                            h5("Currently, only UCSC is available."),
                                                            uiOutput("locationsUI"),
                                                            uiOutput("consequencesUI"),
                                                            hr()),

                                                   tabPanel("4. Combine output",
                                                            h3("4. Combine output"),
                                                            hr()),

                                                   tabPanel("5. Evaluate Coverage and BQ",
                                                            h3("5. Evaluate Coverage and BQ:"),
                                                            uiOutput("bam_folderUI"),
                                                            uiOutput("dpUI"),
                                                            uiOutput("nr_altUI"),
                                                            uiOutput("vafUI"),
                                                            uiOutput("bqUI"),
                                                            uiOutput("bq_diffUI"),
                                                            hr()),

                                                   tabPanel("6. Extended Set of Characteristics",
                                                            h3("6. Extended Set of Characteristics:"),
                                                            h4("What databases would you like to query?"),
                                                            uiOutput("dbSNPUI"),
                                                            uiOutput("1kgenomesUI"),
                                                            uiOutput("exacUI"),
                                                            uiOutput("espUI"),
                                                            uiOutput("gadUI"),
                                                            uiOutput("cosmicUI"),
                                                            uiOutput("clinvarUI"),
                                                            uiOutput("predictUI"),
                                                            hr()),

                                                   tabPanel("7. Final Filtration",
                                                            h3("7. Final Filtration:"),
                                                            fileInput('primerPositions', 'Optional: Upload your primer positions (*.bed)'),
                                                            fileInput('hotspots', 'Optional: Upload your hotspot list (*.txt)'),
                                                            h5("Please make sure your hotspot list has the following format:"),
                                                            h5("3 tab-seperated columns (with header)"),
                                                            h5(" 1. Gene (e.g. ASXL1)"),
                                                            h5(" 2. Mutation (e.g. V617F or G646fs or R420* or I836ins or P95_R102del or G12)"),
                                                            h5(" 3. Minimum expected frequency for that mutation (e.g. 0.1 or NA)"),
                                                            uiOutput("stricter_thresholdsUI"),
                                                            uiOutput("stricter_thresholdsUI2"),
                                                            uiOutput("nr_samplesUI"),
                                                            uiOutput("predictionUI1"),
                                                            uiOutput("predictionUI2"),
                                                            uiOutput("predictionUI3"),
                                                            uiOutput("artifact_scoreUI"),
                                                            uiOutput("artifact_scoreUI2"),
                                                            uiOutput("polymorphism_scoreUI"),
                                                            uiOutput("polymorphism_scoreUI2")),

                                                   tabPanel("Action",
                                                            actionButton("appreci8R", "Start complete analysis"),
                                                            actionButton("checkpointCheck","Check for possible checkpoints"),
                                                            actionButton("exportConfig","Export current configuration"),
                                                            actionButton("importConfig","Import configuration"),
                                                            actionButton("done","Done"),
                                                            hr(),
                                                            uiOutput("checkpointUI1"),
                                                            uiOutput("checkpointUI2"),
                                                            hr(),
                                                            uiOutput("exportconfigUI0"),
                                                            uiOutput("exportconfigUI0.1"),
                                                            hr(),
                                                            uiOutput("exportconfigUI1"),
                                                            uiOutput("exportconfigUI2"),
                                                            hr(),
                                                            uiOutput("messageUI1"),
                                                            hr(),
                                                            uiOutput("importconfigUI0"),
                                                            uiOutput("importconfigUI0.1"),
                                                            hr(),
                                                            uiOutput("importconfigUI1"),
                                                            uiOutput("importconfigUI2"),
                                                            hr(),
                                                            uiOutput("messageUI2")
                                                   ))))),
                              tabPanel("Overview results",
                                       wellPanel(
                                           navbarPage(
                                               title='',
                                               tabPanel("Log",
                                                        htmlOutput("log_info")),
                                               tabPanel("Raw Calls",
                                                        DT::dataTableOutput('table')),
                                               tabPanel("Calls On Target",
                                                        DT::dataTableOutput('table2')),
                                               tabPanel("Annotated Calls",
                                                        DT::dataTableOutput('table3')),
                                               tabPanel("Filtered Calls",
                                                        DT::dataTableOutput('table4'))
                                           )
                                       )
                              ),
                              tabPanel("Detailed results",
                                       wellPanel(
                                           navbarPage(
                                               title='',
                                               tabPanel("Mutations",
                                                        DT::dataTableOutput('table_mutations')),
                                               tabPanel("Polymorphisms",
                                                        DT::dataTableOutput('table_polymorphisms')),
                                               tabPanel("Artifacts",
                                                        DT::dataTableOutput('table_artifacts'))
                                           )
                                       )
                              )
                                       )),
        server = function(input, output) {
            observeEvent(input$done,{
                stopApp()
            })
            observeEvent(input$gatk_add,{
                output$gatkUI1<-renderUI({textInput('gatk_folder',
                                                    'Variant calling results',
                                                    "/home/gatk/")})
                output$gatkUI2<-renderUI({radioButtons('gatk_file_type',
                                                       "Output file type",
                                                       c(".vcf",".txt"),".vcf",
                                                       inline=TRUE)})
                output$gatkUI3<-renderUI({
                    conditionalPanel(
                        condition="input.gatk_file_type=='.txt'",
                        numericInput('gatk_chr',
                                     "In which column do you find Chr?",
                                     min = 1,max=20,value=1),
                        numericInput('gatk_pos',
                                     "In which column do you find Pos?",
                                     min = 1,max=20,value=2),
                        numericInput('gatk_ref',
                                     "In which column do you find Ref?",
                                     min = 1,max=20,value=3),
                        numericInput('gatk_alt',
                                     "In which column do you find Alt?",
                                     min = 1,max=20,value=4))})
                output$gatkUI4<-renderUI({textInput('gatk_file_names_add',
                                                    'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',".rawMutations")})
                output$gatkUI5<-renderUI({radioButtons('gatk_mnvs',
                                                       'MNVs reported?',
                                                       c("Yes","No"),"No",
                                                       inline = TRUE)})
                output$gatkUI6<-renderUI({radioButtons('gatk_snv_indel',
                                                       'SNVs and Indels reported in one file?',
                                                       c("Yes","No"),"Yes",
                                                       inline = TRUE)})
                output$gatkUI7<-renderUI({conditionalPanel(
                    condition="input.gatk_snv_indel=='No'",
                    textInput('gatk_snv_names_add','Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',""),
                    textInput('gatk_indel_names_add','Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',""))})
                output$gatkUI8<-renderUI({radioButtons('gatk_indels',
                                                       'How are Indels reported?',
                                                       c("CA>C","C>-A","CAAAC>CAAC"),
                                                       selected="CA>C",
                                                       inline = TRUE)})
            })

            observeEvent(input$gatk_remove,{
                output$gatkUI1<-renderUI({NULL})
                output$gatkUI2<-renderUI({NULL})
                output$gatkUI3<-renderUI({NULL})
                output$gatkUI4<-renderUI({NULL})
                output$gatkUI5<-renderUI({NULL})
                output$gatkUI6<-renderUI({NULL})
                output$gatkUI7<-renderUI({NULL})
                output$gatkUI8<-renderUI({NULL})
            })

            observeEvent(input$platypus_add,{
                output$platypusUI1<-renderUI({textInput('platypus_folder',
                                                        'Variant calling results',
                                                        "/home/platypus/")})
                output$platypusUI2<-renderUI({radioButtons('platypus_file_type',
                                                           "Output file type",
                                                           c(".vcf",".txt"),
                                                           ".vcf",inline=TRUE)})
                output$platypusUI3<-renderUI({
                    conditionalPanel(
                        condition="input.platypus_file_type=='.txt'",
                        numericInput('platypus_chr',
                                     "In which column do you find Chr?",
                                     min = 1,max=20,value=1),
                        numericInput('platypus_pos',
                                     "In which column do you find Pos?",
                                     min = 1,max=20,value=2),
                        numericInput('platypus_ref',
                                     "In which column do you find Ref?",
                                     min = 1,max=20,value=3),
                        numericInput('platypus_alt',
                                     "In which column do you find Alt?",
                                     min = 1,max=20,value=4))})
                output$platypusUI4<-renderUI({textInput('platypus_file_names_add',
                                                        'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                output$platypusUI5<-renderUI({radioButtons('platypus_mnvs',
                                                           'MNVs reported?',
                                                           c("Yes","No"),"No",
                                                           inline = TRUE)})
                output$platypusUI6<-renderUI({radioButtons('platypus_snv_indel',
                                                           'SNVs and Indels reported in one file?',
                                                           c("Yes","No"),"Yes",
                                                           inline = TRUE)})
                output$platypusUI7<-renderUI({conditionalPanel(
                    condition="input.platypus_snv_indel=='No'",
                    textInput('platypus_snv_names_add',
                              'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',""),
                    textInput('platypus_indel_names_add',
                              'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',""))})
                output$platypusUI8<-renderUI({radioButtons('platypus_indels',
                                                           'How are Indels reported?',
                                                           c("CA>C","C>-A",
                                                             "CAAAC>CAAC"),
                                                           "CA>C",
                                                           inline = TRUE)})
            })

            observeEvent(input$platypus_remove,{
                output$platypusUI1<-renderUI({NULL})
                output$platypusUI2<-renderUI({NULL})
                output$platypusUI3<-renderUI({NULL})
                output$platypusUI4<-renderUI({NULL})
                output$platypusUI5<-renderUI({NULL})
                output$platypusUI6<-renderUI({NULL})
                output$platypusUI7<-renderUI({NULL})
                output$platypusUI8<-renderUI({NULL})
            })

            observeEvent(input$varscan_add,{
                output$varscanUI1<-renderUI({textInput('varscan_folder',
                                                       'Variant calling results',
                                                       "/home/varscan/")})
                output$varscanUI2<-renderUI({radioButtons('varscan_file_type',
                                                          "Output file type",
                                                          c(".vcf",".txt"),
                                                          ".txt",inline=TRUE)})
                output$varscanUI3<-renderUI({
                    conditionalPanel(
                        condition="input.varscan_file_type=='.txt'",
                        numericInput('varscan_chr',
                                     "In which column do you find Chr?",
                                     min = 1,max=20,value=1),
                        numericInput('varscan_pos',
                                     "In which column do you find Pos?",
                                     min = 1,max=20,value=2),
                        numericInput('varscan_ref',
                                     "In which column do you find Ref?",
                                     min = 1,max=20,value=3),
                        numericInput('varscan_alt',
                                     "In which column do you find Alt?",
                                     min = 1,max=20,value=4))})
                output$varscanUI4<-renderUI({textInput('varscan_file_names_add',
                                                       'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                output$varscanUI5<-renderUI({radioButtons('varscan_mnvs',
                                                          'MNVs reported?',
                                                          c("Yes","No"),"No",
                                                          inline = TRUE)})
                output$varscanUI6<-renderUI({radioButtons('varscan_snv_indel',
                                                          'SNVs and Indels reported in one file?',
                                                          c("Yes","No"),"No",
                                                          inline = TRUE)})
                output$varscanUI7<-renderUI({conditionalPanel(
                    condition="input.varscan_snv_indel=='No'",
                    textInput('varscan_snv_names_add',
                              'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                              "_snvs"),
                    textInput('varscan_indel_names_add',
                              'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                              "_indels"))})
                output$varscanUI8<-renderUI({radioButtons('varscan_indels',
                                                          'How are Indels reported?',
                                                          c("CA>C","C>-A",
                                                            "CAAAC>CAAC"),
                                                          selected="C>-A",
                                                          inline = TRUE)})
            })

            observeEvent(input$varscan_remove,{
                output$varscanUI1<-renderUI({NULL})
                output$varscanUI2<-renderUI({NULL})
                output$varscanUI3<-renderUI({NULL})
                output$varscanUI4<-renderUI({NULL})
                output$varscanUI5<-renderUI({NULL})
                output$varscanUI6<-renderUI({NULL})
                output$varscanUI7<-renderUI({NULL})
                output$varscanUI8<-renderUI({NULL})
            })

            observeEvent(input$freebayes_add,{
                output$freebayesUI1<-renderUI({textInput('freebayes_folder',
                                                         'Variant calling results',
                                                         "/home/freebayes/")})
                output$freebayesUI2<-renderUI({radioButtons('freebayes_file_type',
                                                            "Output file type",
                                                            c(".vcf",".txt"),
                                                            ".vcf",inline=TRUE)})
                output$freebayesUI3<-renderUI({
                    conditionalPanel(
                        condition="input.freebayes_file_type=='.txt'",
                        numericInput('freebayes_chr',
                                     "In which column do you find Chr?",
                                     min = 1,max=20,value=1),
                        numericInput('freebayes_pos',
                                     "In which column do you find Pos?",
                                     min = 1,max=20,value=2),
                        numericInput('freebayes_ref',
                                     "In which column do you find Ref?",
                                     min = 1,max=20,value=3),
                        numericInput('freebayes_alt',
                                     "In which column do you find Alt?",
                                     min = 1,max=20,value=4))})
                output$freebayesUI4<-renderUI({textInput('freebayes_file_names_add',
                                                         'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                output$freebayesUI5<-renderUI({radioButtons('freebayes_mnvs',
                                                            'MNVs reported?',
                                                            c("Yes","No"),"Yes",
                                                            inline = TRUE)})
                output$freebayesUI6<-renderUI({radioButtons('freebayes_snv_indel',
                                                            'SNVs and Indels reported in one file?',
                                                            c("Yes","No"),"Yes",
                                                            inline = TRUE)})
                output$freebayesUI7<-renderUI({conditionalPanel(
                    condition="input.freebayes_snv_indel=='No'",
                    textInput('freebayes_snv_names_add',
                              'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',""),
                    textInput('freebayes_indel_names_add',
                              'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',""))})
                output$freebayesUI8<-renderUI({radioButtons('freebayes_indels',
                                                            'How are Indels reported?',
                                                            c("CA>C","C>-A",
                                                              "CAAAC>CAAC"),
                                                            selected="CAAAC>CAAC",
                                                            inline = TRUE)})
            })

            observeEvent(input$freebayes_remove,{
                output$freebayesUI1<-renderUI({NULL})
                output$freebayesUI2<-renderUI({NULL})
                output$freebayesUI3<-renderUI({NULL})
                output$freebayesUI4<-renderUI({NULL})
                output$freebayesUI5<-renderUI({NULL})
                output$freebayesUI6<-renderUI({NULL})
                output$freebayesUI7<-renderUI({NULL})
                output$freebayesUI8<-renderUI({NULL})
            })

            observeEvent(input$lofreq_add,{
                output$lofreqUI1<-renderUI({textInput('lofreq_folder',
                                                      'Variant calling results',
                                                      "/home/lofreq/")})
                output$lofreqUI2<-renderUI({radioButtons('lofreq_file_type',
                                                         "Output file type",
                                                         c(".vcf",".txt"),
                                                         ".vcf",inline=TRUE)})
                output$lofreqUI3<-renderUI({
                    conditionalPanel(
                        condition="input.lofreq_file_type=='.txt'",
                        numericInput('lofreq_chr',
                                     "In which column do you find Chr?",
                                     min = 1,max=20,value=1),
                        numericInput('lofreq_pos',
                                     "In which column do you find Pos?",
                                     min = 1,max=20,value=2),
                        numericInput('lofreq_ref',
                                     "In which column do you find Ref?",
                                     min = 1,max=20,value=3),
                        numericInput('lofreq_alt',
                                     "In which column do you find Alt?",
                                     min = 1,max=20,value=4))})
                output$lofreqUI4<-renderUI({textInput('lofreq_file_names_add',
                                                      'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                output$lofreqUI5<-renderUI({radioButtons('lofreq_mnvs',
                                                         'MNVs reported?',
                                                         c("Yes","No"),"No",
                                                         inline = TRUE)})
                output$lofreqUI6<-renderUI({radioButtons('lofreq_snv_indel',
                                                         'SNVs and Indels reported in one file?',
                                                         c("Yes","No"),"Yes",
                                                         inline = TRUE)})
                output$lofreqUI7<-renderUI({conditionalPanel(
                    condition="input.lofreq_snv_indel=='No'",
                    textInput('lofreq_snv_names_add',
                              'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                              ""),
                    textInput('lofreq_indel_names_add',
                              'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                              ""))})
                output$lofreqUI8<-renderUI({radioButtons('lofreq_indels',
                                                         'How are Indels reported?',
                                                         c("CA>C","C>-A","CAAAC>CAAC"),
                                                         selected="CA>C",
                                                         inline = TRUE)})
            })

            observeEvent(input$lofreq_remove,{
                output$lofreqUI1<-renderUI({NULL})
                output$lofreqUI2<-renderUI({NULL})
                output$lofreqUI3<-renderUI({NULL})
                output$lofreqUI4<-renderUI({NULL})
                output$lofreqUI5<-renderUI({NULL})
                output$lofreqUI6<-renderUI({NULL})
                output$lofreqUI7<-renderUI({NULL})
                output$lofreqUI8<-renderUI({NULL})
            })

            observeEvent(input$snver_add,{
                output$snverUI1<-renderUI({textInput('snver_folder',
                                                     'Variant calling results',
                                                     "/home/snver/")})
                output$snverUI2<-renderUI({radioButtons('snver_file_type',
                                                        "Output file type",
                                                        c(".vcf",".txt"),".vcf",
                                                        inline=TRUE)})
                output$snverUI3<-renderUI({
                    conditionalPanel(
                        condition="input.snver_file_type=='.txt'",
                        numericInput('snver_chr',
                                     "In which column do you find Chr?",
                                     min = 1,max=20,value=1),
                        numericInput('snver_pos',
                                     "In which column do you find Pos?",
                                     min = 1,max=20,value=2),
                        numericInput('snver_ref',
                                     "In which column do you find Ref?",
                                     min = 1,max=20,value=3),
                        numericInput('snver_alt',
                                     "In which column do you find Alt?",
                                     min = 1,max=20,value=4))})
                output$snverUI4<-renderUI({textInput('snver_file_names_add',
                                                     'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                output$snverUI5<-renderUI({radioButtons('snver_mnvs',
                                                        'MNVs reported?',
                                                        c("Yes","No"),"No",
                                                        inline = TRUE)})
                output$snverUI6<-renderUI({radioButtons('snver_snv_indel',
                                                        'SNVs and Indels reported in one file?',
                                                        c("Yes","No"),"No",
                                                        inline = TRUE)})
                output$snverUI7<-renderUI({conditionalPanel(
                    condition="input.snver_snv_indel=='No'",
                    textInput('snver_snv_names_add',
                              'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                              ".snv.filter"),
                    textInput('snver_indel_names_add',
                              'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                              ".indel.filter"))})
                output$snverUI8<-renderUI({radioButtons('snver_indels',
                                                        'How are Indels reported?',
                                                        c("CA>C","C>-A",
                                                          "CAAAC>CAAC"),
                                                        selected="CA>C",
                                                        inline = TRUE)})
            })

            observeEvent(input$snver_remove,{
                output$snverUI1<-renderUI({NULL})
                output$snverUI2<-renderUI({NULL})
                output$snverUI3<-renderUI({NULL})
                output$snverUI4<-renderUI({NULL})
                output$snverUI5<-renderUI({NULL})
                output$snverUI6<-renderUI({NULL})
                output$snverUI7<-renderUI({NULL})
                output$snverUI8<-renderUI({NULL})
            })

            observeEvent(input$samtools_add,{
                output$samtoolsUI1<-renderUI({textInput('samtools_folder',
                                                        'Variant calling results',
                                                        "/home/samtools/")})
                output$samtoolsUI2<-renderUI({radioButtons('samtools_file_type',
                                                           "Output file type",
                                                           c(".vcf",".txt"),
                                                           ".vcf",
                                                           inline=TRUE)})
                output$samtoolsUI3<-renderUI({
                    conditionalPanel(
                        condition="input.samtools_file_type=='.txt'",
                        numericInput('samtools_chr',
                                     "In which column do you find Chr?",
                                     min = 1,max=20,value=1),
                        numericInput('samtools_pos',
                                     "In which column do you find Pos?",
                                     min = 1,max=20,value=2),
                        numericInput('samtools_ref',
                                     "In which column do you find Ref?",
                                     min = 1,max=20,value=3),
                        numericInput('samtools_alt',
                                     "In which column do you find Alt?",
                                     min = 1,max=20,value=4))})
                output$samtoolsUI4<-renderUI({textInput('samtools_file_names_add',
                                                        'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                output$samtoolsUI5<-renderUI({radioButtons('samtools_mnvs',
                                                           'MNVs reported?',
                                                           c("Yes","No"),"No",
                                                           inline = TRUE)})
                output$samtoolsUI6<-renderUI({radioButtons('samtools_snv_indel',
                                                           'SNVs and Indels reported in one file?',
                                                           c("Yes","No"),"Yes",
                                                           inline = TRUE)})
                output$samtoolsUI7<-renderUI({conditionalPanel(
                    condition="input.samtools_snv_indel=='No'",
                    textInput('samtools_snv_names_add',
                              'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                              ""),
                    textInput('samtools_indel_names_add',
                              'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                              ""))})
                output$samtoolsUI8<-renderUI({radioButtons('samtools_indels',
                                                           'How are Indels reported?',
                                                           c("CA>C","C>-A","CAAAC>CAAC"),
                                                           selected="CAAAC>CAAC",
                                                           inline = TRUE)})
            })

            observeEvent(input$samtools_remove,{
                output$samtoolsUI1<-renderUI({NULL})
                output$samtoolsUI2<-renderUI({NULL})
                output$samtoolsUI3<-renderUI({NULL})
                output$samtoolsUI4<-renderUI({NULL})
                output$samtoolsUI5<-renderUI({NULL})
                output$samtoolsUI6<-renderUI({NULL})
                output$samtoolsUI7<-renderUI({NULL})
                output$samtoolsUI8<-renderUI({NULL})
            })

            observeEvent(input$vardict_add,{
                output$vardictUI1<-renderUI({textInput('vardict_folder',
                                                       'Variant calling results',
                                                       "/home/vardict/")})
                output$vardictUI2<-renderUI({radioButtons('vardict_file_type',
                                                          "Output file type",
                                                          c(".vcf",".txt"),
                                                          ".txt",inline=TRUE)})
                output$vardictUI3<-renderUI({
                    conditionalPanel(
                        condition="input.vardict_file_type=='.txt'",
                        numericInput('vardict_chr',
                                     "In which column do you find Chr?",
                                     min = 1,max=20,value=3),
                        numericInput('vardict_pos',
                                     "In which column do you find Pos?",
                                     min = 1,max=20,value=4),
                        numericInput('vardict_ref',
                                     "In which column do you find Ref?",
                                     min = 1,max=20,value=6),
                        numericInput('vardict_alt',
                                     "In which column do you find Alt?",
                                     min = 1,max=20,value=7))})
                output$vardictUI4<-renderUI({textInput('vardict_file_names_add',
                                                       'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                output$vardictUI5<-renderUI({radioButtons('vardict_mnvs',
                                                          'MNVs reported?',
                                                          c("Yes","No"),"Yes",
                                                          inline = TRUE)})
                output$vardictUI6<-renderUI({radioButtons('vardict_snv_indel',
                                                          'SNVs and Indels reported in one file?',
                                                          c("Yes","No"),"Yes",
                                                          inline = TRUE)})
                output$vardictUI7<-renderUI({conditionalPanel(
                    condition="input.vardict_snv_indel=='No'",
                    textInput('vardict_snv_names_add',
                              'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                              ""),
                    textInput('vardict_indel_names_add',
                              'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                              ""))})
                output$vardictUI8<-renderUI({radioButtons('vardict_indels',
                                                          'How are Indels reported?',
                                                          c("CA>C","C>-A",
                                                            "CAAAC>CAAC"),
                                                          selected="CA>C",
                                                          inline = TRUE)})
            })

            observeEvent(input$vardict_remove,{
                output$vardictUI1<-renderUI({NULL})
                output$vardictUI2<-renderUI({NULL})
                output$vardictUI3<-renderUI({NULL})
                output$vardictUI4<-renderUI({NULL})
                output$vardictUI5<-renderUI({NULL})
                output$vardictUI6<-renderUI({NULL})
                output$vardictUI7<-renderUI({NULL})
                output$vardictUI8<-renderUI({NULL})
            })

            observeEvent(input$nr_additional_action,{
                output$caller1UI0<-renderUI({NULL})
                output$caller1UI0.1<-renderUI({NULL})
                output$caller1UI1<-renderUI({NULL})
                output$caller1UI2<-renderUI({NULL})
                output$caller1UI3<-renderUI({NULL})
                output$caller1UI4<-renderUI({NULL})
                output$caller1UI5<-renderUI({NULL})
                output$caller1UI6<-renderUI({NULL})
                output$caller1UI7<-renderUI({NULL})
                output$caller1UI8<-renderUI({NULL})

                output$caller2UI0<-renderUI({NULL})
                output$caller2UI0.1<-renderUI({NULL})
                output$caller2UI1<-renderUI({NULL})
                output$caller2UI2<-renderUI({NULL})
                output$caller2UI3<-renderUI({NULL})
                output$caller2UI4<-renderUI({NULL})
                output$caller2UI5<-renderUI({NULL})
                output$caller2UI6<-renderUI({NULL})
                output$caller2UI7<-renderUI({NULL})
                output$caller2UI8<-renderUI({NULL})

                output$caller3UI0<-renderUI({NULL})
                output$caller3UI0.1<-renderUI({NULL})
                output$caller3UI1<-renderUI({NULL})
                output$caller3UI2<-renderUI({NULL})
                output$caller3UI3<-renderUI({NULL})
                output$caller3UI4<-renderUI({NULL})
                output$caller3UI5<-renderUI({NULL})
                output$caller3UI6<-renderUI({NULL})
                output$caller3UI7<-renderUI({NULL})
                output$caller3UI8<-renderUI({NULL})

                output$caller4UI0<-renderUI({NULL})
                output$caller4UI0.1<-renderUI({NULL})
                output$caller4UI1<-renderUI({NULL})
                output$caller4UI2<-renderUI({NULL})
                output$caller4UI3<-renderUI({NULL})
                output$caller4UI4<-renderUI({NULL})
                output$caller4UI5<-renderUI({NULL})
                output$caller4UI6<-renderUI({NULL})
                output$caller4UI7<-renderUI({NULL})
                output$caller4UI8<-renderUI({NULL})

                output$caller5UI0<-renderUI({NULL})
                output$caller5UI0.1<-renderUI({NULL})
                output$caller5UI1<-renderUI({NULL})
                output$caller5UI2<-renderUI({NULL})
                output$caller5UI3<-renderUI({NULL})
                output$caller5UI4<-renderUI({NULL})
                output$caller5UI5<-renderUI({NULL})
                output$caller5UI6<-renderUI({NULL})
                output$caller5UI7<-renderUI({NULL})
                output$caller5UI8<-renderUI({NULL})

                if(input$nr_additional>0){
                    output$caller1UI0<-renderUI({h4("Caller 1:")})
                    output$caller1UI0.1<-renderUI({textInput('caller1_name',
                                                             'Name of caller 1',
                                                             "Caller 1")})
                    output$caller1UI1<-renderUI({textInput('caller1_folder',
                                                           'Variant calling results',
                                                           "/home/")})
                    output$caller1UI2<-renderUI({radioButtons('caller1_file_type',
                                                              "Output file type",
                                                              c(".vcf",".txt"),
                                                              ".vcf",
                                                              inline=TRUE)})
                    output$caller1UI3<-renderUI({
                        conditionalPanel(
                            condition="input.caller1_file_type=='.txt'",
                            numericInput('caller1_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,value=1),
                            numericInput('caller1_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,value=2),
                            numericInput('caller1_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,value=3),
                            numericInput('caller1_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,value=4))})
                    output$caller1UI4<-renderUI({textInput('caller1_file_names_add',
                                                           'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                           "")})
                    output$caller1UI5<-renderUI({radioButtons('caller1_mnvs',
                                                              'MNVs reported?',
                                                              c("Yes","No"),
                                                              "No",
                                                              inline = TRUE)})
                    output$caller1UI6<-renderUI({radioButtons('caller1_snv_indel',
                                                              'SNVs and Indels reported in one file?',
                                                              c("Yes","No"),
                                                              "Yes",
                                                              inline = TRUE)})
                    output$caller1UI7<-renderUI({conditionalPanel(
                        condition="input.caller1_snv_indel=='No'",
                        textInput('caller1_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  ""),
                        textInput('caller1_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  ""))})
                    output$caller1UI8<-renderUI({radioButtons('caller1_indels',
                                                              'How are Indels reported?',
                                                              c("CA>C","C>-A",
                                                                "CAAAC>CAAC"),
                                                              selected="CA>C",
                                                              inline = TRUE)})

                    if(input$nr_additional>1){
                        output$caller2UI0<-renderUI({h4("Caller 2:")})
                        output$caller2UI0.1<-renderUI({textInput('caller2_name',
                                                                 'Name of caller 2',
                                                                 "Caller 2")})
                        output$caller2UI1<-renderUI({textInput('caller2_folder',
                                                               'Variant calling results',
                                                               "/home/")})
                        output$caller2UI2<-renderUI({radioButtons('caller2_file_type',
                                                                  "Output file type",
                                                                  c(".vcf",
                                                                    ".txt"),
                                                                  ".vcf",
                                                                  inline=TRUE)})
                        output$caller2UI3<-renderUI({
                            conditionalPanel(
                                condition="input.caller2_file_type=='.txt'",
                                numericInput('caller2_chr',
                                             "In which column do you find Chr?",
                                             min = 1,max=20,value=1),
                                numericInput('caller2_pos',
                                             "In which column do you find Pos?",
                                             min = 1,max=20,value=2),
                                numericInput('caller2_ref',
                                             "In which column do you find Ref?",
                                             min = 1,max=20,value=3),
                                numericInput('caller2_alt',
                                             "In which column do you find Alt?",
                                             min = 1,max=20,value=4))})
                        output$caller2UI4<-renderUI({textInput('caller2_file_names_add',
                                                               'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                        output$caller2UI5<-renderUI({radioButtons('caller2_mnvs',
                                                                  'MNVs reported?',
                                                                  c("Yes","No"),
                                                                  "No",
                                                                  inline=TRUE)})
                        output$caller2UI6<-renderUI({radioButtons('caller2_snv_indel',
                                                                  'SNVs and Indels reported in one file?',
                                                                  c("Yes","No"),
                                                                  "Yes",
                                                                  inline=TRUE)})
                        output$caller2UI7<-renderUI({conditionalPanel(
                            condition="input.caller2_snv_indel=='No'",
                            textInput('caller2_snv_names_add',
                                      'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                      ""),
                            textInput('caller2_indel_names_add',
                                      'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                      ""))})
                        output$caller2UI8<-renderUI({radioButtons('caller2_indels',
                                                                  'How are Indels reported?',
                                                                  c("CA>C",
                                                                    "C>-A",
                                                                    "CAAAC>CAAC"),
                                                                  selected="CA>C",
                                                                  inline=TRUE)})

                        if(input$nr_additional>2){
                            output$caller3UI0<-renderUI({h4("Caller 3:")})
                            output$caller3UI0.1<-renderUI({textInput('caller3_name',
                                                                     'Name of caller 3',
                                                                     "Caller 3")})
                            output$caller3UI1<-renderUI({textInput('caller3_folder',
                                                                   'Variant calling results',
                                                                   "/home/")})
                            output$caller3UI2<-renderUI({radioButtons('caller3_file_type',
                                                                      "Output file type",
                                                                      c(".vcf",
                                                                        ".txt"),
                                                                      ".vcf",
                                                                      inline=TRUE)})
                            output$caller3UI3<-renderUI({
                                conditionalPanel(
                                    condition="input.caller3_file_type=='.txt'",
                                    numericInput('caller3_chr',
                                                 "In which column do you find Chr?",
                                                 min = 1,max=20,value=1),
                                    numericInput('caller3_pos',
                                                 "In which column do you find Pos?",
                                                 min = 1,max=20,value=2),
                                    numericInput('caller3_ref',
                                                 "In which column do you find Ref?",
                                                 min = 1,max=20,value=3),
                                    numericInput('caller3_alt',
                                                 "In which column do you find Alt?",
                                                 min = 1,max=20,value=4))})
                            output$caller3UI4<-renderUI({textInput('caller3_file_names_add',
                                                                   'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                            output$caller3UI5<-renderUI({radioButtons('caller3_mnvs',
                                                                      'MNVs reported?',
                                                                      c("Yes","No"),
                                                                      "No",
                                                                      inline = TRUE)})
                            output$caller3UI6<-renderUI({radioButtons('caller3_snv_indel',
                                                                      'SNVs and Indels reported in one file?',
                                                                      c("Yes","No"),
                                                                      "Yes",
                                                                      inline = TRUE)})
                            output$caller3UI7<-renderUI({conditionalPanel(
                                condition="input.caller3_snv_indel=='No'",
                                textInput('caller3_snv_names_add',
                                          'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                          ""),
                                textInput('caller3_indel_names_add',
                                          'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                          ""))})
                            output$caller3UI8<-renderUI({radioButtons('caller3_indels',
                                                                      'How are Indels reported?',
                                                                      c("CA>C","C>-A","CAAAC>CAAC"),
                                                                      selected="CA>C",
                                                                      inline = TRUE)})

                            if(input$nr_additional>3){
                                output$caller4UI0<-renderUI({h4("Caller 4:")})
                                output$caller4UI0.1<-renderUI({textInput('caller4_name',
                                                                         'Name of caller 4',
                                                                         "Caller 4")})
                                output$caller4UI1<-renderUI({textInput('caller4_folder',
                                                                       'Variant calling results',
                                                                       "/home/")})
                                output$caller4UI2<-renderUI({radioButtons('caller4_file_type',
                                                                          "Output file type",
                                                                          c(".vcf",".txt"),
                                                                          ".vcf",
                                                                          inline=TRUE)})
                                output$caller4UI3<-renderUI({
                                    conditionalPanel(
                                        condition="input.caller4_file_type=='.txt'",
                                        numericInput('caller4_chr',
                                                     "In which column do you find Chr?",
                                                     min = 1,max=20,value=1),
                                        numericInput('caller4_pos',
                                                     "In which column do you find Pos?",
                                                     min = 1,max=20,value=2),
                                        numericInput('caller4_ref',
                                                     "In which column do you find Ref?",
                                                     min = 1,max=20,value=3),
                                        numericInput('caller4_alt',
                                                     "In which column do you find Alt?",
                                                     min = 1,max=20,value=4))})
                                output$caller4UI4<-renderUI({textInput('caller4_file_names_add',
                                                                       'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                                output$caller4UI5<-renderUI({radioButtons('caller4_mnvs',
                                                                          'MNVs reported?',
                                                                          c("Yes","No"),
                                                                          "No",
                                                                          inline=TRUE)})
                                output$caller4UI6<-renderUI({radioButtons('caller4_snv_indel',
                                                                          'SNVs and Indels reported in one file?',
                                                                          c("Yes","No"),
                                                                          "Yes",
                                                                          inline=TRUE)})
                                output$caller4UI7<-renderUI({conditionalPanel(
                                    condition="input.caller4_snv_indel=='No'",
                                    textInput('caller4_snv_names_add',
                                              'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',""),
                                    textInput('caller4_indel_names_add',
                                              'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',""))})
                                output$caller4UI8<-renderUI({radioButtons('caller4_indels',
                                                                          'How are Indels reported?',
                                                                          c("CA>C","C>-A","CAAAC>CAAC"),
                                                                          selected="CA>C",
                                                                          inline=TRUE)})

                                if(input$nr_additional>4){
                                    output$caller5UI0<-renderUI({h4("Caller 5:")})
                                    output$caller5UI0.1<-renderUI({textInput('caller5_name',
                                                                             'Name of caller 5',
                                                                             "Caller 5")})
                                    output$caller5UI1<-renderUI({textInput('caller5_folder',
                                                                           'Variant calling results',
                                                                           "/home/")})
                                    output$caller5UI2<-renderUI({radioButtons('caller5_file_type',
                                                                              "Output file type",
                                                                              c(".vcf",".txt"),
                                                                              ".vcf",
                                                                              inline=TRUE)})
                                    output$caller5UI3<-renderUI({
                                        conditionalPanel(
                                            condition="input.caller5_file_type=='.txt'",
                                            numericInput('caller5_chr',
                                                         "In which column do you find Chr?",
                                                         min = 1,max=20,
                                                         value=1),
                                            numericInput('caller5_pos',
                                                         "In which column do you find Pos?",
                                                         min = 1,max=20,
                                                         value=2),
                                            numericInput('caller5_ref',
                                                         "In which column do you find Ref?",
                                                         min = 1,max=20,
                                                         value=3),
                                            numericInput('caller5_alt',
                                                         "In which column do you find Alt?",
                                                         min = 1,max=20,
                                                         value=4))})
                                    output$caller5UI4<-renderUI({textInput('caller5_file_names_add',
                                                                           'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',"")})
                                    output$caller5UI5<-renderUI({radioButtons('caller5_mnvs',
                                                                              'MNVs reported?',
                                                                              c("Yes","No"),
                                                                              "No",
                                                                              inline=TRUE)})
                                    output$caller5UI6<-renderUI({radioButtons('caller5_snv_indel',
                                                                              'SNVs and Indels reported in one file?',
                                                                              c("Yes","No"),
                                                                              "Yes",
                                                                              inline=TRUE)})
                                    output$caller5UI7<-renderUI({conditionalPanel(
                                        condition="input.caller5_snv_indel=='No'",
                                        textInput('caller5_snv_names_add',
                                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                                  ""),
                                        textInput('caller5_indel_names_add',
                                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                                  ""))})
                                    output$caller5UI8<-renderUI({radioButtons('caller5_indels',
                                                                              'How are Indels reported?',
                                                                              c("CA>C","C>-A","CAAAC>CAAC"),
                                                                              selected="CA>C",
                                                                              inline=TRUE)})
                                }
                            }
                        }
                    }
                }
            })

            observeEvent(input$checkpointCheck,{
                output$messageUI1<-renderUI({NULL})
                output$messageUI2<-renderUI({NULL})
                if(file.exists(paste(input$output_folder,
                                     "/checkpoint.txt",sep=""))){
                    checkpointFile<-read.table(paste(input$output_folder,
                                                     "/checkpoint.txt",sep=""),
                                               header=TRUE,sep="\t",
                                               stringsAsFactors = FALSE)
                    minimumProgress<-min(checkpointFile[,2:length(checkpointFile[1,])],
                                         na.rm = TRUE)
                    if(minimumProgress==1){
                        output$checkpointUI1<-renderUI({selectInput('checkpoint',
                                                                    "",
                                                                    choices=c("1: After target filtration"=1))})
                    }
                    if(minimumProgress==2){
                        output$checkpointUI1<-renderUI({selectInput('checkpoint',
                                                                    "",
                                                                    choices=c("1: After target filtration"=1,
                                                                              "2: After normalization"=2))})
                    }
                    if(minimumProgress==3){
                        output$checkpointUI1<-renderUI({selectInput('checkpoint',
                                                                    "",
                                                                    choices=c("1: After target filtration"=1,
                                                                              "2: After normalization"=2,
                                                                              "3: After annotation"=3))})
                    }
                    if(minimumProgress==4){
                        output$checkpointUI1<-renderUI({selectInput('checkpoint',
                                                                    "",
                                                                    choices=c("1: After target filtration"=1,
                                                                              "2: After normalization"=2,
                                                                              "3: After annotation"=3,
                                                                              "4: After combination"=4))})

                    }
                    if(minimumProgress==5){
                        output$checkpointUI1<-renderUI({selectInput('checkpoint',
                                                                    "",
                                                                    choices=c("1: After target filtration"=1,
                                                                              "2: After normalization"=2,
                                                                              "3: After annotation"=3,
                                                                              "4: After combination"=4,
                                                                              "5: After coverage and BQ filtration"=5))})

                    }
                    if(minimumProgress==6){
                        output$checkpointUI1<-renderUI({selectInput('checkpoint',
                                                                    "",
                                                                    choices=c("1: After target filtration"=1,
                                                                              "2: After normalization"=2,
                                                                              "3: After annotation"=3,
                                                                              "4: After combination"=4,
                                                                              "5: After coverage and BQ filtration"=5,
                                                                              "6: After extended set of characteristics"=6))})
                    }
                    if(minimumProgress==7){
                        output$checkpointUI1<-renderUI({selectInput('checkpoint',
                                                                    "",
                                                                    choices=c("1: After target filtration"=1,
                                                                              "2: After normalization"=2,
                                                                              "3: After annotation"=3,
                                                                              "4: After combination"=4,
                                                                              "5: After coverage and BQ filtration"=5,
                                                                              "6: After extended set of characteristics"=6,
                                                                              "7: After final filtration"=7))})
                    }
                    output$checkpointUI2<-renderUI({actionButton("appreci8Rcheckpoint",
                                                                 'Start analysis from selected checkpoint')})
                }
                if(!file.exists(paste(input$output_folder,"/checkpoint.txt",
                                      sep=""))){
                    output$checkpointUI1<-renderUI({selectInput('checkpoint',"",
                                                                choices=c("Sorry, no checkpoint available"=0),
                                                                "Sorry, no checkpoint available")})
                    output$checkpointUI2<-renderUI({NULL})
                }
            })

            #0. Preparation
            output$output_folderUI<-renderUI({textInput('output_folder',
                                                        'Define output folder',
                                                        "/home/documents")})

            #3. Annotate
            output$locationsUI<-renderUI({checkboxGroupInput("locations",
                                                             "What are the locations you are interested in?",
                                                             c("coding",
                                                               "intron",
                                                               "threeUTR",
                                                               "fiveUTR",
                                                               "intergenic",
                                                               "spliceSite",
                                                               "promoter"),
                                                             c("coding"),
                                                             inline=TRUE)})

            output$consequencesUI<-renderUI({checkboxGroupInput("consequences",
                                                                "What kind of variants are you interested in? (coding only)",
                                                                c("synonymous",
                                                                  "nonsynonymous",
                                                                  "frameshift",
                                                                  "nonsense",
                                                                  "not translated"),
                                                                c("nonsynonymous",
                                                                  "frameshift",
                                                                  "nonsense"),
                                                                inline=TRUE)})

            #5. Coverage and BQ
            output$bam_folderUI<-renderUI({textInput('bam_folder',
                                                     'Define folder containing bam- and bai files',"/home/alignment/")})
            output$dpUI<-renderUI({numericInput("dp",
                                                "Minimum coverage [10;9999]",
                                                value=50,min=10,max=9999)})
            output$nr_altUI<-renderUI({numericInput("nr_alt",
                                                    "Minimum number of reads carrying the alternate allele [3;9999]",
                                                    value=20,min=3,max=9999)})
            output$vafUI<-renderUI({sliderInput("vaf",
                                                "Minimum allele frequency [%]",
                                                min=1,max=100,value=1)})
            output$bqUI<-renderUI({numericInput("bq",
                                                "Minimum base quality [0;40]",
                                                value=15,min=0,max=40)})
            output$bq_diffUI<-renderUI({numericInput("bq_diff",
                                                     "Maximum difference between Ref_BQ and Alt_BQ [0;40]",
                                                     value=7,min=0,max=40)})

            #6. Characteristics
            output$dbSNPUI<-renderUI({checkboxInput("dbSNP",
                                                    "Consider dbSNP? (Hsapiens.dbSNP144.GRCh37 and XtraSNPlocs.Hsapiens.dbSNP144.GRCh37)",
                                                    value=TRUE)})
            output$"1kgenomesUI"<-renderUI({checkboxInput("1kgenomes",
                                                          "Consider 1000 Genomes? (MafDb.1Kgenomes.phase3.hs37d5)",
                                                          value=TRUE)})
            output$exacUI<-renderUI({checkboxInput("exac",
                                                   "Consider ExAC? (MafDb.ExAC.r1.0.hs37d5)",
                                                   value=TRUE)})
            output$espUI<-renderUI({checkboxInput("esp",
                                                  "Consider ESP6500? (MafDb.ESP6500SI.V2.SSA137.hs37d5)",
                                                  value=TRUE)})
            output$gadUI<-renderUI({checkboxInput("gad",
                                                  "Consider Genome Aggregation Database? (MafDb.gnomADex.r2.1.hs37d5)",
                                                  value=TRUE)})
            output$cosmicUI<-renderUI({checkboxInput("cosmic",
                                                     "Consider COSMIC? (COSMIC.67)",
                                                     value=TRUE)})
            output$clinvarUI<-renderUI({checkboxInput("clinvar",
                                                      "Consider ClinVar? (rentrez)",
                                                      value=TRUE)})
            output$predictUI<-renderUI({radioButtons("predict",
                                                     "What source would you like to use for impact prediction?",
                                                     c("SIFT","Provean",
                                                       "PolyPhen2"),
                                                     "Provean",inline=TRUE)})

            #7. Filtration
            output$stricter_thresholdsUI<-renderUI({radioButtons('stricter_thresholds',
                                                                 "Do you want to define stricter thresholds for coverage and base quality?",
                                                                 c("Yes","No"),
                                                                 "No",
                                                                 inline=TRUE)})
            output$stricter_thresholdsUI2<-renderUI({conditionalPanel(
                condition="input.stricter_thresholds=='Yes'",
                numericInput("dp2","Minimum coverage [10;9999]",
                             value=50,min=10,max=9999),
                numericInput("nr_alt2",
                             "Minimum number of reads carrying the alternate allele [3;9999]",
                             value=20,min=3,max=9999),
                sliderInput("vaf2","Minimum allele frequency [%]",
                            min=1,max=100,value=1),
                numericInput("bq2","Minimum base quality [0;36]",
                             value=15,min=0,max=36),
                numericInput("bq_diff2",
                             "Maximum difference between Ref_BQ and Alt_BQ [0;36]",
                             value=7,min=0,max=36)
            )})
            output$nr_samplesUI<-renderUI({numericInput("nr_samples",
                                                        "Detection in more than how many samples makes a call striking?",
                                                        value=3,min=1,
                                                        max=9999)})

            output$predictionUI1<-renderUI({conditionalPanel(
                condition="input.predict=='SIFT'",
                sliderInput("damaging_safe1",
                            "SIFT: When is a damaging prediction reliable? (internal threshold <=0.05)",
                            min=0,max=1.0,value=0.05),
                sliderInput("tolerated_safe1",
                            "SIFT: When is a tolerated prediction reliable? (internal threshold >0.05)",
                            min=0,max=1.0,value=0.05)
            )})

            output$predictionUI2<-renderUI({conditionalPanel(
                condition="input.predict=='Provean'",
                sliderInput("damaging_safe2",
                            "Provean: When is a damaging prediction reliable? (internal threshold <=-2.5)",
                            min=-20,max=10,value=-3),
                sliderInput("tolerated_safe2",
                            "Provean: When is a tolerated prediction reliable? (internal threshold >-2.5)",
                            min=-20,max=10,value=-1.5)
            )})

            output$predictionUI3<-renderUI({conditionalPanel(
                condition="input.predict=='PolyPhen2'",
                sliderInput("damaging_safe3",
                            "PolyPhen2: When is a damaging prediction reliable? (>=0.5)",
                            min=0,max=1,value=0.5),
                sliderInput("tolerated_safe3",
                            "PolyPhen2: When is a tolerated prediction reliable? (<0.5)",
                            min=0,max=1,value=0.5)
            )})
            output$artifact_scoreUI<-renderUI({radioButtons('artifact_score',
                                                            "Would you like to change the default scoring for the artifact score?",
                                                            c("Yes","No"),"No",
                                                            inline=TRUE)})
            output$artifact_scoreUI2<-renderUI({conditionalPanel(
                condition="input.artifact_score=='Yes'",
                h4("Important note:"),
                h5("High score -> artifact"),
                h5("Low score -> probably true"),
                sliderInput("PolymorphismVAF10",
                            "Polymorphism (based on polymorphism score) AND VAF<10%",
                            min=-5,max=5,value=5),
                sliderInput("BQ_AltMean","BQ_Alt<(mean(BQ_Alt)-3*sd(BQ_Alt))",
                            min=-5,max=5,value=4),
                sliderInput("detectedHigh","Detected in >50% of all samples",
                            min=-5,max=5,value=2),
                sliderInput("detectedLow",
                            "Detected in a striking number of samples",
                            min=-5,max=5,value=2),
                sliderInput("detectedLowVAF",
                            "Detected in a striking number of samples AND VAF>85%",
                            min=-5,max=5,value=2),
                sliderInput("vafLow","VAF<2%",min=-5,max=5,value=2),
                sliderInput("PolymorphismVAF20",
                            "Polymorphism (based on polymorphism score) AND VAF<20%",
                            min=-5,max=5,value=2),
                sliderInput("PolymorphismFrame",
                            "Polymorphism (based on polymorphism score) AND frameshift",
                            min=-5,max=5,value=2),
                sliderInput("isIndel","Indel",min=-5,max=5,value=1),
                sliderInput("isIndelVAF","Indel AND VAF<5%",
                            min=-5,max=5,value=1),
                sliderInput("noPrimerP","No primer (information) AND p<0.001",
                            min=-5,max=5,value=1),
                sliderInput("noPrimerPFwd",
                            "No primer (information) AND p>=0.001 AND Nr_Ref_fwd>=(Min_DP-Min_Alt)/2 AND Nr_Alt_fwd<=2",
                            min=-5,max=5,value=1),
                sliderInput("noPrimerPRev",
                            "No primer (information) AND p>=0.001 AND Nr_Ref_rev>=(Min_DP-Min_Alt)/2 AND Nr_Alt_rev<=2",
                            min=-5,max=5,value=1),
                sliderInput("databaseVAF","No database AND VAF<10%",
                            min=-5,max=5,value=1),
                sliderInput("databaseHigh",
                            "No database AND detected in >50% of all samples",
                            min=-5,max=5,value=1),
                sliderInput("predictionVAF",
                            "Reliable tolerated prediction AND (VAF<35% OR 65%<VAF<85%)",
                            min=-5,max=5,value=1),
                sliderInput("oneCaller","Reported by only 1 caller",
                            min=-5,max=5,value=1),
                sliderInput("primerLocation","Primer-location",
                            min=-5,max=5,value=-1),
                sliderInput("primerPAlt",
                            "No primer (information) AND p<0.001 AND Nr_Alt_fwd>=Min_Alt/2 AND Nr_Alt_rev>=Min_Alt/2",
                            min=-5,max=5,value=-1),
                sliderInput("primerPFwd",
                            "No primer (information) AND p<0.001 AND Nr_Ref_fwd<(Min_DP-Min_Alt)/2 AND Nr_Alt_fwd<=2",
                            min=-5,max=5,value=-1),
                sliderInput("primerPRev",
                            "No primer (information) AND p<0.001 AND Nr_Ref_rev<(Min_DP-Min_Alt)/2 AND Nr_Alt_rev<=2",
                            min=-5,max=5,value=-1),
                sliderInput("predictionSafe","Reliable damaging prediction",
                            min=-5,max=5,value=-1),
                numericInput("nrcaller4",
                             "Intermediate number of callers to report the same variant [1;14]",
                             min=1,max=14,value=4),
                sliderInput("reward4","Score",min=-5,max=5,value=-1),
                numericInput("nrcaller5",
                             "High number of callers to report the same variant [1;14]",
                             min=1,max=14,value=5),
                sliderInput("reward5","Score",min=-5,max=5,value=-1),
                numericInput("nrcaller6",
                             "Very high number of callers to report the same variant [1;14]",
                             min=1,max=14,value=6),
                sliderInput("reward6","Score",min=-5,max=5,value=-1),
                sliderInput("knownHotspot","Known hotspot",
                            min=-5,max=5,value=-3),
                checkboxGroupInput("overlapTools",
                                   "Overlapping output by which tools shall be rewarded?",
                                   choices=c("GATK","Platypus","VarScan",
                                             "LoFreq","FreeBayes","SNVer",
                                             "SamTools","VarDict","Caller1",
                                             "Caller2","Caller3","Caller4",
                                             "Caller5"),
                                   selected=c("LoFreq","FreeBayes","VarDict"),
                                   inline=TRUE),
                sliderInput("overlapReward","Score",min=-5,max=5,value=-3),
                hr(),
                sliderInput("artifactThreshold",
                            "Threshold artifact score (still artifact)",
                            min=-10,max=10,value=0)
            )})
            output$polymorphism_scoreUI<-renderUI({radioButtons('polymorphism_score',
                                                                "Would you like to change the default scoring for the polymorphism score?",
                                                                c("Yes","No"),
                                                                "No",
                                                                inline=TRUE)})
            output$polymorphism_scoreUI2<-renderUI({conditionalPanel(
                condition="input.polymorphism_score=='Yes'",
                h4("Important note:"),
                h5("High score -> polymorphism"),
                h5("Low score -> no polymorphism"),
                sliderInput("polyDetected",
                            "Detected in a striking number of samples",
                            min=-5,max=5,value=1),
                numericInput("polyDatabases",
                             "High number of databases to have information on a variant [1;8]",
                             min=1,max=8,value=6),
                sliderInput("polyDatabasesReward","Score",min=-5,max=5,value=1),
                numericInput("polyDatabasesPolyLow",
                             "Intermediate number of polymorphism databases to have information on a variant [1;8]",
                             min=1,max=8,value=2),
                sliderInput("polyDatabasesPolyLowReward","Score",
                            min=-5,max=5,value=1),
                numericInput("polyDatabasesPolyHigh",
                             "High number of polymorphism databases to have information on a variant [1;8]",
                             min=1,max=8,value=4),
                sliderInput("polyDatabasesPolyHighReward","Score",
                            min=-5,max=5,value=1),
                sliderInput("polyVAF","35%<=VAF>=65% OR 85%<=VAF",
                            min=-5,max=5,value=1),
                sliderInput("polyPrediction","Reliable tolerated prediction",
                            min=-5,max=5,value=1),
                sliderInput("polyEffect",
                            "No frameshift AND no stop gained AND no stop lost",
                            min=-5,max=5,value=1),
                sliderInput("polyDetectedOnce","Reported in only 1 sample",
                            min=-5,max=5,value=-1),
                numericInput("polyDatabasesMut",
                             "Critical number of mutation databases to have information on a variant [1;8]",
                             min=1,max=8,value=2),
                sliderInput("polyDatabasesMutReward","Score",
                            min=-5,max=5,value=-1),
                sliderInput("polyNoDatabase",
                            "Not detected in any polymorphism database",
                            min=-5,max=5,value=-1),
                sliderInput("polyPredictionEffect",
                            "Reliable damaging prediction OR stop gained OR stop lost",
                            min=-5,max=5,value=-1),
                numericInput("polyCosmic",
                             "Critical number of Cosmic entries [1;1000]",
                             min=1,max=1000,value=100),
                hr(),
                sliderInput("polyThresholdCritical",
                            "Threshold polymorphism score if number of Cosmic entries is not critical (still polymorphism)",
                            min=-10,max=10,value=2),
                sliderInput("polyThreshold",
                            "Threshold polymorphism score if number of Cosmic entries is critical (still polymorphism)",
                            min=-10,max=10,value=3)
            )})

            observeEvent(input$exportConfig,{
                output$exportconfigUI0<-renderUI({h4('Important note:')})
                output$exportconfigUI0.1<-renderUI({h5('Information on uploaded files (target region, primer positions or hotspot list) cannot be exported/imported.')})
                output$exportconfigUI1<-renderUI({textInput('configFileOut',
                                                            'Define file name for your configuration file (will be safed as *.txt file in your output folder)',
                                                            "Config1")})
                output$exportconfigUI2<-renderUI({actionButton("safeConfig",
                                                               'Safe configuration')})
                output$messageUI1<-renderUI({NULL})
                output$messageUI2<-renderUI({NULL})
                output$importconfigUI0<-renderUI({NULL})
                output$importconfigUI0.1<-renderUI({NULL})
                output$importconfigUI1<-renderUI({NULL})
                output$importconfigUI2<-renderUI({NULL})
            })

            observeEvent(input$importConfig,{
                output$importconfigUI0<-renderUI({h4('Important note:')})
                output$importconfigUI0.1<-renderUI({h5('Information on uploaded files (target region, primer positions or hotspot list) cannot be exported/imported.')})
                output$importconfigUI1<-renderUI({fileInput('configFileIn',
                                                            'Upload your configuration file')})
                output$importconfigUI2<-renderUI({actionButton("applyConfig",
                                                               'Apply configuration')})
                output$messageUI2<-renderUI({NULL})
                output$messageUI1<-renderUI({NULL})
                output$exportconfigUI0<-renderUI({NULL})
                output$exportconfigUI0.1<-renderUI({NULL})
                output$exportconfigUI1<-renderUI({NULL})
                output$exportconfigUI2<-renderUI({NULL})
            })

            observeEvent(input$safeConfig,{
                #check if output-folder really exists
                if(file.exists(input$output_folder)==FALSE){
                    log_info<-c("Your output folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(file.exists(input$output_folder)==TRUE){
                    log_info<-paste("Saving your current setting as ",
                                    input$configFileOut,".txt<br><br>",sep="")
                    output$log_info<-renderUI({HTML(log_info)})
                    config<-data.frame(Variable=NA,Value=NA)
                    #GATK
                    config[1,1]<-"gatk_folder"
                    config[1,2]<-ifelse(!is.null(input$gatk_folder),
                                        input$gatk_folder,NA)
                    config[2,1]<-"gatk_file_type"
                    config[2,2]<-ifelse(!is.null(input$gatk_file_type),
                                        input$gatk_file_type,NA)
                    config[3,1]<-"gatk_chr"
                    config[3,2]<-ifelse(!is.null(input$gatk_chr),
                                        input$gatk_chr,NA)
                    config[4,1]<-"gatk_pos"
                    config[4,2]<-ifelse(!is.null(input$gatk_pos),
                                        input$gatk_pos,NA)
                    config[5,1]<-"gatk_ref"
                    config[5,2]<-ifelse(!is.null(input$gatk_ref),
                                        input$gatk_ref,NA)
                    config[6,1]<-"gatk_alt"
                    config[6,2]<-ifelse(!is.null(input$gatk_alt),
                                        input$gatk_alt,NA)
                    config[7,1]<-"gatk_file_names_add"
                    config[7,2]<-ifelse(!is.null(input$gatk_file_names_add),
                                        input$gatk_file_names_add,NA)
                    config[8,1]<-"gatk_mnvs"
                    config[8,2]<-ifelse(!is.null(input$gatk_mnvs),
                                        input$gatk_mnvs,NA)
                    config[9,1]<-"gatk_snv_indel"
                    config[9,2]<-ifelse(!is.null(input$gatk_snv_indel),
                                        input$gatk_snv_indel,NA)
                    config[10,1]<-"gatk_snv_names_add"
                    config[10,2]<-ifelse(!is.null(input$gatk_snv_names_add),
                                         input$gatk_snv_names_add,NA)
                    config[11,1]<-"gatk_indel_names_add"
                    config[11,2]<-ifelse(!is.null(input$gatk_indel_names_add),
                                         input$gatk_indel_names_add,NA)
                    config[12,1]<-"gatk_indels"
                    config[12,2]<-ifelse(!is.null(input$gatk_indels),
                                         input$gatk_indels,NA)
                    #Platypus
                    config[13,1]<-"platypus_folder"
                    config[13,2]<-ifelse(!is.null(input$platypus_folder),
                                         input$platypus_folder,NA)
                    config[14,1]<-"platypus_file_type"
                    config[14,2]<-ifelse(!is.null(input$platypus_file_type),
                                         input$platypus_file_type,NA)
                    config[15,1]<-"platypus_chr"
                    config[15,2]<-ifelse(!is.null(input$platypus_chr),
                                         input$platypus_chr,NA)
                    config[16,1]<-"platypus_pos"
                    config[16,2]<-ifelse(!is.null(input$platypus_pos),
                                         input$platypus_pos,NA)
                    config[17,1]<-"platypus_ref"
                    config[17,2]<-ifelse(!is.null(input$platypus_ref),
                                         input$platypus_ref,NA)
                    config[18,1]<-"platypus_alt"
                    config[18,2]<-ifelse(!is.null(input$platypus_alt),
                                         input$platypus_alt,NA)
                    config[19,1]<-"platypus_file_names_add"
                    config[19,2]<-ifelse(!is.null(input$platypus_file_names_add),
                                         input$platypus_file_names_add,NA)
                    config[20,1]<-"platypus_mnvs"
                    config[20,2]<-ifelse(!is.null(input$platypus_mnvs),
                                         input$platypus_mnvs,NA)
                    config[21,1]<-"platypus_snv_indel"
                    config[21,2]<-ifelse(!is.null(input$platypus_snv_indel),
                                         input$platypus_snv_indel,NA)
                    config[22,1]<-"platypus_snv_names_add"
                    config[22,2]<-ifelse(!is.null(input$platypus_snv_names_add),
                                         input$platypus_snv_names_add,NA)
                    config[23,1]<-"platypus_indel_names_add"
                    config[23,2]<-ifelse(!is.null(input$platypus_indel_names_add),
                                         input$platypus_indel_names_add,NA)
                    config[24,1]<-"platypus_indels"
                    config[24,2]<-ifelse(!is.null(input$platypus_indels),
                                         input$platypus_indels,NA)
                    #VarScan
                    config[25,1]<-"varscan_folder"
                    config[25,2]<-ifelse(!is.null(input$varscan_folder),
                                         input$varscan_folder,NA)
                    config[26,1]<-"varscan_file_type"
                    config[26,2]<-ifelse(!is.null(input$varscan_file_type),
                                         input$varscan_file_type,NA)
                    config[27,1]<-"varscan_chr"
                    config[27,2]<-ifelse(!is.null(input$varscan_chr),
                                         input$varscan_chr,NA)
                    config[28,1]<-"varscan_pos"
                    config[28,2]<-ifelse(!is.null(input$varscan_pos),
                                         input$varscan_pos,NA)
                    config[29,1]<-"varscan_ref"
                    config[29,2]<-ifelse(!is.null(input$varscan_ref),
                                         input$varscan_ref,NA)
                    config[30,1]<-"varscan_alt"
                    config[30,2]<-ifelse(!is.null(input$varscan_alt),
                                         input$varscan_alt,NA)
                    config[31,1]<-"varscan_file_names_add"
                    config[31,2]<-ifelse(!is.null(input$varscan_file_names_add),
                                         input$varscan_file_names_add,NA)
                    config[32,1]<-"varscan_mnvs"
                    config[32,2]<-ifelse(!is.null(input$varscan_mnvs),
                                         input$varscan_mnvs,NA)
                    config[33,1]<-"varscan_snv_indel"
                    config[33,2]<-ifelse(!is.null(input$varscan_snv_indel),
                                         input$varscan_snv_indel,NA)
                    config[34,1]<-"varscan_snv_names_add"
                    config[34,2]<-ifelse(!is.null(input$varscan_snv_names_add),
                                         input$varscan_snv_names_add,NA)
                    config[35,1]<-"varscan_indel_names_add"
                    config[35,2]<-ifelse(!is.null(input$varscan_indel_names_add),
                                         input$varscan_indel_names_add,NA)
                    config[36,1]<-"varscan_indels"
                    config[36,2]<-ifelse(!is.null(input$varscan_indels),
                                         input$varscan_indels,NA)
                    #FreeBayes
                    config[37,1]<-"freebayes_folder"
                    config[37,2]<-ifelse(!is.null(input$freebayes_folder),
                                         input$freebayes_folder,NA)
                    config[38,1]<-"freebayes_file_type"
                    config[38,2]<-ifelse(!is.null(input$freebayes_file_type),
                                         input$freebayes_file_type,NA)
                    config[39,1]<-"freebayes_chr"
                    config[39,2]<-ifelse(!is.null(input$freebayes_chr),
                                         input$freebayes_chr,NA)
                    config[40,1]<-"freebayes_pos"
                    config[40,2]<-ifelse(!is.null(input$freebayes_pos),
                                         input$freebayes_pos,NA)
                    config[41,1]<-"freebayes_ref"
                    config[41,2]<-ifelse(!is.null(input$freebayes_ref),
                                         input$freebayes_ref,NA)
                    config[42,1]<-"freebayes_alt"
                    config[42,2]<-ifelse(!is.null(input$freebayes_alt),
                                         input$freebayes_alt,NA)
                    config[43,1]<-"freebayes_file_names_add"
                    config[43,2]<-ifelse(!is.null(input$freebayes_file_names_add),
                                         input$freebayes_file_names_add,NA)
                    config[44,1]<-"freebayes_mnvs"
                    config[44,2]<-ifelse(!is.null(input$freebayes_mnvs),
                                         input$freebayes_mnvs,NA)
                    config[45,1]<-"freebayes_snv_indel"
                    config[45,2]<-ifelse(!is.null(input$freebayes_snv_indel),
                                         input$freebayes_snv_indel,NA)
                    config[46,1]<-"freebayes_snv_names_add"
                    config[46,2]<-ifelse(!is.null(input$freebayes_snv_names_add),
                                         input$freebayes_snv_names_add,NA)
                    config[47,1]<-"freebayes_indel_names_add"
                    config[47,2]<-ifelse(!is.null(input$freebayes_indel_names_add),
                                         input$freebayes_indel_names_add,NA)
                    config[48,1]<-"freebayes_indels"
                    config[48,2]<-ifelse(!is.null(input$freebayes_indels),
                                         input$freebayes_indels,NA)
                    #LoFreq
                    config[49,1]<-"lofreq_folder"
                    config[49,2]<-ifelse(!is.null(input$lofreq_folder),
                                         input$lofreq_folder,NA)
                    config[50,1]<-"lofreq_file_type"
                    config[50,2]<-ifelse(!is.null(input$lofreq_file_type),
                                         input$lofreq_file_type,NA)
                    config[51,1]<-"lofreq_chr"
                    config[51,2]<-ifelse(!is.null(input$lofreq_chr),
                                         input$lofreq_chr,NA)
                    config[52,1]<-"lofreq_pos"
                    config[52,2]<-ifelse(!is.null(input$lofreq_pos),
                                         input$lofreq_pos,NA)
                    config[53,1]<-"lofreq_ref"
                    config[53,2]<-ifelse(!is.null(input$lofreq_ref),
                                         input$lofreq_ref,NA)
                    config[54,1]<-"lofreq_alt"
                    config[54,2]<-ifelse(!is.null(input$lofreq_alt),
                                         input$lofreq_alt,NA)
                    config[55,1]<-"lofreq_file_names_add"
                    config[55,2]<-ifelse(!is.null(input$lofreq_file_names_add),
                                         input$lofreq_file_names_add,NA)
                    config[56,1]<-"lofreq_mnvs"
                    config[56,2]<-ifelse(!is.null(input$lofreq_mnvs),
                                         input$lofreq_mnvs,NA)
                    config[57,1]<-"lofreq_snv_indel"
                    config[57,2]<-ifelse(!is.null(input$lofreq_snv_indel),
                                         input$lofreq_snv_indel,NA)
                    config[58,1]<-"lofreq_snv_names_add"
                    config[58,2]<-ifelse(!is.null(input$lofreq_snv_names_add),
                                         input$lofreq_snv_names_add,NA)
                    config[59,1]<-"lofreq_indel_names_add"
                    config[59,2]<-ifelse(!is.null(input$lofreq_indel_names_add),
                                         input$lofreq_indel_names_add,NA)
                    config[60,1]<-"lofreq_indels"
                    config[60,2]<-ifelse(!is.null(input$lofreq_indels),
                                         input$lofreq_indels,NA)
                    #SNVer
                    config[61,1]<-"snver_folder"
                    config[61,2]<-ifelse(!is.null(input$snver_folder),
                                         input$snver_folder,NA)
                    config[62,1]<-"snver_file_type"
                    config[62,2]<-ifelse(!is.null(input$snver_file_type),
                                         input$snver_file_type,NA)
                    config[63,1]<-"snver_chr"
                    config[63,2]<-ifelse(!is.null(input$snver_chr),
                                         input$snver_chr,NA)
                    config[64,1]<-"snver_pos"
                    config[64,2]<-ifelse(!is.null(input$snver_pos),
                                         input$snver_pos,NA)
                    config[65,1]<-"snver_ref"
                    config[65,2]<-ifelse(!is.null(input$snver_ref),
                                         input$snver_ref,NA)
                    config[66,1]<-"snver_alt"
                    config[66,2]<-ifelse(!is.null(input$snver_alt),
                                         input$snver_alt,NA)
                    config[67,1]<-"snver_file_names_add"
                    config[67,2]<-ifelse(!is.null(input$snver_file_names_add),
                                         input$snver_file_names_add,NA)
                    config[68,1]<-"snver_mnvs"
                    config[68,2]<-ifelse(!is.null(input$snver_mnvs),
                                         input$snver_mnvs,NA)
                    config[69,1]<-"snver_snv_indel"
                    config[69,2]<-ifelse(!is.null(input$snver_snv_indel),
                                         input$snver_snv_indel,NA)
                    config[70,1]<-"snver_snv_names_add"
                    config[70,2]<-ifelse(!is.null(input$snver_snv_names_add),
                                         input$snver_snv_names_add,NA)
                    config[71,1]<-"snver_indel_names_add"
                    config[71,2]<-ifelse(!is.null(input$snver_indel_names_add),
                                         input$snver_indel_names_add,NA)
                    config[72,1]<-"snver_indels"
                    config[72,2]<-ifelse(!is.null(input$snver_indels),
                                         input$snver_indels,NA)
                    #SamTools
                    config[73,1]<-"samtools_folder"
                    config[73,2]<-ifelse(!is.null(input$samtools_folder),
                                         input$samtools_folder,NA)
                    config[74,1]<-"samtools_file_type"
                    config[74,2]<-ifelse(!is.null(input$samtools_file_type),
                                         input$samtools_file_type,NA)
                    config[75,1]<-"samtools_chr"
                    config[75,2]<-ifelse(!is.null(input$samtools_chr),
                                         input$samtools_chr,NA)
                    config[76,1]<-"samtools_pos"
                    config[76,2]<-ifelse(!is.null(input$samtools_pos),
                                         input$samtools_pos,NA)
                    config[77,1]<-"samtools_ref"
                    config[77,2]<-ifelse(!is.null(input$samtools_ref),
                                         input$samtools_ref,NA)
                    config[78,1]<-"samtools_alt"
                    config[78,2]<-ifelse(!is.null(input$samtools_alt),
                                         input$samtools_alt,NA)
                    config[79,1]<-"samtools_file_names_add"
                    config[79,2]<-ifelse(!is.null(input$samtools_file_names_add),
                                         input$samtools_file_names_add,NA)
                    config[80,1]<-"samtools_mnvs"
                    config[80,2]<-ifelse(!is.null(input$samtools_mnvs),
                                         input$samtools_mnvs,NA)
                    config[81,1]<-"samtools_snv_indel"
                    config[81,2]<-ifelse(!is.null(input$samtools_snv_indel),
                                         input$samtools_snv_indel,NA)
                    config[82,1]<-"samtools_snv_names_add"
                    config[82,2]<-ifelse(!is.null(input$samtools_snv_names_add),
                                         input$samtools_snv_names_add,NA)
                    config[83,1]<-"samtools_indel_names_add"
                    config[83,2]<-ifelse(!is.null(input$samtools_indel_names_add),
                                         input$samtools_indel_names_add,NA)
                    config[84,1]<-"samtools_indels"
                    config[84,2]<-ifelse(!is.null(input$samtools_indels),
                                         input$samtools_indels,NA)
                    #VarDict
                    config[85,1]<-"vardict_folder"
                    config[85,2]<-ifelse(!is.null(input$vardict_folder),
                                         input$vardict_folder,NA)
                    config[86,1]<-"vardict_file_type"
                    config[86,2]<-ifelse(!is.null(input$vardict_file_type),
                                         input$vardict_file_type,NA)
                    config[87,1]<-"vardict_chr"
                    config[87,2]<-ifelse(!is.null(input$vardict_chr),
                                         input$vardict_chr,NA)
                    config[88,1]<-"vardict_pos"
                    config[88,2]<-ifelse(!is.null(input$vardict_pos),
                                         input$vardict_pos,NA)
                    config[89,1]<-"vardict_ref"
                    config[89,2]<-ifelse(!is.null(input$vardict_ref),
                                         input$vardict_ref,NA)
                    config[90,1]<-"vardict_alt"
                    config[90,2]<-ifelse(!is.null(input$vardict_alt),
                                         input$vardict_alt,NA)
                    config[91,1]<-"vardict_file_names_add"
                    config[91,2]<-ifelse(!is.null(input$vardict_file_names_add),
                                         input$vardict_file_names_add,NA)
                    config[92,1]<-"vardict_mnvs"
                    config[92,2]<-ifelse(!is.null(input$vardict_mnvs),
                                         input$vardict_mnvs,NA)
                    config[93,1]<-"vardict_snv_indel"
                    config[93,2]<-ifelse(!is.null(input$vardict_snv_indel),
                                         input$vardict_snv_indel,NA)
                    config[94,1]<-"vardict_snv_names_add"
                    config[94,2]<-ifelse(!is.null(input$vardict_snv_names_add),
                                         input$vardict_snv_names_add,NA)
                    config[95,1]<-"vardict_indel_names_add"
                    config[95,2]<-ifelse(!is.null(input$vardict_indel_names_add),
                                         input$vardict_indel_names_add,NA)
                    config[96,1]<-"vardict_indels"
                    config[96,2]<-ifelse(!is.null(input$vardict_indels),
                                         input$vardict_indels,NA)
                    #additional callers
                    #caller1
                    config[97,1]<-"caller1_h4"
                    config[97,2]<-ifelse(input$nr_additional>0,"Caller 1:",NA)
                    config[98,1]<-"caller1_name"
                    config[98,2]<-ifelse(!is.null(input$caller1_name),
                                         input$caller1_name,NA)
                    config[99,1]<-"caller1_folder"
                    config[99,2]<-ifelse(!is.null(input$caller1_folder),
                                         input$caller1_folder,NA)
                    config[100,1]<-"caller1_file_type"
                    config[100,2]<-ifelse(!is.null(input$caller1_file_type),
                                          input$caller1_file_type,NA)
                    config[101,1]<-"caller1_chr"
                    config[101,2]<-ifelse(!is.null(input$caller1_chr),
                                          input$caller1_chr,NA)
                    config[102,1]<-"caller1_pos"
                    config[102,2]<-ifelse(!is.null(input$caller1_pos),
                                          input$caller1_pos,NA)
                    config[103,1]<-"caller1_ref"
                    config[103,2]<-ifelse(!is.null(input$caller1_ref),
                                          input$caller1_ref,NA)
                    config[104,1]<-"caller1_alt"
                    config[104,2]<-ifelse(!is.null(input$caller1_alt),
                                          input$caller1_alt,NA)
                    config[105,1]<-"caller1_file_names_add"
                    config[105,2]<-ifelse(!is.null(input$caller1_file_names_add),
                                          input$caller1_file_names_add,NA)
                    config[106,1]<-"caller1_mnvs"
                    config[106,2]<-ifelse(!is.null(input$caller1_mnvs),
                                          input$caller1_mnvs,NA)
                    config[107,1]<-"caller1_snv_indel"
                    config[107,2]<-ifelse(!is.null(input$caller1_snv_indel),
                                          input$caller1_snv_indel,NA)
                    config[108,1]<-"caller1_snv_names_add"
                    config[108,2]<-ifelse(!is.null(input$caller1_snv_names_add),
                                          input$caller1_snv_names_add,NA)
                    config[109,1]<-"caller1_indel_names_add"
                    config[109,2]<-ifelse(!is.null(input$caller1_indel_names_add),
                                          input$caller1_indel_names_add,NA)
                    config[110,1]<-"caller1_indels"
                    config[110,2]<-ifelse(!is.null(input$caller1_indels),
                                          input$caller1_indels,NA)
                    #caller2
                    config[111,1]<-"caller2_h4"
                    config[111,2]<-ifelse(input$nr_additional>1,"Caller 2:",NA)
                    config[112,1]<-"caller2_name"
                    config[112,2]<-ifelse(!is.null(input$caller2_name),
                                          input$caller2_name,NA)
                    config[113,1]<-"caller2_folder"
                    config[113,2]<-ifelse(!is.null(input$caller2_folder),
                                          input$caller2_folder,NA)
                    config[114,1]<-"caller2_file_type"
                    config[114,2]<-ifelse(!is.null(input$caller2_file_type),
                                          input$caller2_file_type,NA)
                    config[115,1]<-"caller2_chr"
                    config[115,2]<-ifelse(!is.null(input$caller2_chr),
                                          input$caller2_chr,NA)
                    config[116,1]<-"caller2_pos"
                    config[116,2]<-ifelse(!is.null(input$caller2_pos),
                                          input$caller2_pos,NA)
                    config[117,1]<-"caller2_ref"
                    config[117,2]<-ifelse(!is.null(input$caller2_ref),
                                          input$caller2_ref,NA)
                    config[118,1]<-"caller2_alt"
                    config[118,2]<-ifelse(!is.null(input$caller2_alt),
                                          input$caller2_alt,NA)
                    config[119,1]<-"caller2_file_names_add"
                    config[119,2]<-ifelse(!is.null(input$caller2_file_names_add),
                                          input$caller2_file_names_add,NA)
                    config[120,1]<-"caller2_mnvs"
                    config[120,2]<-ifelse(!is.null(input$caller2_mnvs),
                                          input$caller2_mnvs,NA)
                    config[121,1]<-"caller2_snv_indel"
                    config[121,2]<-ifelse(!is.null(input$caller2_snv_indel),
                                          input$caller2_snv_indel,NA)
                    config[122,1]<-"caller2_snv_names_add"
                    config[122,2]<-ifelse(!is.null(input$caller2_snv_names_add),
                                          input$caller2_snv_names_add,NA)
                    config[123,1]<-"caller2_indel_names_add"
                    config[123,2]<-ifelse(!is.null(input$caller2_indel_names_add),
                                          input$caller2_indel_names_add,NA)
                    config[124,1]<-"caller2_indels"
                    config[124,2]<-ifelse(!is.null(input$caller2_indels),
                                          input$caller2_indels,NA)
                    #caller3
                    config[125,1]<-"caller3_h4"
                    config[125,2]<-ifelse(input$nr_additional>2,"Caller 3:",NA)
                    config[126,1]<-"caller3_name"
                    config[126,2]<-ifelse(!is.null(input$caller3_name),
                                          input$caller3_name,NA)
                    config[127,1]<-"caller3_folder"
                    config[127,2]<-ifelse(!is.null(input$caller3_folder),
                                          input$caller3_folder,NA)
                    config[128,1]<-"caller3_file_type"
                    config[128,2]<-ifelse(!is.null(input$caller3_file_type),
                                          input$caller3_file_type,NA)
                    config[129,1]<-"caller3_chr"
                    config[129,2]<-ifelse(!is.null(input$caller3_chr),
                                          input$caller3_chr,NA)
                    config[130,1]<-"caller3_pos"
                    config[130,2]<-ifelse(!is.null(input$caller3_pos),
                                          input$caller3_pos,NA)
                    config[131,1]<-"caller3_ref"
                    config[131,2]<-ifelse(!is.null(input$caller3_ref),
                                          input$caller3_ref,NA)
                    config[132,1]<-"caller3_alt"
                    config[132,2]<-ifelse(!is.null(input$caller3_alt),
                                          input$caller3_alt,NA)
                    config[133,1]<-"caller3_file_names_add"
                    config[133,2]<-ifelse(!is.null(input$caller3_file_names_add),
                                          input$caller3_file_names_add,NA)
                    config[134,1]<-"caller3_mnvs"
                    config[134,2]<-ifelse(!is.null(input$caller3_mnvs),
                                          input$caller3_mnvs,NA)
                    config[135,1]<-"caller3_snv_indel"
                    config[135,2]<-ifelse(!is.null(input$caller3_snv_indel),
                                          input$caller3_snv_indel,NA)
                    config[136,1]<-"caller3_snv_names_add"
                    config[136,2]<-ifelse(!is.null(input$caller3_snv_names_add),
                                          input$caller3_snv_names_add,NA)
                    config[137,1]<-"caller3_indel_names_add"
                    config[137,2]<-ifelse(!is.null(input$caller3_indel_names_add),
                                          input$caller3_indel_names_add,NA)
                    config[138,1]<-"caller3_indels"
                    config[138,2]<-ifelse(!is.null(input$caller3_indels),
                                          input$caller3_indels,NA)
                    #caller4
                    config[139,1]<-"caller4_h4"
                    config[139,2]<-ifelse(input$nr_additional>3,"Caller 4:",NA)
                    config[140,1]<-"caller4_name"
                    config[140,2]<-ifelse(!is.null(input$caller4_name),
                                          input$caller4_name,NA)
                    config[141,1]<-"caller4_folder"
                    config[141,2]<-ifelse(!is.null(input$caller4_folder),
                                          input$caller4_folder,NA)
                    config[142,1]<-"caller4_file_type"
                    config[142,2]<-ifelse(!is.null(input$caller4_file_type),
                                          input$caller4_file_type,NA)
                    config[143,1]<-"caller4_chr"
                    config[143,2]<-ifelse(!is.null(input$caller4_chr),
                                          input$caller4_chr,NA)
                    config[144,1]<-"caller4_pos"
                    config[144,2]<-ifelse(!is.null(input$caller4_pos),
                                          input$caller4_pos,NA)
                    config[145,1]<-"caller4_ref"
                    config[145,2]<-ifelse(!is.null(input$caller4_ref),
                                          input$caller4_ref,NA)
                    config[146,1]<-"caller4_alt"
                    config[146,2]<-ifelse(!is.null(input$caller4_alt),
                                          input$caller4_alt,NA)
                    config[147,1]<-"caller4_file_names_add"
                    config[147,2]<-ifelse(!is.null(input$caller4_file_names_add),
                                          input$caller4_file_names_add,NA)
                    config[148,1]<-"caller4_mnvs"
                    config[148,2]<-ifelse(!is.null(input$caller4_mnvs),
                                          input$caller4_mnvs,NA)
                    config[149,1]<-"caller4_snv_indel"
                    config[149,2]<-ifelse(!is.null(input$caller4_snv_indel),
                                          input$caller4_snv_indel,NA)
                    config[150,1]<-"caller4_snv_names_add"
                    config[150,2]<-ifelse(!is.null(input$caller4_snv_names_add),
                                          input$caller4_snv_names_add,NA)
                    config[151,1]<-"caller4_indel_names_add"
                    config[151,2]<-ifelse(!is.null(input$caller4_indel_names_add),
                                          input$caller4_indel_names_add,NA)
                    config[152,1]<-"caller4_indels"
                    config[152,2]<-ifelse(!is.null(input$caller4_indels),
                                          input$caller4_indels,NA)
                    #caller5
                    config[153,1]<-"caller5_h4"
                    config[153,2]<-ifelse(input$nr_additional>4,"Caller 5:",NA)
                    config[154,1]<-"caller5_name"
                    config[154,2]<-ifelse(!is.null(input$caller5_name),
                                          input$caller5_name,NA)
                    config[155,1]<-"caller5_folder"
                    config[155,2]<-ifelse(!is.null(input$caller5_folder),
                                          input$caller5_folder,NA)
                    config[156,1]<-"caller5_file_type"
                    config[156,2]<-ifelse(!is.null(input$caller5_file_type),
                                          input$caller5_file_type,NA)
                    config[157,1]<-"caller5_chr"
                    config[157,2]<-ifelse(!is.null(input$caller5_chr),
                                          input$caller5_chr,NA)
                    config[158,1]<-"caller5_pos"
                    config[158,2]<-ifelse(!is.null(input$caller5_pos),
                                          input$caller5_pos,NA)
                    config[159,1]<-"caller5_ref"
                    config[159,2]<-ifelse(!is.null(input$caller5_ref),
                                          input$caller5_ref,NA)
                    config[160,1]<-"caller5_alt"
                    config[160,2]<-ifelse(!is.null(input$caller5_alt),
                                          input$caller5_alt,NA)
                    config[161,1]<-"caller5_file_names_add"
                    config[161,2]<-ifelse(!is.null(input$caller5_file_names_add),
                                          input$caller5_file_names_add,NA)
                    config[162,1]<-"caller5_mnvs"
                    config[162,2]<-ifelse(!is.null(input$caller5_mnvs),
                                          input$caller5_mnvs,NA)
                    config[163,1]<-"caller5_snv_indel"
                    config[163,2]<-ifelse(!is.null(input$caller5_snv_indel),
                                          input$caller5_snv_indel,NA)
                    config[164,1]<-"caller5_snv_names_add"
                    config[164,2]<-ifelse(!is.null(input$caller5_snv_names_add),
                                          input$caller5_snv_names_add,NA)
                    config[165,1]<-"caller5_indel_names_add"
                    config[165,2]<-ifelse(!is.null(input$caller5_indel_names_add),
                                          input$caller5_indel_names_add,NA)
                    config[166,1]<-"caller5_indels"
                    config[166,2]<-ifelse(!is.null(input$caller5_indels),
                                          input$caller5_indels,NA)

                    #3. Annotation
                    config[167,1]<-"locations"
                    config[167,2]<-paste(input$locations,collapse=",")
                    config[168,1]<-"consequences"
                    config[168,2]<-paste(input$consequences,collapse=",")

                    #5. Coverage and BQ
                    config[169,1]<-"bam_folder"
                    config[169,2]<-input$bam_folder
                    config[170,1]<-"dp"
                    config[170,2]<-input$dp
                    config[171,1]<-"nr_alt"
                    config[171,2]<-input$nr_alt
                    config[172,1]<-"vaf"
                    config[172,2]<-input$vaf
                    config[173,1]<-"bq"
                    config[173,2]<-input$bq
                    config[174,1]<-"bq_diff"
                    config[174,2]<-input$bq_diff

                    #6. Characteristics
                    config[175,1]<-"dbSNP"
                    config[175,2]<-ifelse(!is.null(input$dbSNP),input$dbSNP,NA)
                    config[176,1]<-"1kgenomes"
                    config[176,2]<-ifelse(!is.null(input$"1kgenomes"),
                                          input$"1kgenomes",NA)
                    config[177,1]<-"exac"
                    config[177,2]<-ifelse(!is.null(input$exac),input$exac,NA)
                    config[178,1]<-"esp"
                    config[178,2]<-ifelse(!is.null(input$esp),input$esp,NA)
                    config[179,1]<-"gad"
                    config[179,2]<-ifelse(!is.null(input$gad),input$gad,NA)
                    config[180,1]<-"cosmic"
                    config[180,2]<-ifelse(!is.null(input$cosmic),
                                          input$cosmic,NA)
                    config[181,1]<-"clinvar"
                    config[181,2]<-ifelse(!is.null(input$clinvar),
                                          input$clinvar,NA)
                    config[182,1]<-"predict"
                    config[182,2]<-ifelse(!is.null(input$predict),
                                          input$predict,NA)

                    #7. Filtration
                    config[183,1]<-"stricter_thresholds"
                    config[183,2]<-input$stricter_thresholds
                    config[184,1]<-"dp2"
                    config[184,2]<-ifelse(input$stricter_thresholds=="Yes",
                                          input$dp2,NA)
                    config[185,1]<-"nr_alt2"
                    config[185,2]<-ifelse(input$stricter_thresholds=="Yes",
                                          input$nr_alt2,NA)
                    config[186,1]<-"vaf2"
                    config[186,2]<-ifelse(input$stricter_thresholds=="Yes",
                                          input$vaf2,NA)
                    config[187,1]<-"bq2"
                    config[187,2]<-ifelse(input$stricter_thresholds=="Yes",
                                          input$bq2,NA)
                    config[188,1]<-"bq_diff2"
                    config[188,2]<-ifelse(input$stricter_thresholds=="Yes",
                                          input$bq_diff2,NA)
                    config[189,1]<-"nr_samples"
                    config[189,2]<-input$nr_samples
                    config[190,1]<-"damaging_safe1"
                    config[190,2]<-ifelse(!is.null(input$damaging_safe1),
                                          as.character(input$damaging_safe1),
                                          NA)
                    config[191,1]<-"tolerated_safe1"
                    config[191,2]<-ifelse(!is.null(input$tolerated_safe1),
                                          as.character(input$tolerated_safe1),
                                          NA)
                    config[192,1]<-"damaging_safe2"
                    config[192,2]<-ifelse(!is.null(input$damaging_safe2),
                                          as.character(input$damaging_safe2),
                                          NA)
                    config[193,1]<-"tolerated_safe2"
                    config[193,2]<-ifelse(!is.null(input$tolerated_safe2),
                                          as.character(input$tolerated_safe2),
                                          NA)
                    config[194,1]<-"damaging_safe3"
                    config[194,2]<-ifelse(!is.null(input$damaging_safe3),
                                          as.character(input$damaging_safe3),
                                          NA)
                    config[195,1]<-"tolerated_safe3"
                    config[195,2]<-ifelse(!is.null(input$tolerated_safe3),
                                          as.character(input$tolerated_safe3),
                                          NA)

                    config[196,1]<-"artifact_score"
                    config[196,2]<-input$artifact_score
                    config[197,1]<-"header1"
                    config[197,2]<-ifelse(input$artifact_score=="Yes",
                                          "Important note:",NA)
                    config[198,1]<-"header2"
                    config[198,2]<-ifelse(input$artifact_score=="Yes",
                                          "High score -> artifact",NA)
                    config[199,1]<-"header3"
                    config[199,2]<-ifelse(input$artifact_score=="Yes",
                                          "Low score -> probably true",NA)
                    config[200,1]<-"PolymorphismVAF10"
                    config[200,2]<-ifelse(input$artifact_score=="Yes",
                                          input$PolymorphismVAF10,NA)
                    config[201,1]<-"BQ_AltMean"
                    config[201,2]<-ifelse(input$artifact_score=="Yes",
                                          input$BQ_AltMean,NA)
                    config[202,1]<-"detectedHigh"
                    config[202,2]<-ifelse(input$artifact_score=="Yes",
                                          input$detectedHigh,NA)
                    config[203,1]<-"detectedLow"
                    config[203,2]<-ifelse(input$artifact_score=="Yes",
                                          input$detectedLow,NA)
                    config[204,1]<-"detectedLowVAF"
                    config[204,2]<-ifelse(input$artifact_score=="Yes",
                                          input$detectedLowVAF,NA)
                    config[205,1]<-"vafLow"
                    config[205,2]<-ifelse(input$artifact_score=="Yes",
                                          input$vafLow,NA)
                    config[206,1]<-"PolymorphismVAF20"
                    config[206,2]<-ifelse(input$artifact_score=="Yes",
                                          input$PolymorphismVAF20,NA)
                    config[207,1]<-"PolymorphismFrame"
                    config[207,2]<-ifelse(input$artifact_score=="Yes",
                                          input$PolymorphismFrame,NA)
                    config[208,1]<-"isIndel"
                    config[208,2]<-ifelse(input$artifact_score=="Yes",
                                          input$isIndel,NA)
                    config[209,1]<-"isIndelVAF"
                    config[209,2]<-ifelse(input$artifact_score=="Yes",
                                          input$isIndelVAF,NA)
                    config[210,1]<-"noPrimerP"
                    config[210,2]<-ifelse(input$artifact_score=="Yes",
                                          input$noPrimerP,NA)
                    config[211,1]<-"noPrimerPFwd"
                    config[211,2]<-ifelse(input$artifact_score=="Yes",
                                          input$noPrimerPFwd,NA)
                    config[212,1]<-"noPrimerPRev"
                    config[212,2]<-ifelse(input$artifact_score=="Yes",
                                          input$noPrimerPRev,NA)
                    config[213,1]<-"databaseVAF"
                    config[213,2]<-ifelse(input$artifact_score=="Yes",
                                          input$databaseVAF,NA)
                    config[214,1]<-"databaseHigh"
                    config[214,2]<-ifelse(input$artifact_score=="Yes",
                                          input$databaseHigh,NA)
                    config[215,1]<-"predictionVAF"
                    config[215,2]<-ifelse(input$artifact_score=="Yes",
                                          input$predictionVAF,NA)
                    config[216,1]<-"oneCaller"
                    config[216,2]<-ifelse(input$artifact_score=="Yes",
                                          input$oneCaller,NA)
                    config[217,1]<-"primerLocation"
                    config[217,2]<-ifelse(input$artifact_score=="Yes",
                                          input$primerLocation,NA)
                    config[218,1]<-"primerPAlt"
                    config[218,2]<-ifelse(input$artifact_score=="Yes",
                                          input$primerPAlt,NA)
                    config[219,1]<-"primerPFwd"
                    config[219,2]<-ifelse(input$artifact_score=="Yes",
                                          input$primerPFwd,NA)
                    config[220,1]<-"primerPRev"
                    config[220,2]<-ifelse(input$artifact_score=="Yes",
                                          input$primerPRev,NA)
                    config[221,1]<-"predictionSafe"
                    config[221,2]<-ifelse(input$artifact_score=="Yes",
                                          input$predictionSafe,NA)
                    config[222,1]<-"nrcaller4"
                    config[222,2]<-ifelse(input$artifact_score=="Yes",
                                          input$nrcaller4,NA)
                    config[223,1]<-"reward4"
                    config[223,2]<-ifelse(input$artifact_score=="Yes",
                                          input$reward4,NA)
                    config[224,1]<-"nrcaller5"
                    config[224,2]<-ifelse(input$artifact_score=="Yes",
                                          input$nrcaller5,NA)
                    config[225,1]<-"reward5"
                    config[225,2]<-ifelse(input$artifact_score=="Yes",
                                          input$reward5,NA)
                    config[226,1]<-"nrcaller6"
                    config[226,2]<-ifelse(input$artifact_score=="Yes",
                                          input$nrcaller6,NA)
                    config[227,1]<-"reward6"
                    config[227,2]<-ifelse(input$artifact_score=="Yes",
                                          input$reward6,NA)
                    config[228,1]<-"knownHotspot"
                    config[228,2]<-ifelse(input$artifact_score=="Yes",
                                          input$knownHotspot,NA)
                    config[229,1]<-"overlapTools"
                    config[229,2]<-paste(input$overlapTools,collapse=",")
                    config[230,1]<-"overlapReward"
                    config[230,2]<-ifelse(input$artifact_score=="Yes",
                                          input$overlapReward,NA)
                    config[231,1]<-"artifactThreshold"
                    config[231,2]<-ifelse(input$artifact_score=="Yes",
                                          input$artifactThreshold,NA)

                    config[232,1]<-"polymorphism_score"
                    config[232,2]<-input$polymorphism_score
                    config[233,1]<-"header1"
                    config[233,2]<-ifelse(input$artifact_score=="Yes",
                                          "Important note:",NA)
                    config[234,1]<-"header2"
                    config[234,2]<-ifelse(input$artifact_score=="Yes",
                                          "High score -> polymorphism",NA)
                    config[235,1]<-"header3"
                    config[235,2]<-ifelse(input$artifact_score=="Yes",
                                          "Low score -> no polymorphism",NA)
                    config[236,1]<-"polyDetected"
                    config[236,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDetected,NA)
                    config[237,1]<-"polyDatabases"
                    config[237,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDatabases,NA)
                    config[238,1]<-"polyDatabasesReward"
                    config[238,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDatabasesReward,NA)
                    config[239,1]<-"polyDatabasesPolyLow"
                    config[239,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDatabasesPolyLow,NA)
                    config[240,1]<-"polyDatabasesPolyLowReward"
                    config[240,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDatabasesPolyLowReward,NA)
                    config[241,1]<-"polyDatabasesPolyHigh"
                    config[241,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDatabasesPolyHigh,NA)
                    config[242,1]<-"polyDatabasesPolyHighReward"
                    config[242,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDatabasesPolyHighReward,NA)
                    config[243,1]<-"polyVAF"
                    config[243,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyVAF,NA)
                    config[244,1]<-"polyPrediction"
                    config[244,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyPrediction,NA)
                    config[245,1]<-"polyEffect"
                    config[245,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyEffect,NA)
                    config[246,1]<-"polyDetectedOnce"
                    config[246,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDetectedOnce,NA)
                    config[247,1]<-"polyDatabasesMut"
                    config[247,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDatabasesMut,NA)
                    config[248,1]<-"PolyDatabasesMutReward"
                    config[248,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyDatabasesMutReward,NA)
                    config[249,1]<-"polyNoDatabase"
                    config[249,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyNoDatabase,NA)
                    config[250,1]<-"polyPredictionEffect"
                    config[250,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyPredictionEffect,NA)
                    config[251,1]<-"polyCosmic"
                    config[251,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyCosmic,NA)
                    config[252,1]<-"polyThresholdCritical"
                    config[252,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyThresholdCritical,NA)
                    config[253,1]<-"polyThreshold"
                    config[253,2]<-ifelse(input$artifact_score=="Yes",
                                          input$polyThreshold,NA)

                    config[254,1]<-"output_folder"
                    config[254,2]<-input$output_folder

                    write.table(config,paste(input$output_folder,"/",
                                             input$configFileOut,".txt",sep=""),
                                quote=FALSE,row.names=FALSE,sep="\t")

                    output$messageUI1<-renderUI({h5("Done.")})
                    return()
                }
            })

            observeEvent(input$applyConfig,{
                #check if a file was uploaded
                if(is.null(input$configFileIn)){
                    log_info<-c("Please provide a configuration file<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                config_temp<-input$configFileIn
                config<-read.table(config_temp$datapath,header=TRUE,sep="\t",
                                   stringsAsFactors=FALSE)

                output$output_folderUI<-renderUI({textInput('output_folder',
                                                            'Define output folder',
                                                            as.character(config[254,2]))})

                if(!is.na(as.character(config[1,2]))){
                    output$gatkUI1<-renderUI({textInput('gatk_folder',
                                                        'Variant calling results',
                                                        as.character(config[1,2]))})
                    output$gatkUI2<-renderUI({radioButtons('gatk_file_type',
                                                           "Output file type",
                                                           c(".vcf",".txt"),
                                                           as.character(config[2,2]),
                                                           inline=TRUE)})
                    output$gatkUI3<-renderUI({
                        conditionalPanel(
                            condition="input.gatk_file_type=='.txt'",
                            numericInput('gatk_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[3,2])),
                            numericInput('gatk_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[4,2])),
                            numericInput('gatk_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[5,2])),
                            numericInput('gatk_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[6,2])))})
                    output$gatkUI4<-renderUI({textInput('gatk_file_names_add',
                                                        'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                        as.character(config[7,2]))})
                    output$gatkUI5<-renderUI({radioButtons('gatk_mnvs',
                                                           'MNVs reported?',
                                                           c("Yes","No"),
                                                           as.character(config[8,2]),
                                                           inline = TRUE)})
                    output$gatkUI6<-renderUI({radioButtons('gatk_snv_indel',
                                                           'SNVs and Indels reported in one file?',
                                                           c("Yes","No"),
                                                           as.character(config[9,2]),
                                                           inline = TRUE)})
                    output$gatkUI7<-renderUI({conditionalPanel(
                        condition="input.gatk_snv_indel=='No'",
                        textInput('gatk_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[10,2])),
                        textInput('gatk_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[11,2])))})
                    output$gatkUI8<-renderUI({radioButtons('gatk_indels',
                                                           'How are Indels reported?',
                                                           c("CA>C","C>-A",
                                                             "CAAAC>CAAC"),
                                                           selected=as.character(config[12,2]),
                                                           inline = TRUE)})
                }
                if(is.na(as.character(config[1,2]))){
                    output$gatkUI1<-renderUI({NULL})
                    output$gatkUI2<-renderUI({NULL})
                    output$gatkUI3<-renderUI({NULL})
                    output$gatkUI4<-renderUI({NULL})
                    output$gatkUI5<-renderUI({NULL})
                    output$gatkUI6<-renderUI({NULL})
                    output$gatkUI7<-renderUI({NULL})
                    output$gatkUI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[13,2]))){
                    output$platypusUI1<-renderUI({textInput('platypus_folder',
                                                            'Variant calling results',
                                                            as.character(config[13,2]))})
                    output$platypusUI2<-renderUI({radioButtons('platypus_file_type',
                                                               "Output file type",
                                                               c(".vcf",".txt"),
                                                               as.character(config[14,2]),
                                                               inline=TRUE)})
                    output$platypusUI3<-renderUI({
                        conditionalPanel(
                            condition="input.platypus_file_type=='.txt'",
                            numericInput('platypus_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[15,2])),
                            numericInput('platypus_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[16,2])),
                            numericInput('platypus_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[17,2])),
                            numericInput('platypus_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[18,2])))})
                    output$platypusUI4<-renderUI({textInput('platypus_file_names_add',
                                                            'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                            as.character(config[19,2]))})
                    output$platypusUI5<-renderUI({radioButtons('platypus_mnvs',
                                                               'MNVs reported?',
                                                               c("Yes","No"),
                                                               as.character(config[20,2]),
                                                               inline = TRUE)})
                    output$platypusUI6<-renderUI({radioButtons('platypus_snv_indel',
                                                               'SNVs and Indels reported in one file?',
                                                               c("Yes","No"),
                                                               as.character(config[21,2]),
                                                               inline = TRUE)})
                    output$platypusUI7<-renderUI({conditionalPanel(
                        condition="input.platypus_snv_indel=='No'",
                        textInput('platypus_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[22,2])),
                        textInput('platypus_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[23,2])))})
                    output$platypusUI8<-renderUI({radioButtons('platypus_indels',
                                                               'How are Indels reported?',
                                                               c("CA>C","C>-A","CAAAC>CAAC"),
                                                               selected=as.character(config[24,2]),
                                                               inline = TRUE)})
                }
                if(is.na(as.character(config[13,2]))){
                    output$platypusUI1<-renderUI({NULL})
                    output$platypusUI2<-renderUI({NULL})
                    output$platypusUI3<-renderUI({NULL})
                    output$platypusUI4<-renderUI({NULL})
                    output$platypusUI5<-renderUI({NULL})
                    output$platypusUI6<-renderUI({NULL})
                    output$platypusUI7<-renderUI({NULL})
                    output$platypusUI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[25,2]))){
                    output$varscanUI1<-renderUI({textInput('varscan_folder',
                                                           'Variant calling results',
                                                           as.character(config[25,2]))})
                    output$varscanUI2<-renderUI({radioButtons('varscan_file_type',
                                                              "Output file type",
                                                              c(".vcf",".txt"),
                                                              as.character(config[26,2]),
                                                              inline=TRUE)})
                    output$varscanUI3<-renderUI({
                        conditionalPanel(
                            condition="input.varscan_file_type=='.txt'",
                            numericInput('varscan_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[27,2])),
                            numericInput('varscan_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[28,2])),
                            numericInput('varscan_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[29,2])),
                            numericInput('varscan_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[30,2])))})
                    output$varscanUI4<-renderUI({textInput('varscan_file_names_add',
                                                           'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                           as.character(config[31,2]))})
                    output$varscanUI5<-renderUI({radioButtons('varscan_mnvs','MNVs reported?',
                                                              c("Yes","No"),
                                                              as.character(config[32,2]),
                                                              inline = TRUE)})
                    output$varscanUI6<-renderUI({radioButtons('varscan_snv_indel',
                                                              'SNVs and Indels reported in one file?',
                                                              c("Yes","No"),
                                                              as.character(config[33,2]),
                                                              inline = TRUE)})
                    output$varscanUI7<-renderUI({conditionalPanel(
                        condition="input.varscan_snv_indel=='No'",
                        textInput('varscan_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[34,2])),
                        textInput('varscan_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[35,2])))})
                    output$varscanUI8<-renderUI({radioButtons('varscan_indels',
                                                              'How are Indels reported?',
                                                              c("CA>C","C>-A",
                                                                "CAAAC>CAAC"),
                                                              selected=as.character(config[36,2]),
                                                              inline = TRUE)})
                }
                if(is.na(as.character(config[25,2]))){
                    output$varscanUI1<-renderUI({NULL})
                    output$varscanUI2<-renderUI({NULL})
                    output$varscanUI3<-renderUI({NULL})
                    output$varscanUI4<-renderUI({NULL})
                    output$varscanUI5<-renderUI({NULL})
                    output$varscanUI6<-renderUI({NULL})
                    output$varscanUI7<-renderUI({NULL})
                    output$varscanUI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[37,2]))){
                    output$freebayesUI1<-renderUI({textInput('freebayes_folder',
                                                             'Variant calling results',
                                                             as.character(config[37,2]))})
                    output$freebayesUI2<-renderUI({radioButtons('freebayes_file_type',
                                                                "Output file type",
                                                                c(".vcf",
                                                                  ".txt"),
                                                                as.character(config[38,2]),
                                                                inline=TRUE)})
                    output$freebayesUI3<-renderUI({
                        conditionalPanel(
                            condition="input.freebayes_file_type=='.txt'",
                            numericInput('freebayes_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[39,2])),
                            numericInput('freebayes_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[40,2])),
                            numericInput('freebayes_ref'
                                         ,"In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[41,2])),
                            numericInput('freebayes_alt'
                                         ,"In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[42,2])))})
                    output$freebayesUI4<-renderUI({textInput('freebayes_file_names_add',
                                                             'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                             as.character(config[43,2]))})
                    output$freebayesUI5<-renderUI({radioButtons('freebayes_mnvs',
                                                                'MNVs reported?',
                                                                c("Yes","No"),
                                                                as.character(config[44,2]),
                                                                inline = TRUE)})
                    output$freebayesUI6<-renderUI({radioButtons('freebayes_snv_indel',
                                                                'SNVs and Indels reported in one file?',
                                                                c("Yes","No"),
                                                                as.character(config[45,2]),
                                                                inline = TRUE)})
                    output$freebayesUI7<-renderUI({conditionalPanel(
                        condition="input.freebayes_snv_indel=='No'",
                        textInput('freebayes_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[46,2])),
                        textInput('freebayes_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[47,2])))})
                    output$freebayesUI8<-renderUI({radioButtons('freebayes_indels',
                                                                'How are Indels reported?',
                                                                c("CA>C","C>-A",
                                                                  "CAAAC>CAAC"),
                                                                selected=as.character(config[48,2]),
                                                                inline=TRUE)})
                }
                if(is.na(as.character(config[37,2]))){
                    output$freebayesUI1<-renderUI({NULL})
                    output$freebayesUI2<-renderUI({NULL})
                    output$freebayesUI3<-renderUI({NULL})
                    output$freebayesUI4<-renderUI({NULL})
                    output$freebayesUI5<-renderUI({NULL})
                    output$freebayesUI6<-renderUI({NULL})
                    output$freebayesUI7<-renderUI({NULL})
                    output$freebayesUI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[49,2]))){
                    output$lofreqUI1<-renderUI({textInput('lofreq_folder',
                                                          'Variant calling results',
                                                          as.character(config[49,2]))})
                    output$lofreqUI2<-renderUI({radioButtons('lofreq_file_type',
                                                             "Output file type",
                                                             c(".vcf",".txt"),
                                                             as.character(config[50,2]),
                                                             inline=TRUE)})
                    output$lofreqUI3<-renderUI({
                        conditionalPanel(
                            condition="input.lofreq_file_type=='.txt'",
                            numericInput('lofreq_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[51,2])),
                            numericInput('lofreq_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[52,2])),
                            numericInput('lofreq_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[53,2])),
                            numericInput('lofreq_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[54,2])))})
                    output$lofreqUI4<-renderUI({textInput('lofreq_file_names_add',
                                                          'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                          as.character(config[55,2]))})
                    output$lofreqUI5<-renderUI({radioButtons('lofreq_mnvs',
                                                             'MNVs reported?',
                                                             c("Yes","No"),
                                                             as.character(config[56,2]),
                                                             inline = TRUE)})
                    output$lofreqUI6<-renderUI({radioButtons('lofreq_snv_indel',
                                                             'SNVs and Indels reported in one file?',
                                                             c("Yes","No"),
                                                             as.character(config[57,2]),
                                                             inline = TRUE)})
                    output$lofreqUI7<-renderUI({conditionalPanel(
                        condition="input.lofreq_snv_indel=='No'",
                        textInput('lofreq_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[58,2])),
                        textInput('lofreq_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[59,2])))})
                    output$lofreqUI8<-renderUI({radioButtons('lofreq_indels',
                                                             'How are Indels reported?',
                                                             c("CA>C","C>-A",
                                                               "CAAAC>CAAC"),
                                                             selected=as.character(config[60,2]),
                                                             inline = TRUE)})
                }
                if(is.na(as.character(config[49,2]))){
                    output$lofreqUI1<-renderUI({NULL})
                    output$lofreqUI2<-renderUI({NULL})
                    output$lofreqUI3<-renderUI({NULL})
                    output$lofreqUI4<-renderUI({NULL})
                    output$lofreqUI5<-renderUI({NULL})
                    output$lofreqUI6<-renderUI({NULL})
                    output$lofreqUI7<-renderUI({NULL})
                    output$lofreqUI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[61,2]))){
                    output$snverUI1<-renderUI({textInput('snver_folder',
                                                         'Variant calling results',
                                                         as.character(config[61,2]))})
                    output$snverUI2<-renderUI({radioButtons('snver_file_type',
                                                            "Output file type",
                                                            c(".vcf",".txt"),
                                                            as.character(config[62,2]),
                                                            inline=TRUE)})
                    output$snverUI3<-renderUI({
                        conditionalPanel(
                            condition="input.snver_file_type=='.txt'",
                            numericInput('snver_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[63,2])),
                            numericInput('snver_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[64,2])),
                            numericInput('snver_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[65,2])),
                            numericInput('snver_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[66,2])))})
                    output$snverUI4<-renderUI({textInput('snver_file_names_add',
                                                         'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                         as.character(config[67,2]))})
                    output$snverUI5<-renderUI({radioButtons('snver_mnvs',
                                                            'MNVs reported?',
                                                            c("Yes","No"),
                                                            as.character(config[68,2]),
                                                            inline = TRUE)})
                    output$snverUI6<-renderUI({radioButtons('snver_snv_indel',
                                                            'SNVs and Indels reported in one file?',
                                                            c("Yes","No"),
                                                            as.character(config[69,2]),
                                                            inline = TRUE)})
                    output$snverUI7<-renderUI({conditionalPanel(
                        condition="input.snver_snv_indel=='No'",
                        textInput('snver_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[70,2])),
                        textInput('snver_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[71,2])))})
                    output$snverUI8<-renderUI({radioButtons('snver_indels',
                                                            'How are Indels reported?',
                                                            c("CA>C","C>-A",
                                                              "CAAAC>CAAC"),
                                                            selected=as.character(config[72,2]),
                                                            inline = TRUE)})
                }
                if(is.na(as.character(config[61,2]))){
                    output$snverUI1<-renderUI({NULL})
                    output$snverUI2<-renderUI({NULL})
                    output$snverUI3<-renderUI({NULL})
                    output$snverUI4<-renderUI({NULL})
                    output$snverUI5<-renderUI({NULL})
                    output$snverUI6<-renderUI({NULL})
                    output$snverUI7<-renderUI({NULL})
                    output$snverUI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[73,2]))){
                    output$samtoolsUI1<-renderUI({textInput('samtools_folder',
                                                            'Variant calling results',
                                                            as.character(config[73,2]))})
                    output$samtoolsUI2<-renderUI({radioButtons('samtools_file_type',
                                                               "Output file type",
                                                               c(".vcf",".txt"),
                                                               as.character(config[74,2]),
                                                               inline=TRUE)})
                    output$samtoolsUI3<-renderUI({
                        conditionalPanel(
                            condition="input.samtools_file_type=='.txt'",
                            numericInput('samtools_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[75,2])),
                            numericInput('samtools_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[76,2])),
                            numericInput('samtools_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[77,2])),
                            numericInput('samtools_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[78,2])))})
                    output$samtoolsUI4<-renderUI({textInput('samtools_file_names_add',
                                                            'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                            as.character(config[79,2]))})
                    output$samtoolsUI5<-renderUI({radioButtons('samtools_mnvs',
                                                               'MNVs reported?',
                                                               c("Yes","No"),
                                                               as.character(config[80,2]),
                                                               inline = TRUE)})
                    output$samtoolsUI6<-renderUI({radioButtons('samtools_snv_indel',
                                                               'SNVs and Indels reported in one file?',
                                                               c("Yes","No"),
                                                               as.character(config[81,2]),
                                                               inline = TRUE)})
                    output$samtoolsUI7<-renderUI({conditionalPanel(
                        condition="input.samtools_snv_indel=='No'",
                        textInput('samtools_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[82,2])),
                        textInput('samtools_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[83,2])))})
                    output$samtoolsUI8<-renderUI({radioButtons('samtools_indels',
                                                               'How are Indels reported?',
                                                               c("CA>C","C>-A",
                                                                 "CAAAC>CAAC"),
                                                               selected=as.character(config[84,2]),
                                                               inline = TRUE)})
                }
                if(is.na(as.character(config[73,2]))){
                    output$samtoolsUI1<-renderUI({NULL})
                    output$samtoolsUI2<-renderUI({NULL})
                    output$samtoolsUI3<-renderUI({NULL})
                    output$samtoolsUI4<-renderUI({NULL})
                    output$samtoolsUI5<-renderUI({NULL})
                    output$samtoolsUI6<-renderUI({NULL})
                    output$samtoolsUI7<-renderUI({NULL})
                    output$samtoolsUI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[85,2]))){
                    output$vardictUI1<-renderUI({textInput('vardict_folder',
                                                           'Variant calling results',
                                                           as.character(config[85,2]))})
                    output$vardictUI2<-renderUI({radioButtons('vardict_file_type',
                                                              "Output file type",
                                                              c(".vcf",".txt"),
                                                              as.character(config[86,2]),
                                                              inline=TRUE)})
                    output$vardictUI3<-renderUI({
                        conditionalPanel(
                            condition="input.vardict_file_type=='.txt'",
                            numericInput('vardict_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[87,2])),
                            numericInput('vardict_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[88,2])),
                            numericInput('vardict_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[89,2])),
                            numericInput('vardict_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[90,2])))})
                    output$vardictUI4<-renderUI({textInput('vardict_file_names_add',
                                                           'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                           as.character(config[91,2]))})
                    output$vardictUI5<-renderUI({radioButtons('vardict_mnvs',
                                                              'MNVs reported?',
                                                              c("Yes","No"),
                                                              as.character(config[92,2]),
                                                              inline = TRUE)})
                    output$vardictUI6<-renderUI({radioButtons('vardict_snv_indel',
                                                              'SNVs and Indels reported in one file?',
                                                              c("Yes","No"),
                                                              as.character(config[93,2]),
                                                              inline = TRUE)})
                    output$vardictUI7<-renderUI({conditionalPanel(
                        condition="input.vardict_snv_indel=='No'",
                        textInput('vardict_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[94,2])),
                        textInput('vardict_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[95,2])))})
                    output$vardictUI8<-renderUI({radioButtons('vardict_indels',
                                                              'How are Indels reported?',
                                                              c("CA>C","C>-A",
                                                                "CAAAC>CAAC"),
                                                              selected=as.character(config[96,2]),
                                                              inline = TRUE)})
                }
                if(is.na(as.character(config[85,2]))){
                    output$vardictUI1<-renderUI({NULL})
                    output$vardictUI2<-renderUI({NULL})
                    output$vardictUI3<-renderUI({NULL})
                    output$vardictUI4<-renderUI({NULL})
                    output$vardictUI5<-renderUI({NULL})
                    output$vardictUI6<-renderUI({NULL})
                    output$vardictUI7<-renderUI({NULL})
                    output$vardictUI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[97,2]))){
                    output$caller1UI0<-renderUI({h4(as.character(config[97,2]))})
                    output$caller1UI0.1<-renderUI({textInput('caller1_name',
                                                             'Name of caller 1',
                                                             as.character(config[98,2]))})
                    output$caller1UI1<-renderUI({textInput('caller1_folder',
                                                           'Variant calling results',
                                                           as.character(config[99,2]))})
                    output$caller1UI2<-renderUI({radioButtons('caller1_file_type',
                                                              "Output file type",
                                                              c(".vcf",".txt"),
                                                              as.character(config[100,2]),
                                                              inline=TRUE)})
                    output$caller1UI3<-renderUI({
                        conditionalPanel(
                            condition="input.caller1_file_type=='.txt'",
                            numericInput('caller1_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[101,2])),
                            numericInput('caller1_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[102,2])),
                            numericInput('caller1_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[103,2])),
                            numericInput('caller1_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[104,2])))})
                    output$caller1UI4<-renderUI({textInput('caller1_file_names_add',
                                                           'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                           as.character(config[105,2]))})
                    output$caller1UI5<-renderUI({radioButtons('caller1_mnvs',
                                                              'MNVs reported?',
                                                              c("Yes","No"),
                                                              as.character(config[106,2]),
                                                              inline = TRUE)})
                    output$caller1UI6<-renderUI({radioButtons('caller1_snv_indel',
                                                              'SNVs and Indels reported in one file?',
                                                              c("Yes","No"),
                                                              as.character(config[107,2]),
                                                              inline = TRUE)})
                    output$caller1UI7<-renderUI({conditionalPanel(
                        condition="input.caller1_snv_indel=='No'",
                        textInput('caller1_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[108,2])),
                        textInput('caller1_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[109,2])))})
                    output$caller1UI8<-renderUI({radioButtons('caller1_indels',
                                                              'How are Indels reported?',
                                                              c("CA>C","C>-A",
                                                                "CAAAC>CAAC"),
                                                              selected=as.character(config[110,2]),
                                                              inline = TRUE)})
                }
                if(is.na(as.character(config[97,2]))){
                    output$caller1UI0<-renderUI({NULL})
                    output$caller1UI0.1<-renderUI({NULL})
                    output$caller1UI1<-renderUI({NULL})
                    output$caller1UI2<-renderUI({NULL})
                    output$caller1UI3<-renderUI({NULL})
                    output$caller1UI4<-renderUI({NULL})
                    output$caller1UI5<-renderUI({NULL})
                    output$caller1UI6<-renderUI({NULL})
                    output$caller1UI7<-renderUI({NULL})
                    output$caller1UI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[111,2]))){
                    output$caller2UI0<-renderUI({h4(as.character(config[111,2]))})
                    output$caller2UI0.1<-renderUI({textInput('caller2_name',
                                                             'Name of caller 1',
                                                             as.character(config[112,2]))})
                    output$caller2UI1<-renderUI({textInput('caller2_folder',
                                                           'Variant calling results',
                                                           as.character(config[113,2]))})
                    output$caller2UI2<-renderUI({radioButtons('caller2_file_type',
                                                              "Output file type",
                                                              c(".vcf",".txt"),
                                                              as.character(config[114,2]),
                                                              inline=TRUE)})
                    output$caller2UI3<-renderUI({
                        conditionalPanel(
                            condition="input.caller2_file_type=='.txt'",
                            numericInput('caller2_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[115,2])),
                            numericInput('caller2_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[116,2])),
                            numericInput('caller2_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[117,2])),
                            numericInput('caller2_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[118,2])))})
                    output$caller2UI4<-renderUI({textInput('caller2_file_names_add',
                                                           'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                           as.character(config[119,2]))})
                    output$caller2UI5<-renderUI({radioButtons('caller2_mnvs',
                                                              'MNVs reported?',
                                                              c("Yes","No"),
                                                              as.character(config[120,2]),
                                                              inline = TRUE)})
                    output$caller2UI6<-renderUI({radioButtons('caller2_snv_indel',
                                                              'SNVs and Indels reported in one file?',
                                                              c("Yes","No"),
                                                              as.character(config[121,2]),
                                                              inline = TRUE)})
                    output$caller2UI7<-renderUI({conditionalPanel(
                        condition="input.caller2_snv_indel=='No'",
                        textInput('caller2_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[122,2])),
                        textInput('caller2_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[123,2])))})
                    output$caller2UI8<-renderUI({radioButtons('caller2_indels',
                                                              'How are Indels reported?',
                                                              c("CA>C","C>-A",
                                                                "CAAAC>CAAC"),
                                                              selected=as.character(config[124,2]),
                                                              inline = TRUE)})
                }
                if(is.na(as.character(config[111,2]))){
                    output$caller2UI0<-renderUI({NULL})
                    output$caller2UI0.1<-renderUI({NULL})
                    output$caller2UI1<-renderUI({NULL})
                    output$caller2UI2<-renderUI({NULL})
                    output$caller2UI3<-renderUI({NULL})
                    output$caller2UI4<-renderUI({NULL})
                    output$caller2UI5<-renderUI({NULL})
                    output$caller2UI6<-renderUI({NULL})
                    output$caller2UI7<-renderUI({NULL})
                    output$caller2UI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[125,2]))){
                    output$caller3UI0<-renderUI({h4(as.character(config[125,2]))})
                    output$caller3UI0.1<-renderUI({textInput('caller3_name',
                                                             'Name of caller 1',
                                                             as.character(config[126,2]))})
                    output$caller3UI1<-renderUI({textInput('caller3_folder',
                                                           'Variant calling results',
                                                           as.character(config[127,2]))})
                    output$caller3UI2<-renderUI({radioButtons('caller3_file_type',
                                                              "Output file type",
                                                              c(".vcf",".txt"),
                                                              as.character(config[128,2]),
                                                              inline=TRUE)})
                    output$caller3UI3<-renderUI({
                        conditionalPanel(
                            condition="input.caller3_file_type=='.txt'",
                            numericInput('caller3_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[129,2])),
                            numericInput('caller3_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[130,2])),
                            numericInput('caller3_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[131,2])),
                            numericInput('caller3_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[132,2])))})
                    output$caller3UI4<-renderUI({textInput('caller3_file_names_add',
                                                           'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                           as.character(config[133,2]))})
                    output$caller3UI5<-renderUI({radioButtons('caller3_mnvs',
                                                              'MNVs reported?',
                                                              c("Yes","No"),
                                                              as.character(config[134,2]),
                                                              inline = TRUE)})
                    output$caller3UI6<-renderUI({radioButtons('caller3_snv_indel',
                                                              'SNVs and Indels reported in one file?',
                                                              c("Yes","No"),
                                                              as.character(config[135,2]),
                                                              inline = TRUE)})
                    output$caller3UI7<-renderUI({conditionalPanel(
                        condition="input.caller3_snv_indel=='No'",
                        textInput('caller3_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[136,2])),
                        textInput('caller3_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[137,2])))})
                    output$caller3UI8<-renderUI({radioButtons('caller3_indels',
                                                              'How are Indels reported?',
                                                              c("CA>C","C>-A",
                                                                "CAAAC>CAAC"),
                                                              selected=as.character(config[138,2]),
                                                              inline = TRUE)})
                }
                if(is.na(as.character(config[125,2]))){
                    output$caller3UI0<-renderUI({NULL})
                    output$caller3UI0.1<-renderUI({NULL})
                    output$caller3UI1<-renderUI({NULL})
                    output$caller3UI2<-renderUI({NULL})
                    output$caller3UI3<-renderUI({NULL})
                    output$caller3UI4<-renderUI({NULL})
                    output$caller3UI5<-renderUI({NULL})
                    output$caller3UI6<-renderUI({NULL})
                    output$caller3UI7<-renderUI({NULL})
                    output$caller3UI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[139,2]))){
                    output$caller4UI0<-renderUI({h4(as.character(config[139,2]))})
                    output$caller4UI0.1<-renderUI({textInput('caller4_name',
                                                             'Name of caller 1',
                                                             as.character(config[140,2]))})
                    output$caller4UI1<-renderUI({textInput('caller4_folder',
                                                           'Variant calling results',
                                                           as.character(config[141,2]))})
                    output$caller4UI2<-renderUI({radioButtons('caller4_file_type',
                                                              "Output file type",
                                                              c(".vcf",".txt"),
                                                              as.character(config[142,2]),
                                                              inline=TRUE)})
                    output$caller4UI3<-renderUI({
                        conditionalPanel(
                            condition="input.caller4_file_type=='.txt'",
                            numericInput('caller4_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[143,2])),
                            numericInput('caller4_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[144,2])),
                            numericInput('caller4_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[145,2])),
                            numericInput('caller4_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[146,2])))})
                    output$caller4UI4<-renderUI({textInput('caller4_file_names_add',
                                                           'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                           as.character(config[147,2]))})
                    output$caller4UI5<-renderUI({radioButtons('caller4_mnvs',
                                                              'MNVs reported?',
                                                              c("Yes","No"),
                                                              as.character(config[148,2]),
                                                              inline = TRUE)})
                    output$caller4UI6<-renderUI({radioButtons('caller4_snv_indel',
                                                              'SNVs and Indels reported in one file?',
                                                              c("Yes","No"),
                                                              as.character(config[149,2]),
                                                              inline = TRUE)})
                    output$caller4UI7<-renderUI({conditionalPanel(
                        condition="input.caller4_snv_indel=='No'",
                        textInput('caller4_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[150,2])),
                        textInput('caller4_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[151,2])))})
                    output$caller4UI8<-renderUI({radioButtons('caller4_indels',
                                                              'How are Indels reported?',
                                                              c("CA>C","C>-A",
                                                                "CAAAC>CAAC"),
                                                              selected=as.character(config[152,2]),
                                                              inline = TRUE)})
                }
                if(is.na(as.character(config[139,2]))){
                    output$caller4UI0<-renderUI({NULL})
                    output$caller4UI0.1<-renderUI({NULL})
                    output$caller4UI1<-renderUI({NULL})
                    output$caller4UI2<-renderUI({NULL})
                    output$caller4UI3<-renderUI({NULL})
                    output$caller4UI4<-renderUI({NULL})
                    output$caller4UI5<-renderUI({NULL})
                    output$caller4UI6<-renderUI({NULL})
                    output$caller4UI7<-renderUI({NULL})
                    output$caller4UI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[153,2]))){
                    output$caller5UI0<-renderUI({h4(as.character(config[153,2]))})
                    output$caller5UI0.1<-renderUI({textInput('caller5_name',
                                                             'Name of caller 1',
                                                             as.character(config[154,2]))})
                    output$caller5UI1<-renderUI({textInput('caller5_folder',
                                                           'Variant calling results',
                                                           as.character(config[155,2]))})
                    output$caller5UI2<-renderUI({radioButtons('caller5_file_type',
                                                              "Output file type",
                                                              c(".vcf",".txt"),
                                                              as.character(config[156,2]),
                                                              inline=TRUE)})
                    output$caller5UI3<-renderUI({
                        conditionalPanel(
                            condition="input.caller5_file_type=='.txt'",
                            numericInput('caller5_chr',
                                         "In which column do you find Chr?",
                                         min = 1,max=20,
                                         value=as.numeric(config[157,2])),
                            numericInput('caller5_pos',
                                         "In which column do you find Pos?",
                                         min = 1,max=20,
                                         value=as.numeric(config[158,2])),
                            numericInput('caller5_ref',
                                         "In which column do you find Ref?",
                                         min = 1,max=20,
                                         value=as.numeric(config[159,2])),
                            numericInput('caller5_alt',
                                         "In which column do you find Alt?",
                                         min = 1,max=20,
                                         value=as.numeric(config[160,2])))})
                    output$caller5UI4<-renderUI({textInput('caller5_file_names_add',
                                                           'Suffix for naming output? (e.g. \'_rawCalls\' for \'Sample1_rawCalls.vcf)\'',
                                                           as.character(config[161,2]))})
                    output$caller5UI5<-renderUI({radioButtons('caller5_mnvs',
                                                              'MNVs reported?',
                                                              c("Yes","No"),
                                                              as.character(config[162,2]),
                                                              inline = TRUE)})
                    output$caller5UI6<-renderUI({radioButtons('caller5_snv_indel',
                                                              'SNVs and Indels reported in one file?',
                                                              c("Yes","No"),
                                                              as.character(config[163,2]),
                                                              inline = TRUE)})
                    output$caller5UI7<-renderUI({conditionalPanel(
                        condition="input.caller5_snv_indel=='No'",
                        textInput('caller5_snv_names_add',
                                  'Suffix for SNV files? (e.g. \'_SNVs\' for \'Sample1_SNVs.vcf\')',
                                  as.character(config[164,2])),
                        textInput('caller5_indel_names_add',
                                  'Suffix for Indel files? (e.g. \'_Indels\' for \'Sample1_Indels.vcf\')',
                                  as.character(config[165,2])))})
                    output$caller5UI8<-renderUI({radioButtons('caller5_indels',
                                                              'How are Indels reported?',
                                                              c("CA>C","C>-A",
                                                                "CAAAC>CAAC"),
                                                              selected=as.character(config[166,2]),
                                                              inline = TRUE)})
                }
                if(is.na(as.character(config[153,2]))){
                    output$caller5UI0<-renderUI({NULL})
                    output$caller5UI0.1<-renderUI({NULL})
                    output$caller5UI1<-renderUI({NULL})
                    output$caller5UI2<-renderUI({NULL})
                    output$caller5UI3<-renderUI({NULL})
                    output$caller5UI4<-renderUI({NULL})
                    output$caller5UI5<-renderUI({NULL})
                    output$caller5UI6<-renderUI({NULL})
                    output$caller5UI7<-renderUI({NULL})
                    output$caller5UI8<-renderUI({NULL})
                }

                if(!is.na(as.character(config[167,2]))){
                    output$locationsUI<-renderUI({checkboxGroupInput("locations",
                                                                     "What are the locations you are interested in?",
                                                                     c("coding",
                                                                       "intron",
                                                                       "threeUTR",
                                                                       "fiveUTR",
                                                                       "intergenic",
                                                                       "spliceSite",
                                                                       "promoter"),
                                                                     strsplit(as.character(config[167,2]),split=",")[[1]],
                                                                     inline=TRUE)})
                }
                if(is.na(as.character(config[167,2]))){
                    output$locationsUI<-renderUI({checkboxGroupInput("locations",
                                                                     "What are the locations you are interested in?",
                                                                     c("coding",
                                                                       "intron",
                                                                       "threeUTR",
                                                                       "fiveUTR",
                                                                       "intergenic",
                                                                       "spliceSite",
                                                                       "promoter"),
                                                                     c("coding"),
                                                                     inline=TRUE)})
                }

                if(!is.na(as.character(config[168,2]))){
                    output$consequencesUI<-renderUI({checkboxGroupInput("consequences",
                                                                        "What kind of variants are you interested in? (coding only)",
                                                                        c("synonymous",
                                                                          "nonsynonymous",
                                                                          "frameshift",
                                                                          "nonsense",
                                                                          "not translated"),
                                                                        strsplit(as.character(config[168,2]),split=",")[[1]],
                                                                        inline=TRUE)})
                }
                if(is.na(as.character(config[168,2]))){
                    output$consequencesUI<-renderUI({checkboxGroupInput("consequences",
                                                                        "What kind of variants are you interested in? (coding only)",
                                                                        c("synonymous",
                                                                          "nonsynonymous",
                                                                          "frameshift",
                                                                          "nonsense","not translated"),
                                                                        c("nonsynonymous",
                                                                          "frameshift",
                                                                          "nonsense"),
                                                                        inline=TRUE)})
                }
                output$bam_folderUI<-renderUI({textInput('bam_folder',
                                                         'Define folder containing bam- and bai files',
                                                         as.character(config[169,2]))})
                output$dpUI<-renderUI({numericInput("dp",
                                                    "Minimum coverage [10;9999]",
                                                    value=as.numeric(config[170,2]),
                                                    min=10,max=9999)})
                output$nr_altUI<-renderUI({numericInput("nr_alt",
                                                        "Minimum number of reads carrying the alternate allele [3;9999]",
                                                        value=as.numeric(config[171,2]),
                                                        min=3,max=9999)})
                output$vafUI<-renderUI({sliderInput("vaf",
                                                    "Minimum allele frequency [%]",
                                                    min=1,max=100,
                                                    value=as.numeric(config[172,2]))})
                output$bqUI<-renderUI({numericInput("bq",
                                                    "Minimum base quality [0;36]",
                                                    value=as.numeric(config[173,2]),
                                                    min=0,max=36)})
                output$bq_diffUI<-renderUI({numericInput("bq_diff",
                                                         "Maximum difference between Ref_BQ and Alt_BQ [0;36]",
                                                         value=as.numeric(config[174,2]),
                                                         min=0,max=36)})
                output$dbSNPUI<-renderUI({checkboxInput("dbSNP",
                                                        "Consider dbSNP? (Hsapiens.dbSNP144.GRCh37 and XtraSNPlocs.Hsapiens.dbSNP144.GRCh37)",
                                                        value=as.character(config[175,2])=="TRUE")})
                output$"1kgenomesUI"<-renderUI({checkboxInput("1kgenomes",
                                                              "Consider 1000 Genomes? (MafDb.1Kgenomes.phase3.hs37d5)",
                                                              value=as.character(config[176,2])=="TRUE")})
                output$exacUI<-renderUI({checkboxInput("exac",
                                                       "Consider ExAC? (MafDb.ExAC.r1.0.hs37d5)",
                                                       value=as.character(config[177,2])=="TRUE")})
                output$espUI<-renderUI({checkboxInput("esp",
                                                      "Consider ESP6500? (MafDb.ESP6500SI.V2.SSA137.hs37d5)",
                                                      value=as.character(config[178,2])=="TRUE")})
                output$gadUI<-renderUI({checkboxInput("gad",
                                                      "Consider Genome Aggregation Database? (MafDb.gnomADex.r2.1.hs37d5)",
                                                      value=as.character(config[179,2])=="TRUE")})
                output$cosmicUI<-renderUI({checkboxInput("cosmic",
                                                         "Consider COSMIC? (COSMIC.67)",
                                                         value=as.character(config[180,2])=="TRUE")})
                output$clinvarUI<-renderUI({checkboxInput("clinvar",
                                                          "Consider ClinVar? (rentrez)",
                                                          value=as.character(config[181,2])=="TRUE")})
                output$predictUI<-renderUI({radioButtons("predict",
                                                         "What source would you like to use for impact prediction?",
                                                         c("SIFT","Provean","PolyPhen2"),
                                                         as.character(config[182,2]),
                                                         inline=TRUE)})
                output$stricter_thresholdsUI<-renderUI({radioButtons('stricter_thresholds',
                                                                     "Do you want to define stricter thresholds for coverage and base quality?",
                                                                     c("Yes",
                                                                       "No"),
                                                                     as.character(config[183,2]),
                                                                     inline=TRUE)})
                if(as.character(config[183,2])=="Yes"){
                    output$stricter_thresholdsUI2<-renderUI({conditionalPanel(
                        condition="input.stricter_thresholds=='Yes'",
                        numericInput("dp2","Minimum coverage [10;9999]",
                                     value=as.numeric(config[184,2]),
                                     min=10,max=9999),
                        numericInput("nr_alt2",
                                     "Minimum number of reads carrying the alternate allele [3;9999]",
                                     value=as.numeric(config[185,2]),
                                     min=3,max=9999),
                        sliderInput("vaf2","Minimum allele frequency [%]",
                                    min=1,max=100,
                                    value=as.numeric(config[186,2])),
                        numericInput("bq2","Minimum base quality [0;36]",
                                     value=as.numeric(config[187,2]),
                                     min=0,max=36),
                        numericInput("bq_diff2",
                                     "Maximum difference between Ref_BQ and Alt_BQ [0;36]",
                                     value=as.numeric(config[188,2]),
                                     min=0,max=36)
                    )})
                }
                if(as.character(config[183,2]=="No")){
                    output$stricter_thresholdsUI2<-renderUI({NULL})
                }
                output$nr_samplesUI<-renderUI({numericInput("nr_samples",
                                                            "Detection in more than how many samples makes a call striking?",
                                                            value=as.numeric(config[189,2]),
                                                            min=1,max=9999)})
                if(as.character(config[182,2])=="SIFT"){
                    output$predictionUI1<-renderUI({conditionalPanel(
                        condition="input.predict=='SIFT'",
                        sliderInput("damaging_safe1",
                                    "SIFT: When is a damaging prediction reliable? (internal threshold <=0.05)",
                                    min=0,max=1.0,
                                    value=as.numeric(config[190,2])),
                        sliderInput("tolerated_safe1",
                                    "SIFT: When is a tolerated prediction reliable? (internal threshold >0.05)",
                                    min=0,max=1.0,
                                    value=as.numeric(config[191,2]))
                    )})
                }
                if(as.character(config[182,2])!="SIFT"){
                    output$predictionUI1<-renderUI({NULL})
                }
                if(as.character(config[182,2])=="Provean"){
                    output$predictionUI2<-renderUI({conditionalPanel(
                        condition="input.predict=='Provean'",
                        sliderInput("damaging_safe2",
                                    "Provean: When is a damaging prediction reliable? (internal threshold <=-2.5)",
                                    min=-20,max=10,
                                    value=as.numeric(config[192,2])),
                        sliderInput("tolerated_safe2",
                                    "Provean: When is a tolerated prediction reliable? (internal threshold >-2.5)",
                                    min=-20,max=10,
                                    value=as.numeric(config[193,2]))
                    )})
                }
                if(as.character(config[182,2])!="Provean"){
                    output$predictionUI2<-renderUI({NULL})
                }
                if(as.character(config[182,2])=="PolyPhen2"){
                    output$predictionUI1<-renderUI({conditionalPanel(
                        condition="input.predict=='PolyPhen2'",
                        sliderInput("damaging_safe3",
                                    "PolyPhen2: When is a damaging prediction reliable? (>=0.5)",
                                    min=0,max=1,
                                    value=as.numeric(config[194,2])),
                        sliderInput("tolerated_safe3",
                                    "PolyPhen2: When is a tolerated prediction reliable? (<0.5)",
                                    min=0,max=1,
                                    value=as.numeric(config[195,2]))
                    )})
                }
                if(as.character(config[182,2])!="PolyPhen2"){
                    output$predictionUI3<-renderUI({NULL})
                }
                output$artifact_scoreUI<-renderUI({radioButtons('artifact_score',
                                                                "Would you like to change the default scoring for the artifact score?",
                                                                c("Yes","No"),
                                                                config[196,2],
                                                                inline=TRUE)})
                if(as.character(config[196,2])=="Yes"){
                    output$artifact_scoreUI2<-renderUI({conditionalPanel(
                        condition="input.artifact_score=='Yes'",
                        h4(as.character(config[197,2])),
                        h5(as.character(config[198,2])),
                        h5(as.character(config[199,2])),
                        sliderInput("PolymorphismVAF10",
                                    "Polymorphism (based on polymorphism score) AND VAF<10%",
                                    min=-5,max=5,
                                    value=as.numeric(config[200,2])),
                        sliderInput("BQ_AltMean",
                                    "BQ_Alt<(mean(BQ_Alt)-3*sd(BQ_Alt))",
                                    min=-5,max=5,
                                    value=as.numeric(config[201,2])),
                        sliderInput("detectedHigh",
                                    "Detected in >50% of all samples",
                                    min=-5,max=5,
                                    value=as.numeric(config[202,2])),
                        sliderInput("detectedLow",
                                    "Detected in a striking number of samples",
                                    min=-5,max=5,
                                    value=as.numeric(config[203,2])),
                        sliderInput("detectedLowVAF",
                                    "Detected in a striking number of samples AND VAF>85%",
                                    min=-5,max=5,
                                    value=as.numeric(config[204,2])),
                        sliderInput("vafLow","VAF<2%",min=-5,max=5,
                                    value=as.numeric(config[205,2])),
                        sliderInput("PolymorphismVAF20",
                                    "Polymorphism (based on polymorphism score) AND VAF<20%",
                                    min=-5,max=5,
                                    value=as.numeric(config[206,2])),
                        sliderInput("PolymorphismFrame",
                                    "Polymorphism (based on polymorphism score) AND frameshift",
                                    min=-5,max=5,
                                    value=as.numeric(config[207,2])),
                        sliderInput("isIndel","Indel",min=-5,max=5,
                                    value=as.numeric(config[208,2])),
                        sliderInput("isIndelVAF",
                                    "Indel AND VAF<5%",min=-5,max=5,
                                    value=as.numeric(config[209,2])),
                        sliderInput("noPrimerP",
                                    "No primer (information) AND p<0.001",
                                    min=-5,max=5,
                                    value=as.numeric(config[210,2])),
                        sliderInput("noPrimerPFwd",
                                    "No primer (information) AND p>=0.001 AND Nr_Ref_fwd>=(Min_DP-Min_Alt)/2 AND Nr_Alt_fwd<=2",
                                    min=-5,max=5,
                                    value=as.numeric(config[211,2])),
                        sliderInput("noPrimerPRev",
                                    "No primer (information) AND p>=0.001 AND Nr_Ref_rev>=(Min_DP-Min_Alt)/2 AND Nr_Alt_rev<=2",
                                    min=-5,max=5,
                                    value=as.numeric(config[212,2])),
                        sliderInput("databaseVAF",
                                    "No database AND VAF<10%",
                                    min=-5,max=5,
                                    value=as.numeric(config[213,2])),
                        sliderInput("databaseHigh",
                                    "No database AND detected in >50% of all samples",
                                    min=-5,max=5,
                                    value=as.numeric(config[214,2])),
                        sliderInput("predictionVAF",
                                    "Reliable tolerated prediction AND (VAF<35% OR 65%<VAF<85%)",
                                    min=-5,max=5,
                                    value=as.numeric(config[215,2])),
                        sliderInput("oneCaller",
                                    "Reported by only 1 caller",
                                    min=-5,max=5,
                                    value=as.numeric(config[216,2])),
                        sliderInput("primerLocation",
                                    "Primer-location",
                                    min=-5,max=5,
                                    value=as.numeric(config[217,2])),
                        sliderInput("primerPAlt",
                                    "No primer (information) AND p<0.001 AND Nr_Alt_rev>=Min_Alt/2 AND Nr_Alt_rev>=Min_Alt/2",
                                    min=-5,max=5,
                                    value=as.numeric(config[218,2])),
                        sliderInput("primerPFwd",
                                    "No primer (information) AND p<0.001 AND Nr_Ref_fwd<(Min_DP-Min_Alt)/2 AND Nr_Alt_fwd<=2",
                                    min=-5,max=5,
                                    value=as.numeric(config[219,2])),
                        sliderInput("primerPRev",
                                    "No primer (information) AND p<0.001 AND Nr_Ref_rev<(Min_DP-Min_Alt)/2 AND Nr_Alt_rev<=2",
                                    min=-5,max=5,
                                    value=as.numeric(config[220,2])),
                        sliderInput("predictionSafe",
                                    "Reliable damaging prediction",
                                    min=-5,max=5,
                                    value=as.numeric(config[221,2])),
                        numericInput("nrcaller4",
                                     "Intermediate number of callers to report the same variant [1;14]",
                                     min=1,max=14,
                                     value=as.numeric(config[222,2])),
                        sliderInput("reward4","Score",min=-5,max=5,
                                    value=as.numeric(config[223,2])),
                        numericInput("nrcaller5",
                                     "High number of callers to report the same variant [1;14]",
                                     min=1,max=14,value=as.numeric(config[224,2])),
                        sliderInput("reward5","Score",min=-5,max=5,
                                    value=as.numeric(config[225,2])),
                        numericInput("nrcaller6",
                                     "Very high number of callers to report the same variant [1;14]",
                                     min=1,max=14,
                                     value=as.numeric(config[226,2])),
                        sliderInput("reward6","Score",min=-5,max=5,
                                    value=as.numeric(config[227,2])),
                        sliderInput("knownHotspot","Known hotspot",min=-5,max=5,
                                    value=as.numeric(config[228,2])),
                        checkboxGroupInput("overlapTools","Overlapping output by which tools shall be rewarded?",
                                           choices=c("GATK","Platypus","VarScan","LoFreq","FreeBayes","SNVer","SamTools","VarDict",
                                                     "Caller1","Caller2","Caller3","Caller4","Caller5"),
                                           selected=strsplit(as.character(config[229,2]),split=",")[[1]],
                                           inline=TRUE),
                        sliderInput("overlapReward","Score",min=-5,max=5,
                                    value=as.numeric(config[230,2])),
                        hr(),
                        sliderInput("artifactThreshold",
                                    "Threshold artifact score (still artifact)",
                                    min=-10,max=10,
                                    value=as.numeric(config[231,2]))
                    )})
                }
                if(as.character(config[196,2])=="No"){
                    output$artifact_scoreUI2<-renderUI({NULL})
                }
                output$polymorphism_scoreUI<-renderUI({radioButtons('polymorphism_score',
                                                                    "Would you like to change the default scoring for the polymorphism score?",
                                                                    c("Yes","No"),
                                                                    config[232,2],
                                                                    inline=TRUE)})
                if(as.character(config[232,2])=="Yes"){
                    output$polymorphism_scoreUI2<-renderUI({conditionalPanel(
                        condition="input.polymorphism_score=='Yes'",
                        h4(as.character(config[233,2])),
                        h5(as.character(config[234,2])),
                        h5(as.character(config[235,2])),
                        sliderInput("polyDetected",
                                    "Detected in a striking number of samples",
                                    min=-5,max=5,
                                    value=as.numeric(config[236,2])),
                        numericInput("polyDatabases",
                                     "High number of databases to have information on a variant [1;8]",
                                     min=1,max=8,
                                     value=as.numeric(config[237,2])),
                        sliderInput("polyDatabasesReward","Score",
                                    min=-5,max=5,
                                    value=as.numeric(config[238,2])),
                        numericInput("polyDatabasesPolyLow",
                                     "Intermediate number of polymorphism databases to have information on a variant [1;8]",
                                     min=1,max=8,
                                     value=as.numeric(config[239,2])),
                        sliderInput("polyDatabasesPolyLowReward",
                                    "Score",min=-5,max=5,
                                    value=as.numeric(config[240,2])),
                        numericInput("polyDatabasesPolyHigh",
                                     "High number of polymorphism databases to have information on a variant [1;8]",
                                     min=1,max=8,
                                     value=as.numeric(config[241,2])),
                        sliderInput("polyDatabasesPolyHighReward","Score",
                                    min=-5,max=5,
                                    value=as.numeric(config[242,2])),
                        sliderInput("polyVAF","35%<=VAF>=65% OR 85%<=VAF",
                                    min=-5,max=5,
                                    value=as.numeric(config[243,2])),
                        sliderInput("polyPrediction",
                                    "Reliable tolerated prediction",
                                    min=-5,max=5,
                                    value=as.numeric(config[244,2])),
                        sliderInput("polyEffect",
                                    "No frameshift AND no stop gained AND no stop lost",
                                    min=-5,max=5,
                                    value=as.numeric(config[245,2])),
                        sliderInput("polyDetectedOnce",
                                    "Reported by only 1 caller",min=-5,max=5,
                                    value=as.numeric(config[246,2])),
                        numericInput("polyDatabasesMut",
                                     "Critical number of mutation databases to have information on a variant [1;8]",
                                     min=1,max=8,
                                     value=as.numeric(config[247,2])),
                        sliderInput("polyDatabasesMutReward","Score",
                                    min=-5,max=5,
                                    value=as.numeric(config[248,2])),
                        sliderInput("polyNoDatabase",
                                    "Not detected in any polymorphism database",
                                    min=-5,max=5,
                                    value=as.numeric(config[249,2])),
                        sliderInput("polyPredictionEffect",
                                    "Reliable damaging prediction OR stop gained OR stop lost",
                                    min=-5,max=5,
                                    value=as.numeric(config[250,2])),
                        numericInput("polyCosmic",
                                     "Critical number of Cosmic entries [1;1000]",
                                     min=1,max=1000,
                                     value=as.numeric(config[251,2])),
                        hr(),
                        sliderInput("polyThresholdCritical",
                                    "Threshold polymorphism score if number of Cosmic entries is not critical (still polymorphism)",
                                    min=-10,max=10,
                                    value=as.numeric(config[252,2])),
                        sliderInput("polyThreshold",
                                    "Threshold polymorphism score if number of Cosmic entries is critical (still polymorphism)",
                                    min=-10,max=10,
                                    value=as.numeric(config[253,2]))
                    )})
                }
                if(as.character(config[232,2])=="No"){
                    output$polymorphism_scoreUI2<-renderUI({NULL})
                }

                output$messageUI2<-renderUI({h5("Done. Please make sure that everything is correct.")})
                return()
            })

            observeEvent(input$appreci8R,{
                log_info<-c()
                log_info[1]<-"Starting analysis with the appreci8R...<br><br>"
                output$log_info<-renderUI({HTML(log_info)})

                #check if input really exists
                if(file.exists(input$output_folder)==FALSE){
                    log_info<-c(log_info,
                                "Your output folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(!is.null(input$gatk_folder)&&
                   file.exists(input$gatk_folder)==FALSE){
                    log_info<-c(log_info,
                                "You want to analyze GATK output, but the folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(!is.null(input$platypus_folder)&&
                   file.exists(input$platypus_folder)==FALSE){
                    log_info<-c(log_info,
                                "You want to analyze Platypus output, but the folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(!is.null(input$varscan_folder)&&
                   file.exists(input$varscan_folder)==FALSE){
                    log_info<-c(log_info,
                                "You want to analyze VarScan output, but the folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(!is.null(input$freebayes_folder)&&
                   file.exists(input$freebayes_folder)==FALSE){
                    log_info<-c(log_info,"You want to analyze FreeBayes output, but the folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(!is.null(input$lofreq_folder)&&
                   file.exists(input$lofreq_folder)==FALSE){
                    log_info<-c(log_info,
                                "You want to analyze LoFreq output, but the folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(!is.null(input$snver_folder)&&
                   file.exists(input$snver_folder)==FALSE){
                    log_info<-c(log_info,
                                "You want to analyze SNVer output, but the folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(!is.null(input$samtools_folder)&&
                   file.exists(input$samtools_folder)==FALSE){
                    log_info<-c(log_info,
                                "You want to analyze SamTools output, but the folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(!is.null(input$vardict_folder)&&
                   file.exists(input$vardict_folder)==FALSE){
                    log_info<-c(log_info,
                                "You want to analyze VarDict output, but the folder does not exist<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                #test additional callers
                if(input$nr_additional>0&&!is.null(input$caller1_folder)&&
                   file.exists(input$caller1_folder)==FALSE){
                    log_info<-c(log_info,paste("The output folder of ",
                                               input$caller1_name,
                                               " does not exist<br>",sep=""))
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(input$nr_additional>1&&!is.null(input$caller2_folder)&&
                   file.exists(input$caller2_folder)==FALSE){
                    log_info<-c(log_info,paste("The output folder of ",
                                               input$caller1_name,
                                               " does not exist<br>",sep=""))
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(input$nr_additional>2&&!is.null(input$caller3_folder)&&
                   file.exists(input$caller3_folder)==FALSE){
                    log_info<-c(log_info,paste("The output folder of ",
                                               input$caller1_name,
                                               " does not exist<br>",sep=""))
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(input$nr_additional>3&&!is.null(input$caller4_folder)&&
                   file.exists(input$caller4_folder)==FALSE){
                    log_info<-c(log_info,paste("The output folder of ",
                                               input$caller1_name,
                                               " does not exist<br>",sep=""))
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                if(input$nr_additional>4&&!is.null(input$caller5_folder)&&
                   file.exists(input$caller5_folder)==FALSE){
                    log_info<-c(log_info,paste("The output folder of ",
                                               input$caller1_name,
                                               " does not exist<br>",sep=""))
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }

                if(is.null(input$gatk_folder)&&is.null(input$platypus_folder)&&
                   is.null(input$varscan_folder)&&
                   is.null(input$freebayes_folder)
                   &&is.null(input$lofreq_folder)&&is.null(input$snver_folder)&&
                   is.null(input$samtools_folder)&&is.null(input$vardict_folder)
                   &&(input$nr_additional==0||
                      (input$nr_additional>0&&sum(!is.null(input$caller1_folder),
                                                  !is.null(input$caller2_folder),
                                                  !is.null(input$caller3_folder),
                                                  !is.null(input$caller4_folder),
                                                  !is.null(input$caller5_folder))!=input$nr_additional))){
                    log_info<-c(log_info,
                                "Please select at least one variant caller<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                #1. Reading Input
                log_info<-c(log_info,"0. Reading input<br>")
                output$log_info<-renderUI({HTML(log_info)})
                progress <- shiny::Progress$new()
                progress$set(message = "0. Reading input", value = 0)
                raw_calls<-list()
                overview<-data.frame(SampleID=NA,GATK=NA,Platypus=NA,VarScan=NA,
                                     FreeBayes=NA,LoFreq=NA,SNVer=NA,
                                     SamTools=NA,VarDict=NA)
                if(!is.null(input$caller1_name)){
                    namen_overview<-names(overview)
                    overview<-cbind(overview,New=NA)
                    names(overview)<-c(namen_overview,input$caller1_name)
                }
                if(!is.null(input$caller2_name)){
                    namen_overview<-names(overview)
                    overview<-cbind(overview,New=NA)
                    names(overview)<-c(namen_overview,input$caller2_name)
                }
                if(!is.null(input$caller3_name)){
                    namen_overview<-names(overview)
                    overview<-cbind(overview,New=NA)
                    names(overview)<-c(namen_overview,input$caller3_name)
                }
                if(!is.null(input$caller4_name)){
                    namen_overview<-names(overview)
                    overview<-cbind(overview,New=NA)
                    names(overview)<-c(namen_overview,input$caller4_name)
                }
                if(!is.null(input$caller5_name)){
                    namen_overview<-names(overview)
                    overview<-cbind(overview,New=NA)
                    names(overview)<-c(namen_overview,input$caller5_name)
                }
                included_callers<-rep(NA,13)

                progress$inc(1/13)
                raw_calls[[1]]<-list()
                if(!is.null(input$gatk_folder)){
                    included_callers[1]<-"GATK"
                    raw_calls[[1]]<-readInput(input$gatk_folder,
                                              input$gatk_file_names_add,
                                              input$gatk_file_type,
                                              input$gatk_snv_indel,
                                              input$gatk_snv_names_add,
                                              input$gatk_indel_names_add,
                                              input$gatk_chr,input$gatk_pos,
                                              input$gatk_ref,input$gatk_alt)
                    sampleNameTest<-getSampleNames(input$gatk_folder,
                                                   input$gatk_file_names_add,
                                                   input$gatk_file_type,
                                                   input$gatk_snv_indel,
                                                   input$gatk_snv_names_add,
                                                   input$gatk_indel_names_add)
                }
                if(is.null(input$gatk_folder)){
                    sampleNameTest<-NA
                }
                progress$inc(1/13)
                raw_calls[[2]]<-list()
                if(!is.null(input$platypus_folder)){
                    included_callers[2]<-"Platypus"
                    raw_calls[[2]]<-readInput(input$platypus_folder,
                                              input$platypus_file_names_add,
                                              input$platypus_file_type,
                                              input$platypus_snv_indel,
                                              input$platypus_snv_names_add,
                                              input$platypus_indel_names_add,
                                              input$platypus_chr,
                                              input$platypus_pos,
                                              input$platypus_ref,
                                              input$platypus_alt)
                    sampleNameTest<-cbind(sampleNameTest,
                                          getSampleNames(input$platypus_folder,
                                                         input$platypus_file_names_add,
                                                         input$platypus_file_type,
                                                         input$platypus_snv_indel,
                                                         input$platypus_snv_names_add,
                                                         input$platypus_indel_names_add))
                }
                progress$inc(1/13)
                raw_calls[[3]]<-list()
                if(!is.null(input$varscan_folder)){
                    included_callers[3]<-"VarScan"
                    raw_calls[[3]]<-readInput(input$varscan_folder,
                                              input$varscan_file_names_add,
                                              input$varscan_file_type,
                                              input$varscan_snv_indel,
                                              input$varscan_snv_names_add,
                                              input$varscan_indel_names_add,
                                              input$varscan_chr,
                                              input$varscan_pos,
                                              input$varscan_ref,
                                              input$varscan_alt)
                    sampleNameTest<-cbind(sampleNameTest,
                                          getSampleNames(input$varscan_folder,
                                                         input$varscan_file_names_add,
                                                         input$varscan_file_type,
                                                         input$varscan_snv_indel,
                                                         input$varscan_snv_names_add,
                                                         input$varscan_indel_names_add))
                }
                progress$inc(1/13)
                raw_calls[[4]]<-list()
                if(!is.null(input$freebayes_folder)){
                    included_callers[4]<-"FreeBayes"
                    raw_calls[[4]]<-readInput(input$freebayes_folder,
                                              input$freebayes_file_names_add
                                              ,input$freebayes_file_type,
                                              input$freebayes_snv_indel,
                                              input$freebayes_snv_names_add,
                                              input$freebayes_indel_names_add,
                                              input$freebayes_chr,
                                              input$freebayes_pos,
                                              input$freebayes_ref,
                                              input$freebayes_alt)
                    sampleNameTest<-cbind(sampleNameTest,
                                          getSampleNames(input$freebayes_folder,
                                                         input$freebayes_file_names_add,
                                                         input$freebayes_file_type,
                                                         input$freebayes_snv_indel,
                                                         input$freebayes_snv_names_add,
                                                         input$freebayes_indel_names_add))
                }
                progress$inc(1/13)
                raw_calls[[5]]<-list()
                if(!is.null(input$lofreq_folder)){
                    included_callers[5]<-"LoFreq"
                    raw_calls[[5]]<-readInput(input$lofreq_folder,
                                              input$lofreq_file_names_add,
                                              input$lofreq_file_type,
                                              input$lofreq_snv_indel,
                                              input$lofreq_snv_names_add,
                                              input$lofreq_indel_names_add,
                                              input$lofreq_chr,
                                              input$lofreq_pos,
                                              input$lofreq_ref,
                                              input$lofreq_alt)
                    sampleNameTest<-cbind(sampleNameTest,
                                          getSampleNames(input$lofreq_folder,
                                                         input$lofreq_file_names_add,
                                                         input$lofreq_file_type,
                                                         input$lofreq_snv_indel,
                                                         input$lofreq_snv_names_add,
                                                         input$lofreq_indel_names_add))
                }
                progress$inc(1/13)
                raw_calls[[6]]<-list()
                if(!is.null(input$snver_folder)){
                    included_callers[6]<-"SNVer"
                    raw_calls[[6]]<-readInput(input$snver_folder,
                                              input$snver_file_names_add,
                                              input$snver_file_type,
                                              input$snver_snv_indel,
                                              input$snver_snv_names_add,
                                              input$snver_indel_names_add,
                                              input$snver_chr,
                                              input$snver_pos,
                                              input$snver_ref,input$snver_alt)
                    sampleNameTest<-cbind(sampleNameTest,
                                          getSampleNames(input$snver_folder,
                                                         input$snver_file_names_add,
                                                         input$snver_file_type,
                                                         input$snver_snv_indel,
                                                         input$snver_snv_names_add,
                                                         input$snver_indel_names_add))
                }
                progress$inc(1/13)
                raw_calls[[7]]<-list()
                if(!is.null(input$samtools_folder)){
                    included_callers[7]<-"SamTools"
                    raw_calls[[7]]<-readInput(input$samtools_folder,
                                              input$samtools_file_names_add,
                                              input$samtools_file_type,
                                              input$samtools_snv_indel,
                                              input$samtools_snv_names_add,
                                              input$samtools_indel_names_add,
                                              input$samtools_chr,
                                              input$samtools_pos,
                                              input$samtools_ref,
                                              input$samtools_alt)
                    sampleNameTest<-cbind(sampleNameTest,
                                          getSampleNames(input$samtools_folder,
                                                         input$samtools_file_names_add,
                                                         input$samtools_file_type,
                                                         input$samtools_snv_indel,
                                                         input$samtools_snv_names_add,
                                                         input$samtools_indel_names_add))
                }
                progress$inc(1/13)
                raw_calls[[8]]<-list()
                if(!is.null(input$vardict_folder)){
                    included_callers[8]<-"VarDict"
                    raw_calls[[8]]<-readInput(input$vardict_folder,
                                              input$vardict_file_names_add,
                                              input$vardict_file_type,
                                              input$vardict_snv_indel,
                                              input$vardict_snv_names_add,
                                              input$vardict_indel_names_add,
                                              input$vardict_chr,
                                              input$vardict_pos,
                                              input$vardict_ref,
                                              input$vardict_alt)
                    sampleNameTest<-cbind(sampleNameTest,
                                          getSampleNames(input$vardict_folder,
                                                         input$vardict_file_names_add,
                                                         input$vardict_file_type,
                                                         input$vardict_snv_indel,
                                                         input$vardict_snv_names_add,
                                                         input$vardict_indel_names_add))
                }

                if(is.null(input$caller1_folder)){
                    progress$inc(5/13)
                }
                if(!is.null(input$caller1_folder)){
                    progress$inc(1/13)
                    raw_calls[[9]]<-list()
                    included_callers[9]<-input$caller1_name
                    raw_calls[[9]]<-readInput(input$caller1_folder,
                                              input$caller1_file_names_add,
                                              input$caller1_file_type,
                                              input$caller1_snv_indel,
                                              input$caller1_snv_names_add,
                                              input$caller1_indel_names_add,
                                              input$caller1_chr,
                                              input$caller1_pos,
                                              input$caller1_ref,
                                              input$caller1_alt)
                    sampleNameTest<-cbind(sampleNameTest,
                                          getSampleNames(input$caller1_folder,
                                                         input$caller1_file_names_add,
                                                         input$caller1_file_type,
                                                         input$caller1_snv_indel,
                                                         input$caller1_snv_names_add,
                                                         input$caller1_indel_names_add))
                    if(is.null(input$caller2_folder)){
                        progress$inc(4/13)
                    }
                    if(!is.null(input$caller2_folder)){
                        progress$inc(1/13)
                        raw_calls[[10]]<-list()
                        included_callers[10]<-input$caller2_name
                        raw_calls[[10]]<-readInput(input$caller2_folder,
                                                   input$caller2_file_names_add,
                                                   input$caller2_file_type,
                                                   input$caller2_snv_indel,
                                                   input$caller2_snv_names_add,
                                                   input$caller2_indel_names_add,
                                                   input$caller2_chr,
                                                   input$caller2_pos,
                                                   input$caller2_ref,
                                                   input$caller2_alt)
                        sampleNameTest<-cbind(sampleNameTest,
                                              getSampleNames(input$caller2_folder,
                                                             input$caller2_file_names_add,
                                                             input$caller2_file_type,
                                                             input$caller2_snv_indel,
                                                             input$caller2_snv_names_add,
                                                             input$caller2_indel_names_add))
                        if(is.null(input$caller3_folder)){
                            progress$inc(3/13)
                        }
                        if(!is.null(input$caller3_folder)){
                            progress$inc(1/13)
                            raw_calls[[11]]<-list()
                            included_callers[11]<-input$caller3_name
                            raw_calls[[11]]<-readInput(input$caller3_folder,
                                                       input$caller3_file_names_add,
                                                       input$caller3_file_type,
                                                       input$caller3_snv_indel,
                                                       input$caller3_snv_names_add,
                                                       input$caller3_indel_names_add,
                                                       input$caller3_chr,
                                                       input$caller3_pos,
                                                       input$caller3_ref,
                                                       input$caller3_alt)
                            sampleNameTest<-cbind(sampleNameTest,
                                                  getSampleNames(input$caller3_folder,
                                                                 input$caller3_file_names_add,
                                                                 input$caller3_file_type,
                                                                 input$caller3_snv_indel,
                                                                 input$caller3_snv_names_add,
                                                                 input$caller3_indel_names_add))
                            if(is.null(input$caller4_folder)){
                                progress$inc(2/13)
                            }
                            if(!is.null(input$caller4_folder)){
                                progress$inc(1/13)
                                raw_calls[[12]]<-list()
                                included_callers[12]<-input$caller4_name
                                raw_calls[[12]]<-readInput(input$caller4_folder,
                                                           input$caller4_file_names_add,
                                                           input$caller4_file_type,
                                                           input$caller4_snv_indel,
                                                           input$caller4_snv_names_add,
                                                           input$caller4_indel_names_add,
                                                           input$caller4_chr,
                                                           input$caller4_pos,
                                                           input$caller4_ref,
                                                           input$caller4_alt)
                                sampleNameTest<-cbind(sampleNameTest,
                                                      getSampleNames(input$caller4_folder,
                                                                     input$caller4_file_names_add,
                                                                     input$caller4_file_type,
                                                                     input$caller4_snv_indel,
                                                                     input$caller4_snv_names_add,
                                                                     input$caller4_indel_names_add))
                                if(is.null(input$caller5_folder)){
                                    progress$inc(1/13)
                                }
                                if(!is.null(input$caller5_folder)){
                                    progress$inc(1/13)
                                    raw_calls[[13]]<-list()
                                    included_callers[13]<-input$caller5_name
                                    raw_calls[[13]]<-readInput(input$caller5_folder,
                                                               input$caller5_file_names_add,
                                                               input$caller5_file_type,
                                                               input$caller5_snv_indel,
                                                               input$caller5_snv_names_add,
                                                               input$caller5_indel_names_add,
                                                               input$caller5_chr,
                                                               input$caller5_pos,
                                                               input$caller5_ref,
                                                               input$caller5_alt)
                                    sampleNameTest<-cbind(sampleNameTest,
                                                          getSampleNames(input$caller5_folder,
                                                                         input$caller5_file_names_add,
                                                                         input$caller5_file_type,
                                                                         input$caller5_snv_indel,
                                                                         input$caller5_snv_names_add,
                                                                         input$caller5_indel_names_add))
                                }
                            }
                        }
                    }
                }

                #Test for sample names
                sampleNameTest<-as.data.frame(sampleNameTest[,!is.na(sampleNameTest[1,])])
                if(length(sampleNameTest[1,])==0){
                    log_info<-c(log_info,"Please check your input files<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                }
                if(length(sampleNameTest[1,])==1){
                    for(i in seq_along(sampleNameTest[,1])){
                        overview[i,1]<-as.character(sampleNameTest[i,1])
                    }
                    output$table <- renderDataTable(datatable(overview))
                }
                if(length(sampleNameTest[1,])>1){
                    for(i in seq_along(sampleNameTest[,1])){
                        compareSample<-sampleNameTest[i,1]
                        flag<-TRUE
                        for(j in 2:length(sampleNameTest[1,])){
                            if(compareSample!=sampleNameTest[i,j]){
                                flag<-FALSE
                            }
                            if(flag==TRUE){
                                overview[i,1]<-compareSample
                            }
                            if(flag==FALSE){
                                log_info<-c(log_info,
                                            "At least one output file is missing<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                        }
                    }
                    output$table <- renderDataTable(datatable(overview))
                }

                #Report raw calls
                for(i in seq_along(raw_calls)){
                    for(j in seq_along(overview[,1])){
                        if(length(raw_calls[[i]])>0&&
                           !is.na(raw_calls[[i]][[j]][1,2])){
                            overview[j,i+1]<-length(raw_calls[[i]][[j]][,1])
                        }
                    }
                }
                progress$close()

                #1. Target filtration
                log_info<-c(log_info,"1. Target filtration<br>")
                output$log_info<-renderUI({HTML(log_info)})
                if(is.null(input$targetRegions)){
                    log_info<-c(log_info,
                                "Please provide a target regions file<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    return()
                }
                progress <- shiny::Progress$new()
                progress$set(message = "1. Target filtration", value = 0)
                if(!is.null(input$targetRegions)){
                    for(i in seq_along(overview[,1])){
                        overview[i,1]<-as.character(overview[i,1])
                    }
                    overview2<-overview
                    overview2[c(seq_along(overview[,1])),c(2:length(overview[1,]))]<-NA
                    checkpoint<-overview
                    checkpoint[c(seq_along(overview[,1])),c(2:length(overview[1,]))]<-NA
                    target_calls<-list()
                    target_temp<-input$targetRegions
                    target<-read.table(target_temp$datapath,
                                       header=FALSE,sep="\t",
                                       stringsAsFactors=FALSE)
                    for(i in seq_along(raw_calls)){
                        progress$inc(1/length(raw_calls),
                                     detail=paste("->",
                                                  as.character(names(overview[i+1]))))
                        target_calls[[i]]<-list()
                        if(length(raw_calls[[i]])>0){
                            for(j in seq_along(overview[,1])){
                                checkpoint[j,i+1]<-1
                                if(!is.na(raw_calls[[i]][[j]][1,2])){
                                    include<-rep(FALSE,length(raw_calls[[i]][[j]][,1]))
                                    for(k in seq_along(raw_calls[[i]][[j]][,1])){
                                        flag1<-as.character(raw_calls[[i]][[j]][k,2])==as.character(target[,1])
                                        flag2<-raw_calls[[i]][[j]][k,3]>target[,2]
                                        flag3<-raw_calls[[i]][[j]][k,3]<=target[,3]
                                        if(sum(rowSums(cbind(flag1,flag2,flag3))==3)>0){
                                            include[k]<-TRUE
                                        }
                                    }
                                    target_calls[[i]][[j]]<-raw_calls[[i]][[j]][include,]
                                    names(target_calls[[i]][[j]])<-c("SampleID",
                                                                     "Chr",
                                                                     "Pos",
                                                                     "Ref",
                                                                     "Alt")
                                    write.table(target_calls[[i]][[j]],
                                                paste(input$output_folder,"/",
                                                      as.character(names(overview)[i+1]),
                                                      ".",overview[j,1],
                                                      ".target.txt",sep=""),
                                                row.names=FALSE,quote=FALSE,sep="\t")
                                    overview2[j,i+1]<-length(target_calls[[i]][[j]][,1])
                                }
                                if(is.na(raw_calls[[i]][[j]][1,2])){
                                    noCallsAvailable<-data.frame(noCalls=NA)
                                    write.table(noCallsAvailable,
                                                paste(input$output_folder,"/",
                                                      as.character(names(overview)[i+1]),
                                                      ".",overview[j,1],
                                                      ".target.txt",sep=""),
                                                row.names=FALSE,quote=FALSE,sep="\t")
                                }
                            }
                        }
                    }
                    output$table2 <- renderDataTable(datatable(overview2))
                    write.table(checkpoint,paste(input$output_folder,
                                                 "/checkpoint.txt",sep=""),
                                row.names=FALSE,quote=FALSE,sep="\t")
                }
                progress$close()

                #2. Normalization
                log_info<-c(log_info,"2. Normalization<br>")
                output$log_info<-renderUI({HTML(log_info)})

                progress <- shiny::Progress$new()
                progress$set(message = "2. Normalization", value = 0)
                normalized_calls<-list()
                for(i in seq_along(target_calls)){
                    progress$inc(1/length(target_calls),
                                 detail=paste("->",
                                              as.character(names(overview[i+1]))))
                    normalized_calls[[i]]<-list()
                    if(length(target_calls[[i]])>0){
                        temp<-target_calls[[i]][[1]]
                        checkpoint[1,i+1]<-2
                        if(!is.na(temp[1,2])&&length(overview[,1])>1){
                            for(j in 2:length(overview[,1])){
                                temp<-rbind(temp,target_calls[[i]][[j]])
                                checkpoint[j,i+1]<-2
                            }
                        }
                        #GATK
                        if(i==1){
                            if(input$gatk_indels=="C>-A"){
                                temp2<-indel_converter(temp)
                                temp<-temp2
                            }
                            temp2<-check_alternative_bases(temp)
                            temp<-temp2
                            if(input$gatk_mnvs=="Yes"){
                                temp2<-mnv_converter(temp)
                                temp<-temp2
                            }
                            temp2<-string_diff_finder(temp)
                            temp<-temp2
                            normalized_calls[[i]]<-temp
                            write.table(normalized_calls[[i]],
                                        paste(input$output_folder,"/",
                                              as.character(names(overview)[i+1]),
                                              ".normalized.txt",sep=""),
                                        row.names=FALSE,quote=FALSE,sep="\t")
                        }
                        #Platypus
                        if(i==2){
                            if(input$platypus_indels=="C>-A"){
                                temp2<-indel_converter(temp)
                                temp<-temp2
                            }
                            temp2<-check_alternative_bases(temp)
                            temp<-temp2
                            if(input$platypus_mnvs=="Yes"){
                                temp2<-mnv_converter(temp)
                                temp<-temp2
                            }
                            temp2<-string_diff_finder(temp)
                            temp<-temp2
                            normalized_calls[[i]]<-temp
                            write.table(normalized_calls[[i]],
                                        paste(input$output_folder,"/",
                                              as.character(names(overview)[i+1]),
                                              ".normalized.txt",sep=""),
                                        row.names=FALSE,quote=FALSE,sep="\t")
                        }
                        #VarScan
                        if(i==3){
                            if(input$varscan_indels=="C>-A"){
                                temp2<-indel_converter(temp)
                                temp<-temp2
                            }
                            temp2<-check_alternative_bases(temp)
                            temp<-temp2
                            if(input$varscan_mnvs=="Yes"){
                                temp2<-mnv_converter(temp)
                                temp<-temp2
                            }
                            temp2<-string_diff_finder(temp)
                            temp<-temp2
                            normalized_calls[[i]]<-temp
                            write.table(normalized_calls[[i]],
                                        paste(input$output_folder,"/",
                                              as.character(names(overview)[i+1]),
                                              ".normalized.txt",sep=""),
                                        row.names=FALSE,quote=FALSE,sep="\t")
                        }
                        #FreeBayes
                        if(i==4){
                            if(input$freebayes_indels=="C>-A"){
                                temp2<-indel_converter(temp)
                                temp<-temp2
                            }
                            temp2<-check_alternative_bases(temp)
                            temp<-temp2
                            if(input$freebayes_mnvs=="Yes"){
                                temp2<-mnv_converter(temp)
                                temp<-temp2
                            }
                            temp2<-string_diff_finder(temp)
                            temp<-temp2
                            normalized_calls[[i]]<-temp
                            write.table(normalized_calls[[i]],
                                        paste(input$output_folder,"/",
                                              as.character(names(overview)[i+1]),
                                              ".normalized.txt",sep=""),
                                        row.names=FALSE,quote=FALSE,sep="\t")
                        }
                        #LoFreq
                        if(i==5){
                            if(input$lofreq_indels=="C>-A"){
                                temp2<-indel_converter(temp)
                                temp<-temp2
                            }
                            temp2<-check_alternative_bases(temp)
                            temp<-temp2
                            if(input$lofreq_mnvs=="Yes"){
                                temp2<-mnv_converter(temp)
                                temp<-temp2
                            }
                            temp2<-string_diff_finder(temp)
                            temp<-temp2
                            normalized_calls[[i]]<-temp
                            write.table(normalized_calls[[i]],
                                        paste(input$output_folder,"/",
                                              as.character(names(overview)[i+1]),
                                              ".normalized.txt",sep=""),
                                        row.names=FALSE,quote=FALSE,sep="\t")
                        }
                        #SNVer
                        if(i==6){
                            if(input$snver_indels=="C>-A"){
                                temp2<-indel_converter(temp)
                                temp<-temp2
                            }
                            temp2<-check_alternative_bases(temp)
                            temp<-temp2
                            if(input$snver_mnvs=="Yes"){
                                temp2<-mnv_converter(temp)
                                temp<-temp2
                            }
                            temp2<-string_diff_finder(temp)
                            temp<-temp2
                            normalized_calls[[i]]<-temp
                            write.table(normalized_calls[[i]],
                                        paste(input$output_folder,"/",
                                              as.character(names(overview)[i+1]),
                                              ".normalized.txt",sep=""),
                                        row.names=FALSE,quote=FALSE,sep="\t")
                        }
                        #SamTools
                        if(i==7){
                            if(input$samtools_indels=="C>-A"){
                                temp2<-indel_converter(temp)
                                temp<-temp2
                            }
                            temp2<-check_alternative_bases(temp)
                            temp<-temp2
                            if(input$samtools_mnvs=="Yes"){
                                temp2<-mnv_converter(temp)
                                temp<-temp2
                            }
                            temp2<-string_diff_finder(temp)
                            temp<-temp2
                            normalized_calls[[i]]<-temp
                            write.table(normalized_calls[[i]],
                                        paste(input$output_folder,"/",
                                              as.character(names(overview)[i+1]),
                                              ".normalized.txt",sep=""),
                                        row.names=FALSE,quote=FALSE,sep="\t")
                        }
                        #VarDict
                        if(i==8){
                            if(input$vardict_indels=="C>-A"){
                                temp2<-indel_converter(temp)
                                temp<-temp2
                            }
                            temp2<-check_alternative_bases(temp)
                            temp<-temp2
                            if(input$vardict_mnvs=="Yes"){
                                temp2<-mnv_converter(temp)
                                temp<-temp2
                            }
                            temp2<-string_diff_finder(temp)
                            temp<-temp2
                            normalized_calls[[i]]<-temp
                            write.table(normalized_calls[[i]],
                                        paste(input$output_folder,"/",
                                              as.character(names(overview)[i+1]),
                                              ".normalized.txt",sep=""),
                                        row.names=FALSE,quote=FALSE,sep="\t")
                        }
                        if(length(target_calls)>8){
                            #Caller 1
                            if(i==9){
                                if(input$caller1_indels=="C>-A"){
                                    temp2<-indel_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-check_alternative_bases(temp)
                                temp<-temp2
                                if(input$caller1_mnvs=="Yes"){
                                    temp2<-mnv_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-string_diff_finder(temp)
                                temp<-temp2
                                normalized_calls[[i]]<-temp
                                write.table(normalized_calls[[i]],
                                            paste(input$output_folder,"/",
                                                  as.character(names(overview)[i+1]),
                                                  ".normalized.txt",sep=""),
                                            row.names=FALSE,quote=FALSE,
                                            sep="\t")
                            }
                            if(length(target_calls)>9){
                                #Caller 2
                                if(i==10){
                                    if(input$caller2_indels=="C>-A"){
                                        temp2<-indel_converter(temp)
                                        temp<-temp2
                                    }
                                    temp2<-check_alternative_bases(temp)
                                    temp<-temp2
                                    if(input$caller2_mnvs=="Yes"){
                                        temp2<-mnv_converter(temp)
                                        temp<-temp2
                                    }
                                    temp2<-string_diff_finder(temp)
                                    temp<-temp2
                                    normalized_calls[[i]]<-temp
                                    write.table(normalized_calls[[i]],
                                                paste(input$output_folder,"/",
                                                      as.character(names(overview)[i+1]),
                                                      ".normalized.txt",sep=""),
                                                row.names=FALSE,quote=FALSE,
                                                sep="\t")
                                }
                                if(length(target_calls)>10){
                                    #Caller 3
                                    if(i==11){
                                        if(input$caller3_indels=="C>-A"){
                                            temp2<-indel_converter(temp)
                                            temp<-temp2
                                        }
                                        temp2<-check_alternative_bases(temp)
                                        temp<-temp2
                                        if(input$caller3_mnvs=="Yes"){
                                            temp2<-mnv_converter(temp)
                                            temp<-temp2
                                        }
                                        temp2<-string_diff_finder(temp)
                                        temp<-temp2
                                        normalized_calls[[i]]<-temp
                                        write.table(normalized_calls[[i]],
                                                    paste(input$output_folder,
                                                          "/",
                                                          as.character(names(overview)[i+1]),
                                                          ".normalized.txt",
                                                          sep=""),
                                                    row.names=FALSE,quote=FALSE,
                                                    sep="\t")
                                    }
                                    if(length(target_calls)>11){
                                        #Caller 4
                                        if(i==12){
                                            if(input$caller4_indels=="C>-A"){
                                                temp2<-indel_converter(temp)
                                                temp<-temp2
                                            }
                                            temp2<-check_alternative_bases(temp)
                                            temp<-temp2
                                            if(input$caller4_mnvs=="Yes"){
                                                temp2<-mnv_converter(temp)
                                                temp<-temp2
                                            }
                                            temp2<-string_diff_finder(temp)
                                            temp<-temp2
                                            normalized_calls[[i]]<-temp
                                            write.table(normalized_calls[[i]],
                                                        paste(input$output_folder,
                                                              "/",
                                                              as.character(names(overview)[i+1]),
                                                              ".normalized.txt",
                                                              sep=""),
                                                        row.names=FALSE,
                                                        quote=FALSE,
                                                        sep="\t")
                                        }
                                        if(length(target_calls)>12){
                                            #Caller 5
                                            if(i==13){
                                                if(input$caller5_indels=="C>-A"){
                                                    temp2<-indel_converter(temp)
                                                    temp<-temp2
                                                }
                                                temp2<-check_alternative_bases(temp)
                                                temp<-temp2
                                                if(input$caller5_mnvs=="Yes"){
                                                    temp2<-mnv_converter(temp)
                                                    temp<-temp2
                                                }
                                                temp2<-string_diff_finder(temp)
                                                temp<-temp2
                                                normalized_calls[[i]]<-temp
                                                write.table(normalized_calls[[i]],
                                                            paste(input$output_folder,
                                                                  "/",
                                                                  as.character(names(overview)[i+1]),
                                                                  ".normalized.txt",
                                                                  sep=""),
                                                            row.names=FALSE,
                                                            quote=FALSE,
                                                            sep="\t")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                write.table(checkpoint,paste(input$output_folder,
                                             "/checkpoint.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                progress$close()

                #3. Annotate
                log_info<-c(log_info,"3. Annotate<br>")
                output$log_info<-renderUI({HTML(log_info)})

                progress <- shiny::Progress$new()
                progress$set(message = "3. Annotate", value = 0)
                annotated_calls<-list()
                overview3<-overview
                overview3[c(seq_along(overview[,1])),c(2:length(overview[1,]))]<-NA
                txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
                connection_txid_symbol<-transcripts(Homo.sapiens,
                                                    columns=c("TXID","SYMBOL"))
                for(i in seq_along(normalized_calls)){
                    progress$inc(1/length(normalized_calls))
                    annotated_calls[[i]]<-data.frame()
                    if(length(normalized_calls[[i]])>0){
                        progress_small <- shiny::Progress$new()
                        progress_small$set(message = as.character(names(overview[i+1])), value = 0)
                        test<-VCF(rowRanges=GRanges(seqnames=paste("chr",
                                                                   as.character(normalized_calls[[i]][,2]),
                                                                   sep=""),
                                                    ranges=IRanges(as.numeric(normalized_calls[[i]][,3]),
                                                                   (as.numeric(normalized_calls[[i]][,3])+nchar(normalized_calls[[i]][,4])-1))),
                                  fixed=DataFrame(REF=DNAStringSet(normalized_calls[[i]][,4]),
                                                  ALT=DNAStringSetList(strsplit(normalized_calls[[i]][,5],",",fixed=TRUE)),
                                                  QUAL=1,
                                                  FILTER=as.character(normalized_calls[[i]][,1])))
                        if(is.null(input$locations)){
                            log_info<-c(log_info,"Please pick at least one location<br>")
                            output$log_info<-renderUI({HTML(log_info)})
                            return()
                        }
                        if(!is.null(input$locations)){
                            located<-locateVariants(test,txdb,AllVariants())
                            for(j in seq_along(input$locations)){
                                if(j==1){
                                    of_interest<-data.frame(located$LOCATION==input$locations[j])
                                }
                                if(j>1){
                                    of_interest<-data.frame(of_interest,
                                                            located$LOCATION==input$locations[j])
                                }
                            }
                            if(length(input$locations)==1){
                                located<-located[of_interest[,1]>0,]
                            }
                            if(length(input$locations)>1){
                                located<-located[rowSums(of_interest)>0,]
                            }
                        }
                        if(sum(input$locations=="coding")>0&&
                           is.null(input$consequences)){
                            log_info<-c(log_info,"Please pick at least one consequence<br>")
                            output$log_info<-renderUI({HTML(log_info)})
                            return()
                        }
                        if(!is.null(input$consequences)){
                            predicted<-predictCoding(query=test,subject=txdb,
                                                     seqSource=Hsapiens)
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
                            for(j in seq_along(input$consequences)){
                                if(j==1){
                                    of_interest<-data.frame(predicted$CONSEQUENCE==input$consequences[j])
                                }
                                if(j>1){
                                    of_interest<-data.frame(of_interest,
                                                            predicted$CONSEQUENCE==input$consequences[j])
                                }
                            }
                            if(length(input$consequences)==1){
                                predicted<-predicted[of_interest[,1]>0,]
                            }
                            if(length(input$consequences)>1){
                                predicted<-predicted[rowSums(of_interest)>0,]
                            }
                        }

                        annotated_calls[[i]]<-data.frame(normalized_calls[[i]],
                                                         Location=NA,c.=NA,
                                                         p.=NA,AA_ref=NA,
                                                         AA_alt=NA,Codon_ref=NA,
                                                         Codon_alt=NA,
                                                         Consequence=NA,Gene=NA,
                                                         GeneID=NA,
                                                         TranscriptID=NA)
                        counter_located<-1
                        counter_predicted<-1
                        keep<-rep(TRUE,length(annotated_calls[[i]][,1]))

                        for(k in seq_along(annotated_calls[[i]][,1])){
                            progress_small$inc(1/length(annotated_calls[[i]][,1]),
                                               detail=paste("-> Call",k,
                                                            "out of",
                                                            length(annotated_calls[[i]][,1])))
                            while(counter_located<=length(ranges(located))&&
                                  start(ranges(located))[counter_located]==annotated_calls[[i]][k,3]){
                                if(!is.na(annotated_calls[[i]][k,6])){
                                    annotated_calls[[i]][k,6]<-paste(annotated_calls[[i]][k,6],
                                                                     as.character(located$LOCATION[counter_located]),
                                                                     sep=",")
                                    annotated_calls[[i]][k,7]<-paste(annotated_calls[[i]][k,7],
                                                                     as.character(located$LOCSTART[counter_located]),
                                                                     sep=",")
                                }
                                if(is.na(annotated_calls[[i]][k,6])){
                                    annotated_calls[[i]][k,6]<-as.character(located$LOCATION[counter_located])
                                    annotated_calls[[i]][k,7]<-as.character(located$LOCSTART[counter_located])
                                }
                                counter_located<-counter_located+1
                            }
                            if(!is.na(annotated_calls[[i]][k,6])&&
                               !is.null(input$consequences)){
                                for(j in seq_along(strsplit(annotated_calls[[i]][k,6],",")[[1]])){
                                    if(counter_predicted>length(ranges(predicted))||
                                       strsplit(annotated_calls[[i]][k,6],",")[[1]][j]!="coding"){
                                        if(!is.na(annotated_calls[[i]][k,8])){
                                            annotated_calls[[i]][k,8]<-paste(annotated_calls[[i]][k,8],"NA",sep=",")
                                            annotated_calls[[i]][k,9]<-paste(annotated_calls[[i]][k,9],"NA",sep=",")
                                            annotated_calls[[i]][k,10]<-paste(annotated_calls[[i]][k,10],"NA",sep=",")
                                            annotated_calls[[i]][k,11]<-paste(annotated_calls[[i]][k,11],"NA",sep=",")
                                            annotated_calls[[i]][k,12]<-paste(annotated_calls[[i]][k,12],"NA",sep=",")
                                            annotated_calls[[i]][k,13]<-paste(annotated_calls[[i]][k,13],"NA",sep=",")
                                            annotated_calls[[i]][k,14]<-paste(annotated_calls[[i]][k,14],"NA",sep=",")
                                            annotated_calls[[i]][k,15]<-paste(annotated_calls[[i]][k,15],"NA",sep=",")
                                            annotated_calls[[i]][k,16]<-paste(annotated_calls[[i]][k,16],"NA",sep=",")
                                        }
                                        if(is.na(annotated_calls[[i]][k,8])){
                                            annotated_calls[[i]][k,8]<-annotated_calls[[i]][k,9]<-"NA"
                                            annotated_calls[[i]][k,10]<-annotated_calls[[i]][k,11]<-"NA"
                                            annotated_calls[[i]][k,12]<-annotated_calls[[i]][k,13]<-"NA"
                                            annotated_calls[[i]][k,14]<-"NA"
                                            annotated_calls[[i]][k,15]<-annotated_calls[[i]][k,16]<-"NA"
                                        }
                                    }
                                    if(counter_predicted<=length(ranges(predicted))&&
                                       strsplit(annotated_calls[[i]][k,6],",")[[1]][j]=="coding"){
                                        if(start(ranges(predicted))[counter_predicted]==annotated_calls[[i]][k,3]){
                                            if(!is.na(annotated_calls[[i]][k,8])){
                                                annotated_calls[[i]][k,8]<-paste(annotated_calls[[i]][k,8],
                                                                                 as.character(predicted$PROTEINLOC[counter_predicted][[1]][1]),
                                                                                 sep=",")
                                                if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])!="frameshift"){
                                                    if(as.character(predicted$REFCODON[counter_predicted])!="CTG"){
                                                        annotated_calls[[i]][k,9]<-paste(annotated_calls[[i]][k,9],
                                                                                         as.character(predicted$REFAA[counter_predicted][[1]][1]),
                                                                                         sep=",")
                                                    }
                                                    if(as.character(predicted$REFCODON[counter_predicted])=="CTG"){
                                                        annotated_calls[[i]][k,9]<-paste(annotated_calls[[i]][k,9],
                                                                                         "L",
                                                                                         sep=",")
                                                    }
                                                    if(as.character(predicted$VARCODON[counter_predicted])!="CTG"){
                                                        annotated_calls[[i]][k,10]<-paste(annotated_calls[[i]][k,10],
                                                                                          as.character(predicted$VARAA[counter_predicted][[1]][1]),
                                                                                          sep=",")
                                                    }
                                                    if(as.character(predicted$VARCODON[counter_predicted])=="CTG"){
                                                        annotated_calls[[i]][k,10]<-paste(annotated_calls[[i]][k,10],"L",sep=",")
                                                    }
                                                }
                                                if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])=="frameshift"){
                                                    annotated_calls[[i]][k,9]<-paste(annotated_calls[[i]][k,9],"NA",sep=",")
                                                    annotated_calls[[i]][k,10]<-paste(annotated_calls[[i]][k,10],"NA",sep=",")
                                                }
                                                annotated_calls[[i]][k,11]<-paste(annotated_calls[[i]][k,11],
                                                                                  as.character(predicted$REFCODON[counter_predicted]),
                                                                                  sep=",")
                                                annotated_calls[[i]][k,12]<-paste(annotated_calls[[i]][k,12],
                                                                                  as.character(predicted$VARCODON[counter_predicted]),
                                                                                  sep=",")
                                                annotated_calls[[i]][k,13]<-paste(annotated_calls[[i]][k,13],
                                                                                  as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1]),
                                                                                  sep=",")
                                                annotated_calls[[i]][k,14]<-paste(annotated_calls[[i]][k,14],
                                                                                  as.character(connection_txid_symbol[as.numeric(predicted$TXID[counter_predicted][[1]][1]),]$SYMBOL),
                                                                                  sep=",")
                                                annotated_calls[[i]][k,15]<-paste(annotated_calls[[i]][k,15],
                                                                                  as.character(predicted$GENEID[counter_predicted][[1]][1]),
                                                                                  sep=",")
                                                annotated_calls[[i]][k,16]<-paste(annotated_calls[[i]][k,16],
                                                                                  as.character(predicted$TXID[counter_predicted][[1]][1]),
                                                                                  sep=",")
                                            }
                                            if(is.na(annotated_calls[[i]][k,8])){
                                                annotated_calls[[i]][k,8]<-as.character(predicted$PROTEINLOC[counter_predicted][[1]][1])
                                                if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])!="frameshift"){
                                                    if(as.character(predicted$REFCODON[counter_predicted])!="CTG"){
                                                        annotated_calls[[i]][k,9]<-as.character(predicted$REFAA[counter_predicted][[1]][1])
                                                    }
                                                    if(as.character(predicted$REFCODON[counter_predicted])=="CTG"){
                                                        annotated_calls[[i]][k,9]<-"L"
                                                    }
                                                    if(as.character(predicted$VARCODON[counter_predicted])!="CTG"){
                                                        annotated_calls[[i]][k,10]<-as.character(predicted$VARAA[counter_predicted][[1]][1])
                                                    }
                                                    if(as.character(predicted$VARCODON[counter_predicted])=="CTG"){
                                                        annotated_calls[[i]][k,10]<-"L"
                                                    }
                                                }
                                                if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])=="frameshift"){
                                                    annotated_calls[[i]][k,9]<-"NA"
                                                    annotated_calls[[i]][k,10]<-"NA"
                                                }
                                                annotated_calls[[i]][k,11]<-as.character(predicted$REFCODON[counter_predicted])
                                                annotated_calls[[i]][k,12]<-as.character(predicted$VARCODON[counter_predicted])
                                                annotated_calls[[i]][k,13]<-as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])
                                                annotated_calls[[i]][k,14]<-as.character(connection_txid_symbol[as.numeric(predicted$TXID[counter_predicted][[1]][1]),]$SYMBOL)
                                                annotated_calls[[i]][k,15]<-as.character(predicted$GENEID[counter_predicted][[1]][1])
                                                annotated_calls[[i]][k,16]<-as.character(predicted$TXID[counter_predicted][[1]][1])
                                            }
                                            counter_predicted<-counter_predicted+1
                                        }
                                    }
                                }
                            }
                            if(is.na(annotated_calls[[i]][k,6])){
                                keep[k]<-FALSE
                            }
                            if(!is.null(input$consequences)&&
                               !is.na(annotated_calls[[i]][k,6])&&
                               sum(strsplit(annotated_calls[[i]][k,6],",")[[1]]=="coding")>0&&
                               (is.na(annotated_calls[[i]][k,8])||
                                sum(strsplit(annotated_calls[[i]][k,8],",")[[1]]=="NA")==length(strsplit(annotated_calls[[i]][k,8],",")[[1]]))){
                                keep[k]<-FALSE
                            }
                        }
                        annotated_calls[[i]]<-annotated_calls[[i]][keep,]
                        for(k in seq_along(overview3[,1])){
                            overview3[k,i+1]<-length(annotated_calls[[i]][annotated_calls[[i]][,1]==overview3[k,1],1])
                            checkpoint[k,i+1]<-3
                        }
                        write.table(annotated_calls[[i]],
                                    paste(input$output_folder,"/",
                                          as.character(names(overview)[i+1]),
                                          ".annotated.txt",sep=""),
                                    row.names=FALSE,quote=FALSE,sep="\t")
                        progress_small$close()
                    }
                }
                write.table(checkpoint,paste(input$output_folder,
                                             "/checkpoint.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                output$table3 <- renderDataTable(datatable(overview3))
                progress$close()

                #4. Combine
                log_info<-c(log_info,"4. Combine Output<br>")
                output$log_info<-renderUI({HTML(log_info)})

                progress <- shiny::Progress$new()
                progress$set(message = "4. Combine Output", value = 0)
                combined_calls<-data.frame(SampleID=NA,Chr=NA,Pos=NA,Ref=NA,
                                           Alt=NA,Location=NA,c.=NA,p.=NA,
                                           AA_ref=NA,AA_alt=NA,Codon_ref=NA,
                                           Codon_alt=NA,Consequence=NA,Gene=NA,
                                           GeneID=NA,TranscriptID=NA,
                                           GATK=NA,Platypus=NA,VarScan=NA,
                                           FreeBayes=NA,LoFreq=NA,SNVer=NA,
                                           SamTools=NA,VarDict=NA)
                if(length(annotated_calls)>8){
                    combined_calls<-cbind(combined_calls,Caller1=NA)
                    if(length(annotated_calls)>9){
                        combined_calls<-cbind(combined_calls,Caller2=NA)
                        if(length(annotated_calls)>10){
                            combined_calls<-cbind(combined_calls,Caller3=NA)
                            if(length(annotated_calls)>11){
                                combined_calls<-cbind(combined_calls,Caller4=NA)
                                if(length(annotated_calls)>12){
                                    combined_calls<-cbind(combined_calls,
                                                          Caller5=NA)
                                }
                            }
                        }
                    }
                }
                combined_calls_temp<-combined_calls
                overview4<-cbind(overview[,1],RawCalls=NA)
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
                    progress$inc(1/length(combined_calls_temp_sorted[,1]))
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
                        combined_calls<-rbind(combined_calls,
                                              combined_calls_temp_sorted[i,])
                    }
                }
                temp<-unique(combined_calls)
                combined_calls<-temp
                for(i in seq_along(overview4[,1])){
                    overview4[i,2]<-length(combined_calls[combined_calls[,1]==overview4[i,1],1])
                    for(j in seq_along(annotated_calls)){
                        if(length(annotated_calls[[j]])>0){
                            checkpoint[i,j+1]<-4
                        }
                    }
                }
                write.table(combined_calls,paste(input$output_folder,
                                                 "/Results_Raw.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                write.table(checkpoint,paste(input$output_folder,
                                             "/checkpoint.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                output$table4 <- renderDataTable(datatable(overview4))
                progress$close()

                #5. Pileup
                log_info<-c(log_info,"5. Evaluate Coverage and BQ<br>")
                output$log_info<-renderUI({HTML(log_info)})

                progress <- shiny::Progress$new()
                progress$set(message = "5. Evaluate Coverage and BQ", value = 0)
                results<-cbind(combined_calls[,c(1:5)],Nr_Ref=NA,Nr_Alt=NA,
                               DP=NA,VAF=NA,BQ_REF=NA,BQ_ALT=NA,
                               Nr_Ref_fwd=NA,Nr_Alt_fwd=NA,DP_fwd=NA,VAF_fwd=NA,
                               Nr_Ref_rev=NA,Nr_Alt_rev=NA,DP_rev=NA,VAF_rev=NA)
                folder<-input$bam_folder
                for(i in seq_along(results[,1])){
                    progress$inc(1/length(results[,1]),
                                 detail=paste("-> Call ",i," out of ",
                                              length(results[,1])))
                    done<-FALSE
                    #SNVs
                    if(nchar(results[i,4])==1&&nchar(results[i,5])==1){
                        results_temp<-getCharacteristicsFreq(results[i,2],
                                                             results[i,3],
                                                             results[i,3],
                                                             results[i,4],
                                                             results[i,5],
                                                             folder,
                                                             results[i,1])
                        results[i,6:19]<-results_temp[1,6:19]
                        if(results[i,8]>=input$dp&&results[i,7]>=input$nr_alt&&
                           (results[i,9]*100)>=input$vaf){
                            results_temp<-getCharacteristicsBQ(results[i,2],
                                                               results[i,3],
                                                               results[i,3],
                                                               results[i,4],
                                                               results[i,5],
                                                               folder,
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
                                                                 "-",folder,
                                                                 results[i,1])
                            results[i,6:19]<-results_temp[1,6:19]
                            if(results[i,8]>=input$dp&&
                               results[i,7]>=input$nr_alt&&
                               (results[i,9]*100)>=input$vaf){
                                results_temp<-getCharacteristicsBQ(results[i,2],
                                                                   as.numeric(results[i,3])+1,
                                                                   as.numeric(results[i,3])+1,
                                                                   substr(results[i,4],2,2),
                                                                   "-",folder,
                                                                   results[i,1])
                                results[i,10:11]<-results_temp[1,6:7]
                            }
                        }
                        if(nchar(results[i,4])>2){
                            results_temp<-getCharacteristicsFreq(results[i,2],
                                                                 as.numeric(results[i,3])+1,
                                                                 as.numeric(results[i,3])+1,
                                                                 substr(results[i,4],2,2),
                                                                 "-",folder,
                                                                 results[i,1])
                            for(j in 3:nchar(results[i,4])){
                                results_temp<-rbind(results_temp,
                                                    getCharacteristicsFreq(results[i,2],
                                                                           as.numeric(results[i,3])+j-1,
                                                                           as.numeric(results[i,3])+j-1,
                                                                           substr(results[i,4],j,j),
                                                                           "-",
                                                                           folder,results[i,1]))
                            }
                            for(j in 6:19){
                                results[i,j]<-min(results_temp[,j])
                            }
                            if(results[i,8]>=input$dp&&
                               results[i,7]>=input$nr_alt&&
                               (results[i,9]*100)>=input$vaf){
                                results_temp<-getCharacteristicsBQ(results[i,2],
                                                                   as.numeric(results[i,3])+1,
                                                                   as.numeric(results[i,3])+1,
                                                                   substr(results[i,4],2,2),
                                                                   "-",folder,
                                                                   results[i,1])
                                for(j in 3:nchar(results[i,4])){
                                    results_temp<-rbind(results_temp,
                                                        getCharacteristicsBQ(results[i,2],
                                                                             as.numeric(results[i,3])+j-1,
                                                                             as.numeric(results[i,3])+j-1,
                                                                             substr(results[i,4],j,j),
                                                                             "-",folder,results[i,1]))
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
                                                             results[i,4],
                                                             "+",folder,
                                                             results[i,1])
                        results[i,6:19]<-results_temp[1,6:19]
                        if(results[i,8]>=input$dp&&results[i,7]>=input$nr_alt&&
                           (results[i,9]*100)>=input$vaf){
                            results_temp<-getCharacteristicsBQ(results[i,2],
                                                               as.numeric(results[i,3]),
                                                               as.numeric(results[i,3]),
                                                               results[i,4],
                                                               "+",folder,
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
                                                             folder,
                                                             results[i,1])
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
                                                                       "-",
                                                                       folder,
                                                                       results[i,1]))
                        }
                        #Ins in the end
                        if(nchar(results[i,4])>nchar(results[i,5])){
                            results_temp<-rbind(results_temp,
                                                getCharacteristicsFreq(results[i,2],
                                                                       as.numeric(results[i,3])+j-1,
                                                                       as.numeric(results[i,3])+j-1,
                                                                       substr(results[i,4],j,j),
                                                                       "+",
                                                                       folder,
                                                                       results[i,1]))
                        }
                        for(j in 6:19){
                            results[i,j]<-min(results_temp[,j])
                        }
                        if(results[i,8]>=input$dp&&results[i,7]>=input$nr_alt&&
                           (results[i,9]*100)>=input$vaf){
                            results_temp<-getCharacteristicsBQ(results[i,2],
                                                               as.numeric(results[i,3]),
                                                               as.numeric(results[i,3]),
                                                               substr(results[i,4],1,1),
                                                               substr(results[i,5],1,1),
                                                               folder,
                                                               results[i,1])
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
                                                                         "-",
                                                                         folder,
                                                                         results[i,1]))
                            }
                            #Ins in the end
                            if(nchar(results[i,4])>nchar(results[i,5])){
                                results_temp<-rbind(results_temp,
                                                    getCharacteristicsBQ(results[i,2],
                                                                         as.numeric(results[i,3])+j-1,
                                                                         as.numeric(results[i,3])+j-1,
                                                                         substr(results[i,4],j,j),
                                                                         "+",
                                                                         folder,
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
                include1<-results[,8]>=input$dp
                include2<-results[,7]>=input$nr_alt
                include3<-(results[,9]*100)>=input$vaf
                include4<-results[,11]>=input$bq
                for(i in seq_along(results[,1])){
                    if(is.na(results[i,10])){
                        results[i,10]<-0
                    }
                }
                include5<-(results[,10]-results[,11])<=input$bq_diff

                frequency_calls<-frequency_calls_temp[rowSums(cbind(include1,include2,include3,include4,include5))>=5&!is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                overview4<-cbind(overview4,VAFandBQFiltered=NA)
                for(i in seq_along(overview4[,1])){
                    overview4[i,3]<-length(frequency_calls[frequency_calls[,1]==overview4[i,1],1])
                    for(j in 2:length(checkpoint[1,])){
                        if(!is.na(checkpoint[i,j])){
                            checkpoint[i,j]<-5
                        }
                    }
                }
                write.table(frequency_calls,
                            paste(input$output_folder,
                                  "/Results_Frequency.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                write.table(checkpoint,
                            paste(input$output_folder,"/checkpoint.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                output$table4 <- renderDataTable(datatable(overview4))
                progress$close()

                #6. Extended Characteristics
                log_info<-c(log_info,
                            "6. Determine Extended Set of Characteristics<br>")
                output$log_info<-renderUI({HTML(log_info)})

                progress <- shiny::Progress$new()
                progress$set(message="6. Determine Extended Set of Characteristics (databases)",
                             value=0)
                progress$inc(0,detail="-> Downloading databases ")
                results<-data.frame(frequency_calls[,c(1:5)])
                results<-cbind(results,dbSNP=NA,dbSNP_MAF=NA)
                snps<-SNPlocs.Hsapiens.dbSNP144.GRCh37
                indels<-XtraSNPlocs.Hsapiens.dbSNP144.GRCh37
                if(!is.null(input$`1kgenomes`)){
                    results<-cbind(results,G1000_AF=NA)
                    g1000<-MafDb.1Kgenomes.phase3.hs37d5
                }
                if(!is.null(input$exac)){
                    results<-cbind(results,ExAC_AF=NA)
                    exac<-MafDb.ExAC.r1.0.hs37d5
                }
                if(!is.null(input$esp)){
                    results<-cbind(results,ESP6500_AF=NA)
                    esp6500<-MafDb.ESP6500SI.V2.SSA137.hs37d5
                }
                if(!is.null(input$gad)){
                    results<-cbind(results,GAD_AF=NA)
                    gad<-MafDb.gnomADex.r2.1.hs37d5
                }
                if(!is.null(input$cosmic)){
                    results<-cbind(results,CosmicID=NA,Cosmic_Counts=NA)
                    cosmic_67<-c()
                    data(cosmic_67,envir = environment(),package = "COSMIC.67")
                }
                if(!is.null(input$clinvar)){
                    results<-cbind(results,ClinVar=NA)
                    clinvar<-data.frame(Gene=NA,Start=NA,Stop=NA,Ref=NA,Alt=NA,
                                        Sig=NA)
                    genes_temp<-c()
                    for(i in seq_along(frequency_calls[,1])){
                        genes_temp<-c(genes_temp,strsplit(frequency_calls[i,14],
                                                          split=",")[[1]])
                    }
                    genes<-unique(genes_temp[genes_temp!="NA"])
                    for(i in seq_along(genes)){
                        res<-entrez_search("clinvar",term=genes[i])
                        cv<-entrez_summary("clinvar",id=res$ids)
                        info<-extract_from_esummary(cv,"variation_set",
                                                    simplify=FALSE)
                        significance<-extract_from_esummary(cv,
                                                            "clinical_significance",
                                                            simplify=FALSE)
                        for(j in seq_along(res$ids)){
                            info2<-info[res$ids[j]][[1]][[1]]
                            significance2<-significance[res$ids[j]][[1]][[1]]
                            if(length(info2$variation_loc[[1]])){
                                for(k in seq_along(info2$variation_loc[[1]][,1])){
                                    if(info2$variation_loc[[1]][k,2]=="GRCh37"){
                                        temp<-data.frame(Gene=NA,Start=NA,
                                                         Stop=NA,Ref=NA,Alt=NA)
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
                for(i in seq_along(frequency_calls[,1])){
                    progress$inc(0,detail="-> Pre-processing of the calls ")
                    for(j in 1:(length(strsplit(frequency_calls[i,7],
                                                split=",")[[1]]))){
                        if(j==1){
                            c.[i]<-paste("c.",strsplit(frequency_calls[i,7],
                                                       split=",")[[1]][j],
                                         frequency_calls[i,4],">",
                                         frequency_calls[i,5],sep="")
                            c.complement[i]<-paste("c.",
                                                   strsplit(frequency_calls[i,7],
                                                            split=",")[[1]][j],
                                                   as.character(complement(DNAString(frequency_calls[i,4]))),
                                                   ">",
                                                   as.character(complement(DNAString(frequency_calls[i,5]))),
                                                   sep="")
                            if(!is.na(strsplit(frequency_calls[i,11],
                                               split=",")[[1]][j])&&
                               !is.na(strsplit(frequency_calls[i,12],
                                               split=",")[[1]][j])&&
                               strsplit(frequency_calls[i,11],
                                        split=",")[[1]][j]!="NA"&&
                               strsplit(frequency_calls[i,12],
                                        split=",")[[1]][j]!="NA"&&
                               nchar(strsplit(frequency_calls[i,11],
                                              split=",")[[1]][j])==3&&
                               nchar(strsplit(frequency_calls[i,12],
                                              split=",")[[1]][j])==3){
                                p.[i]<-paste("p.",strsplit(frequency_calls[i,9],
                                                           split=",")[[1]][j],
                                             strsplit(frequency_calls[i,8],
                                                      split=",")[[1]][j],
                                             strsplit(frequency_calls[i,10],
                                                      split=",")[[1]][j],sep="")
                            }
                            if(!is.na(strsplit(frequency_calls[i,11],
                                               split=",")[[1]][j])&&
                               !is.na(strsplit(frequency_calls[i,12],
                                               split=",")[[1]][j])&&
                               strsplit(frequency_calls[i,11],
                                        split=",")[[1]][j]!="NA"&&
                               strsplit(frequency_calls[i,12],
                                        split=",")[[1]][j]!="NA"&&
                               (nchar(strsplit(frequency_calls[i,11],
                                               split=",")[[1]][j])!=3||
                                nchar(strsplit(frequency_calls[i,12],
                                               split=",")[[1]][j])!=3)){
                                if((nchar(strsplit(frequency_calls[i,11],
                                                   split=",")[[1]][j])%%3)!=0||
                                   (nchar(strsplit(frequency_calls[i,12],
                                                   split=",")[[1]][j])%%3)!=0){
                                    p.[i]<-paste("p.",
                                                 as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                                 strsplit(frequency_calls[i,8],
                                                          split=",")[[1]][j],
                                                 "fs",sep="")
                                }
                                if((nchar(strsplit(frequency_calls[i,11],
                                                   split=",")[[1]][j])%%3)==0&&
                                   (nchar(strsplit(frequency_calls[i,12],
                                                   split=",")[[1]][j])%%3)==0){
                                    p.[i]<-paste("p.",
                                                 as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                                 strsplit(frequency_calls[i,8],
                                                          split=",")[[1]][j],
                                                 as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,12],split=",")[[1]][j]))),sep="")
                                }
                            }

                        }
                        if(j>1){
                            c.[i]<-paste(c.[i],paste("c.",
                                                     strsplit(frequency_calls[i,7],
                                                              split=",")[[1]][j],
                                                     frequency_calls[i,4],">",
                                                     frequency_calls[i,5],
                                                     sep=""),
                                         sep=",")
                            c.complement[i]<-paste(c.complement[i],
                                                   paste("c.",
                                                         strsplit(frequency_calls[i,7],split=",")[[1]][j],
                                                         as.character(complement(DNAString(frequency_calls[i,4]))),
                                                         ">",
                                                         as.character(complement(DNAString(frequency_calls[i,5]))),
                                                         sep=""),
                                                   sep=",")
                            if(!is.na(strsplit(frequency_calls[i,11],
                                               split=",")[[1]][j])&&
                               !is.na(strsplit(frequency_calls[i,12],
                                               split=",")[[1]][j])&&
                               strsplit(frequency_calls[i,11],
                                        split=",")[[1]][j]!="NA"&&
                               strsplit(frequency_calls[i,12],
                                        split=",")[[1]][j]!="NA"&&
                               nchar(strsplit(frequency_calls[i,11],
                                              split=",")[[1]][j])==3&&
                               nchar(strsplit(frequency_calls[i,12],
                                              split=",")[[1]][j])==3){
                                p.[i]<-paste(p.[i],
                                             paste("p.",
                                                   strsplit(frequency_calls[i,9],
                                                            split=",")[[1]][j],
                                                   strsplit(frequency_calls[i,8],
                                                            split=",")[[1]][j],
                                                   strsplit(frequency_calls[i,10],
                                                            split=",")[[1]][j],
                                                   sep=""),sep=",")
                            }
                            if(!is.na(strsplit(frequency_calls[i,11],
                                               split=",")[[1]][j])&&
                               !is.na(strsplit(frequency_calls[i,12],
                                               split=",")[[1]][j])&&
                               strsplit(frequency_calls[i,11],
                                        split=",")[[1]][j]!="NA"&&
                               strsplit(frequency_calls[i,12],
                                        split=",")[[1]][j]!="NA"&&
                               (nchar(strsplit(frequency_calls[i,11],
                                               split=",")[[1]][j])!=3||
                                nchar(strsplit(frequency_calls[i,12],
                                               split=",")[[1]][j])!=3)){
                                if((nchar(strsplit(frequency_calls[i,11],
                                                   split=",")[[1]][j])%%3)!=0||
                                   (nchar(strsplit(frequency_calls[i,12],
                                                   split=",")[[1]][j])%%3)!=0){
                                    p.[i]<-paste(p.[i],
                                                 paste("p.",
                                                       as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                                       strsplit(frequency_calls[i,8],
                                                                split=",")[[1]][j],
                                                       "fs",sep=""),sep=",")
                                }
                                if((nchar(strsplit(frequency_calls[i,11],
                                                   split=",")[[1]][j])%%3)==0&&
                                   (nchar(strsplit(frequency_calls[i,12],
                                                   split=",")[[1]][j])%%3)==0){
                                    p.[i]<-paste(p.[i],
                                                 paste("p.",
                                                       as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                                       strsplit(frequency_calls[i,8],
                                                                split=",")[[1]][j],
                                                       as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,12],split=",")[[1]][j]))),sep=""),sep=",")
                                }
                            }
                        }
                    }
                }

                for(i in seq_along(frequency_calls[,1])){
                    progress$inc(1/length(results[,1]),
                                 detail=paste("-> Call ",i," out of ",
                                              length(results[,1])))
                    #SNPs
                    if(nchar(frequency_calls[i,4])==1&&
                       nchar(frequency_calls[i,5])==1){
                        snp_info<-snpsByOverlaps(snps,
                                                 paste(frequency_calls[i,2],":",
                                                       frequency_calls[i,3],"-",
                                                       frequency_calls[i,3],
                                                       sep=""))
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
                        if(!is.null(input$`1kgenomes`)){
                            snp_info<-gscores(g1000,
                                              GRanges(paste(frequency_calls[i,2],
                                                            ":",
                                                            frequency_calls[i,3],
                                                            sep="")))
                            if(length(snp_info)>0){
                                results$G1000_AF[i]<-max(snp_info$AF)
                            }
                        }
                        if(!is.null(input$exac)){
                            snp_info<-gscores(exac,
                                              GRanges(paste(frequency_calls[i,2],
                                                            ":",
                                                            frequency_calls[i,3],
                                                            sep="")))
                            if(length(snp_info)>0){
                                results$ExAC_AF[i]<-max(snp_info$AF)
                            }
                        }
                        if(!is.null(input$esp)){
                            snp_info<-gscores(esp6500,
                                              GRanges(paste(frequency_calls[i,2],
                                                            ":",
                                                            frequency_calls[i,3],
                                                            sep="")))
                            if(length(snp_info)>0){
                                results$ESP6500_AF[i]<-max(snp_info$AF)
                            }
                        }
                        if(!is.null(input$gad)){
                            snp_info<-gscores(gad,
                                              GRanges(paste(frequency_calls[i,2],
                                                            ":",
                                                            frequency_calls[i,3],
                                                            sep="")))
                            if(length(snp_info)>0){
                                results$GAD_AF[i]<-max(snp_info$AF)
                            }
                        }
                        if(!is.null(input$cosmic)){
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
                                                                                snp_info2$CNT,sep=",")
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
                        if(!is.null(input$clinvar)){
                            snp_info_temp<-data.frame()
                            for(j in seq_along(strsplit(frequency_calls[i,14],
                                                       split=",")[[1]])){
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
                                        snp_info2[1,5]==frequency_calls[i,5])||
                                       (snp_info2[1,4]==as.character(complement(DNAString(frequency_calls[i,4])))
                                          &&snp_info2[1,5]==as.character(complement(DNAString(frequency_calls[i,5]))))){
                                        results$ClinVar[i]<-snp_info2[1,6]
                                    }
                                }
                            }
                        }
                    }
                    #Indels
                    if(nchar(frequency_calls[i,4])!=1||
                       nchar(frequency_calls[i,5])!=1){
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
                        if(!is.null(input$cosmic)){
                            snp_info<-rowRanges(cosmic_67)[as.character(seqnames(rowRanges(cosmic_67)))==frequency_calls[i,2]&start(ranges(rowRanges(cosmic_67)))==frequency_calls[i,3]]
                            if(length(snp_info)>0){
                                for(j in seq_along(snp_info[,1])){
                                    if(snp_info$REF==frequency_calls[i,4]&&
                                       snp_info$ALT[[1]]==frequency_calls[i,5]||
                                       (snp_info$REF==as.character(complement(DNAString(frequency_calls[i,4])))
                                          &&snp_info$ALT[[1]]==as.character(complement(DNAString(frequency_calls[i,5]))))){
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
                                                                           names(snp_info[j,]),sep=",")
                                                results$Cosmic_Counts[i]<-paste(results$Cosmic_Counts[i],
                                                                                snp_info2$CNT,sep=",")
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
                        if(!is.null(input$clinvar)){
                            snp_info_temp<-data.frame()
                            for(j in seq_along(strsplit(frequency_calls[i,14],
                                                       split=",")[[1]])){
                                if(!is.na(strsplit(frequency_calls[i,14],
                                                   split=",")[[1]][j])){
                                    temp<-clinvar[grep(strsplit(frequency_calls[i,14],split=",")[[1]][j],
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
                                           snp_info2[j,5]==substr(frequency_calls[i,5],2,nchar(frequency_calls[i,5]))){
                                            results$ClinVar[i]<-snp_info2[j,6]
                                        }
                                        if(snp_info2[j,5]=="-"&&
                                           snp_info2[j,4]==substr(frequency_calls[i,4],2,nchar(frequency_calls[i,4]))){
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
                        limits<-c(seq(1,length(results[!is.na(results[,6]),6]),
                                      3),
                                  length(results[!is.na(results[,6]),6]))
                    }
                    suppressWarnings(ncbi<-ncbi_snp_query(abfrage[1:3]))
                    for(i in 2:(length(limits)-1)){
                        suppressWarnings(temp<-ncbi_snp_query(abfrage[limits[i]:(limits[i+1]-1)]))
                        ncbi<-rbind(ncbi,temp)
                    }
                }
                for(i in seq_along(results[,1])){
                    if(!is.na(results[i,6])){
                        results$dbSNP_MAF[i]<-as.numeric(max(ncbi[ncbi[,1]==results[i,6],10]))
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
                progress$close()

                results<-cbind(results,Prediction=NA,Score=NA)
                progress <- shiny::Progress$new()
                progress$set(message = "6. Determine Extended Set of Characteristics (prediction)",
                             value = 0)
                if(input$predict!="PolyPhen2"){
                    for(i in seq(1,length(results[,6]))[!is.na(results[,6])]){
                        progress$inc(1/length(seq(1,length(results[,6]))[!is.na(results[,6])]),
                                     detail=paste("-> Call ",i," out of ",
                                                  length(results[,1])))
                        suppressWarnings(info<-select(SIFT.Hsapiens.dbSNP137,
                                                      keys=substr(results[i,6],3,nchar(results[i,6]))))
                        if(length(info)>0){
                            if(input$predict=="SIFT"){
                                #score <0.05 -> damaging (else: tolerated)
                                results$Prediction[i]<-info[which.min(info[,15]),16]
                                results$Score[i]<-min(info[,15])
                            }
                            if(input$predict=="Provean"){
                                #score <-2.5 -> deleterious (else: neutral)
                                results$Prediction[i]<-info[which.min(info[,11]),12]
                                results$Score[i]<-min(info[,11])
                            }
                        }
                    }
                }
                if(input$predict=="PolyPhen2"){
                    #Polyphen (probably damaging, possibly damaging, benign, unknown); probability of variant being damaging
                    for(i in seq(1,length(results[,6]))[!is.na(results[,6])]){
                        progress$inc(1/length(seq(1,length(results[,6]))[!is.na(results[,6])]),
                                     detail=paste("-> Call ",i," out of ",
                                                  length(results[,1])))
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
                for(i in seq_along(overview4[,1])){
                    for(j in 2:length(checkpoint[1,])){
                        if(!is.na(checkpoint[i,j])){
                            checkpoint[i,j]<-6
                        }
                    }
                }
                if(is.null(input$dbSNP)){
                    database_calls<-cbind(results[,c(1:5,8:(length(results[1,])))],
                                          c.,c.complement,p.)
                }
                if(!is.null(input$dbSNP)){
                    database_calls<-cbind(results,c.,c.complement,p.)
                }
                write.table(database_calls,
                            paste(input$output_folder,
                                  "/Results_Databases.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                write.table(checkpoint,
                            paste(input$output_folder,"/checkpoint.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                progress$close()


                #7. Final Filtration
                log_info<-c(log_info,"7. Perform Final Filtration<br>")
                output$log_info<-renderUI({HTML(log_info)})
                progress <- shiny::Progress$new()
                progress$set(message = "7. Perform final filtration", value = 0)

                if(input$stricter_thresholds=="No"){
                    dp<-input$dp
                    nr_alt<-input$nr_alt
                    vaf<-input$vaf
                    low_bq<-input$bq
                    bq_diff<-input$bq_diff
                }
                if(input$stricter_thresholds=="Yes"){
                    dp<-input$dp2
                    nr_alt<-input$nr_alt2
                    vaf<-input$vaf2
                    low_bq<-input$bq2
                    bq_diff<-input$bq_diff2
                }
                nrsamples<-input$nr_samples
                nrsamples_high<-ceiling(length(overview4[,1])/2)
                if(nrsamples_high==1){
                    nrsamples_high<-2
                }
                if(input$predict=="SIFT"){
                    limit_provean<-input$damaging_safe1
                    limit_provean2<-input$tolerated_safe1
                }
                if(input$predict=="Provean"){
                    limit_provean<-input$damaging_safe2
                    limit_provean2<-input$tolerated_safe2
                }
                if(input$predict=="PolyPhen2"){
                    limit_provean<-input$damaging_safe3
                    limit_provean2<-input$tolerated_safe3
                }

                if(!is.null(input$primerPositions)){
                    primer_temp<-input$primerPositions
                    primer<-read.table(primer_temp$datapath,
                                       header=FALSE,sep="\t",
                                       stringsAsFactors=FALSE)
                }
                if(!is.null(input$hotspots)){
                    hotspots_temp<-input$hotspots
                    hotspots<-read.table(hotspots_temp$datapath,header=TRUE,
                                         sep="\t",stringsAsFactors=FALSE)
                }

                results<-cbind(frequency_calls[,c(1:5,14:16,6,13)],
                               database_calls[,c((length(database_calls[1,])-2):length(database_calls[1,]))],
                               frequency_calls[,c(11,12)],
                               Nr_Ref=frequency_calls$Nr_Ref,
                               Nr_Alt=frequency_calls$Nr_Alt,
                               DP=frequency_calls$DP,
                               VAF=frequency_calls$VAF,
                               frequency_calls[,c(17:(length(frequency_calls[1,])-14))],
                               Called=rowSums(frequency_calls[,c(17:(length(frequency_calls[1,])-14))],na.rm=TRUE),
                               database_calls[,c(6:(length(database_calls[1,])-3))],
                               frequency_calls[,c((length(frequency_calls[1,])-9):(length(frequency_calls[1,])))])

                artifact_because<-data.frame(nr_samples=rep(NA,length(frequency_calls[,1])),
                                             nr_samples_similar=rep(NA,length(frequency_calls[,1])),
                                             nr_databases=rep(NA,length(frequency_calls[,1])),
                                             polymorphism_db=rep(NA,length(frequency_calls[,1])),
                                             mutation_db=rep(NA,length(frequency_calls[,1])),
                                             cosmic_nr=rep(NA,length(frequency_calls[,1])),
                                             Poly_freq=rep(NA,length(frequency_calls[,1])))

                #filter frequency
                if(input$stricter_thresholds=="Yes"){
                    progress$inc(1/13,detail="->  Consider Frequency and Base Quality")
                    include1<-results$DP>=dp
                    include2<-results$Nr_Alt>=nr_alt
                    include3<-(results$VAF*100)>=vaf
                    include4<-results$BQ_ALT>=low_bq
                    include5<-(results$BQ_REF-results$BQ_ALT)<=bq_diff
                    temp<-results[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                    results<-temp
                    temp<-frequency_calls[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                    frequency_calls<-temp
                    temp<-database_calls[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                    database_calls<-temp
                    temp<-artifact_because[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                    artifact_because<-temp
                }
                if(input$stricter_thresholds=="No"){
                    progress$inc(1/13)
                }

                #nr of samples
                progress$inc(1/13,
                             detail="->  Consider samples with the same call")
                progress_small <- shiny::Progress$new()
                progress_small$set(message = "", value = 0)
                for(i in seq_along(results[,1])){
                    progress_small$inc(1/length(results[,1]),
                                       detail=paste("-> Call ",i," out of ",
                                                    length(results[,1])))
                    artifact_because[i,1]<-length(combined_calls[intersect(intersect(grep(results[i,2],combined_calls[,2]),grep(results[i,3],combined_calls[,3])),intersect(grep(results[i,4],combined_calls[,4]),grep(results[i,5],combined_calls[,5]))),1])
                }
                progress_small$close()

                progress$inc(1/13,
                             detail="->  Consider samples with a call at the same position")
                progress_small <- shiny::Progress$new()
                progress_small$set(message = "", value = 0)
                for(i in seq_along(results[,1])){
                    progress_small$inc(1/length(results[,1]),
                                       detail=paste("-> Call ",i," out of ",
                                                    length(results[,1])))
                    artifact_because[i,2]<-length(combined_calls[intersect(grep(results[i,2],combined_calls[,2]),grep(results[i,3],combined_calls[,3])),1])
                }
                progress_small$close()

                progress$inc(1/13,detail="->  Consider background information")
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
                progress$inc(1/13,detail="->  Consider nr of databases")
                if(length(database_calls[1,])>10){
                    if(length(grep("dbSNP",names(database_calls)))>0){
                        for(i in seq_along(database_calls[,1])){
                            if(!is.na(results$dbSNP[i])){
                                artifact_because[i,3]<-sum(artifact_because[i,3],
                                                           1,na.rm=TRUE)
                                if(!is.na(results$dbSNP_MAF[i])&&
                                   as.numeric(results$dbSNP_MAF[i])<=0.001){
                                    artifact_because[i,5]<-sum(artifact_because[i,5],
                                                               1,na.rm=TRUE)
                                }
                                if(!is.na(results$dbSNP_MAF[i])&&
                                   as.numeric(results$dbSNP_MAF[i])>0.001){
                                    artifact_because[i,4]<-sum(artifact_because[i,4],
                                                               1,na.rm=TRUE)
                                }
                            }
                        }
                    }
                    if(length(grep("G1000_AF",names(database_calls)))>0){
                        for(i in seq_along(database_calls[,1])){
                            if(!is.na(results$G1000_AF[i])){
                                artifact_because[i,3]<-sum(artifact_because[i,3],
                                                           1,na.rm=TRUE)
                                if(as.numeric(results$G1000_AF[i])<=0.001){
                                    artifact_because[i,5]<-sum(artifact_because[i,5],
                                                               1,na.rm=TRUE)
                                }
                                if(as.numeric(results$G1000_AF[i])>0.001){
                                    artifact_because[i,4]<-sum(artifact_because[i,4],
                                                               1,na.rm=TRUE)
                                }
                            }
                        }
                    }
                    if(length(grep("ExAC_AF",names(database_calls)))>0){
                        for(i in seq_along(database_calls[,1])){
                            if(!is.na(results$ExAC_AF[i])){
                                artifact_because[i,3]<-sum(artifact_because[i,3],
                                                           1,na.rm=TRUE)
                                if(as.numeric(results$ExAC_AF[i])<=0.0005){
                                    artifact_because[i,5]<-sum(artifact_because[i,5],
                                                               1,na.rm=TRUE)
                                }
                                if(as.numeric(results$ExAC_AF[i])>0.0005){
                                    artifact_because[i,4]<-sum(artifact_because[i,4],
                                                               1,na.rm=TRUE)
                                }
                            }
                        }
                    }
                    if(length(grep("ESP6500_AF",names(database_calls)))>0){
                        for(i in seq_along(database_calls[,1])){
                            if(!is.na(results$ESP6500_AF[i])){
                                artifact_because[i,3]<-sum(artifact_because[i,3],
                                                           1,na.rm=TRUE)
                                if(as.numeric(results$ESP6500_AF[i])<=0.0003){
                                    artifact_because[i,5]<-sum(artifact_because[i,5],
                                                               1,na.rm=TRUE)
                                }
                                if(as.numeric(results$ESP6500_AF[i])>0.0003){
                                    artifact_because[i,4]<-sum(artifact_because[i,4],
                                                               1,na.rm=TRUE)
                                }
                            }
                        }
                    }
                    if(length(grep("GAD_AF",names(database_calls)))>0){
                        for(i in seq_along(database_calls[,1])){
                            if(!is.na(results$GAD_AF[i])){
                                artifact_because[i,3]<-sum(artifact_because[i,3],
                                                           1,na.rm=TRUE)
                                if(as.numeric(results$GAD_AF[i])<=0.001){
                                    artifact_because[i,5]<-sum(artifact_because[i,5],
                                                               1,na.rm=TRUE)
                                }
                                if(as.numeric(results$GAD_AF[i])>0.001){
                                    artifact_because[i,4]<-sum(artifact_because[i,4],
                                                               1,na.rm=TRUE)
                                }
                            }
                        }
                    }
                    if(length(grep("CosmicID",names(database_calls)))>0){
                        for(i in seq_along(database_calls[,1])){
                            if(!is.na(results$CosmicID[i])){
                                artifact_because[i,3]<-sum(artifact_because[i,3],
                                                           1,na.rm=TRUE)
                                artifact_because[i,6]<-sum(as.numeric(strsplit(as.character(database_calls$Cosmic_Counts[i]),split=",")[[1]]))
                                if(artifact_because[i,6]>20){
                                    artifact_because[i,5]<-sum(artifact_because[i,5],
                                                               1,na.rm=TRUE)
                                }
                                if(artifact_because[i,6]<=20){
                                    artifact_because[i,4]<-sum(artifact_because[i,4],
                                                               1,na.rm=TRUE)
                                }
                            }
                        }
                    }
                    if(length(grep("ClinVar",names(database_calls)))>0){
                        for(i in seq_along(database_calls[,1])){
                            if(!is.na(results$ClinVar[i])){
                                artifact_because[i,3]<-sum(artifact_because[i,3],
                                                           1,na.rm=TRUE)
                                if(length(grep("Pathogenic",results$ClinVar[i],
                                               ignore.case = TRUE))>0){
                                    artifact_because[i,5]<-sum(artifact_because[i,5],
                                                               1,na.rm=TRUE)
                                }
                                if(length(grep("Benign",results$ClinVar[i],
                                               ignore.case=TRUE))>0){
                                    artifact_because[i,4]<-sum(artifact_because[i,4],
                                                               1,na.rm=TRUE)
                                }
                            }
                        }
                    }
                }

                #tolerated and freq
                progress$inc(1/13,detail="->  Consider VAF when tolerated")
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
                progress$inc(1/13,
                             detail="->  Consider VAF when high nr of samples")
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

                #test for strand bias (8 von 15)
                progress$inc(1/13,detail="->  Consider strand bias")
                strandbias<-rep(NA,length(results[,1]))
                for(i in seq_along(results[,1])){
                    if(!is.na(results$Nr_Ref_fwd[i])&&
                       !is.na(results$Nr_Alt_fwd[i])&&
                       !is.na(results$Nr_Ref_rev[i])&&
                       !is.na(results$Nr_Alt_rev[i])){
                        test<-fisher.test(x=matrix(c(results$Nr_Ref_fwd[i],
                                                     results$Nr_Alt_fwd[i],
                                                     results$Nr_Ref_rev[i],
                                                     results$Nr_Alt_rev[i]),
                                                   ncol=2))
                        strandbias[i]<-test$p.value
                    }
                    if(!is.null(input$primerPositions)){
                        chr<-as.character(results[i,2])==as.character(primer[,1])
                        start<-results[i,3]>primer[,2]
                        end<-(as.numeric(results[i,3])+nchar(results[i,4])-1)<=primer[,3]
                        if(sum(rowSums(cbind(chr,start,end))==3)>0){
                            strandbias[i]<-2
                        }
                    }
                }

                #check for hotspots
                progress$inc(1/13,detail="->  Consider hotspot list")
                hotspot<-rep(NA,length(results[,1]))
                progress_small <- shiny::Progress$new()
                progress_small$set(message = "", value = 0)
                if(!is.null(input$hotspots)){
                    for(i in seq_along(hotspots[,1])){
                        progress_small$inc(1/length(hotspots[,1]),
                                           detail=paste("->  Hotspot",i,
                                                        "out of",
                                                        length(hotspots[,1])))
                        found1<-grep(hotspots[i,1],results$Gene)
                        if(length(found1)>0){
                            if(length(grep("fs",hotspots[i,2]))==0&&
                               length(grep("del",hotspots[i,2]))==0&&
                               length(grep("ins",hotspots[i,2]))==0){
                                #Just an SNV
                                found2<-grep(hotspots[i,2],results$p.,
                                             fixed=TRUE)
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
                                searchstring<-substr(hotspots[i,2],
                                                     2,(nchar(hotspots[i,2])-2))
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

                progress_small$close()

                ##final filtration
                results<-cbind(results,strandbias,
                               artifact_because[,c(1:2)],Category=NA)

                #artifact score
                progress$inc(1/13,detail="->  Perform final filtration")
                artifact_score<-rep(0,length(results[,1]))
                progress_small <- shiny::Progress$new()
                progress_small$set(message = "Calculate Artifact Score",
                                   value = 0)
                if(input$artifact_score=="No"){
                    for(i in seq_along(results[,1])){
                        progress_small$inc(1/length(results[,1]),
                                           detail=paste("-> Call",i,"out of",
                                                        length(results[,1])))
                        if(results$nr_samples[i]>nrsamples){
                            artifact_score[i]<-artifact_score[i]+2
                        }
                        if(results$nr_samples[i]>nrsamples_high&&
                           is.na(hotspot[i])){
                            artifact_score[i]<-artifact_score[i]+2
                        }
                        if((nchar(results$Ref[i])>1||nchar(results$Alt[i])>1)&&
                           results$nr_samples_similar[i]>results$nr_samples[i]){
                            artifact_score[i]<-artifact_score[i]+1
                        }
                        if((nchar(results$Ref[i])>1||nchar(results$Alt[i])>1)&&
                           !is.na(results$VAF[i])&&results$VAF[i]<0.05){
                            artifact_score[i]<-artifact_score[i]+1
                        }
                        if(!is.na(artifact_because[i,7])&&
                           artifact_because[i,7]==2){
                            artifact_score[i]<-artifact_score[i]+2
                        }
                        if(is.null(input$primerPositions)||
                           (!is.na(results$strandbias[i])&&
                            results$strandbias[i]!=2)){
                            if(!is.na(results$strandbias[i])&&
                               results$strandbias[i]<0.001){
                                artifact_score[i]<-artifact_score[i]+1
                            }
                            if(!is.na(results$Nr_Alt_fwd[i])&&
                               !is.na(results$Nr_Alt_rev[i])&&
                               (results$Nr_Alt_fwd[i]>=(nr_alt/2)&&
                                results$Nr_Alt_rev[i]>=(nr_alt/2))&&
                               results$strandbias[i]<0.001){
                                artifact_score[i]<-artifact_score[i]-1
                            }
                            if(!is.na(results$Nr_Ref_fwd[i])&&
                               !is.na(results$Nr_Alt_fwd[i])&&
                               (results$Nr_Alt_fwd[i]<=2&&
                                results$Nr_Ref_fwd[i]>=(dp-nr_alt)/2)&&
                               results$strandbias[i]>=0.001){
                                artifact_score[i]<-artifact_score[i]+1
                            }
                            if(!is.na(results$Nr_Ref_fwd[i])&&
                               !is.na(results$Nr_Alt_fwd[i])&&
                               (results$Nr_Alt_fwd[i]<=2&&
                                results$Nr_Ref_fwd[i]<(dp-nr_alt)/2)&&
                               results$strandbias[i]<0.001){
                                artifact_score[i]<-artifact_score[i]-1
                            }
                            if(!is.na(results$Nr_Ref_rev[i])&&
                               !is.na(results$Nr_Alt_rev[i])&&
                               (results$Nr_Alt_rev[i]<=2&&
                                results$Nr_Ref_rev[i]>=(dp-nr_alt)/2)&&
                               results$strandbias[i]>=0.001){
                                artifact_score[i]<-artifact_score[i]+1
                            }
                            if(!is.na(results$Nr_Ref_rev[i])&&
                               !is.na(results$Nr_Alt_rev[i])&&
                               (results$Nr_Alt_rev[i]<=2&&
                                results$Nr_Ref_rev[i]<(dp-nr_alt)/2)&&
                               results$strandbias[i]<0.001){
                                artifact_score[i]<-artifact_score[i]-1
                            }
                        }
                        if(!is.null(input$primerPositions)&&
                           !is.na(results$strandbias[i])&&
                           results$strandbias[i]==2){
                            artifact_score[i]<-artifact_score[i]-1
                        }
                        if(!is.na(results$VAF[i])&&results$VAF[i]<0.02){
                            artifact_score[i]<-artifact_score[i]+2
                        }
                        if(is.na(artifact_because[i,3])&&
                           !is.na(results$VAF[i])&&results$VAF[i]<0.10){
                            artifact_score[i]<-artifact_score[i]+1
                        }
                        if(is.na(artifact_because[i,3])&&
                           results$nr_samples[i]>nrsamples_high){
                            artifact_score[i]<-artifact_score[i]+1
                        }
                        if((!is.na(results$Score[i])&&
                            results$Score[i]<limit_provean)){
                            artifact_score[i]<-artifact_score[i]-1
                        }
                        if(!is.na(results$Score[i])&&
                           results$Score[i]>limit_provean2&&
                           !is.na(artifact_because[i,7])&&
                           artifact_because[i,7]==0){
                            artifact_score[i]<-artifact_score[i]+1
                        }
                        if(results$Called[i]>=4){
                            artifact_score[i]<-artifact_score[i]-1
                        }
                        if(results$Called[i]>=5){
                            artifact_score[i]<-artifact_score[i]-1
                        }
                        if(results$Called[i]>=6){
                            artifact_score[i]<-artifact_score[i]-1
                        }
                        if(results$Called[i]==1){
                            artifact_score[i]<-artifact_score[i]+1
                        }
                        if(!is.na(results$BQ_ALT[i])&&
                           results$BQ_ALT[i]<(mean(results$BQ_ALT,na.rm=TRUE)-3*sd(results$BQ_ALT,na.rm=TRUE))){
                            artifact_score[i]<-artifact_score[i]+4
                        }
                        if(!is.na(hotspot[i])){
                            artifact_score[i]<-artifact_score[i]-3
                        }
                        if(!is.na(results$LoFreq[i])&&
                           !is.na(results$FreeBayes[i])&&
                           !is.na(results$VarDict[i])&&
                           results$LoFreq[i]==1&&results$FreeBayes[i]==1&&
                           results$VarDict[i]==1){
                            artifact_score[i]<-artifact_score[i]-3
                        }
                        if(artifact_score[i]>-1){
                            results$Category[i]<-paste("Artifact (",
                                                       artifact_score[i],")",
                                                       sep="")
                        }
                        if(artifact_score[i]<=-1&&is.na(hotspot[i])){
                            results$Category[i]<-paste("Probably True (",
                                                       artifact_score[i],")",
                                                       sep="")
                        }
                        if(artifact_score[i]<=-1&&!is.na(hotspot[i])){
                            results$Category[i]<-paste("Hotspot (",
                                                       artifact_score[i],")",
                                                       sep="")
                        }
                    }
                }
                if(input$artifact_score=="Yes"){
                    for(i in seq_along(results[,1])){
                        progress_small$inc(1/length(results[,1]),
                                           detail=paste("-> Call",i,"out of",
                                                        length(results[,1])))
                        if(results$nr_samples[i]>nrsamples){
                            artifact_score[i]<-artifact_score[i]+input$detectedLow
                        }
                        if(results$nr_samples[i]>nrsamples_high&&
                           is.na(hotspot[i])){
                            artifact_score[i]<-artifact_score[i]+input$detectedHigh
                        }
                        if((nchar(results$Ref[i])>1||nchar(results$Alt[i])>1)&&
                           results$nr_samples_similar[i]>results$nr_samples[i]){
                            artifact_score[i]<-artifact_score[i]+input$isIndel
                        }
                        if((nchar(results$Ref[i])>1||nchar(results$Alt[i])>1)&&
                           !is.na(results$VAF[i])&&results$VAF[i]<0.05){
                            artifact_score[i]<-artifact_score[i]+input$isIndelVAF
                        }
                        if(!is.na(artifact_because[i,7])&&
                           artifact_because[i,7]==2){
                            artifact_score[i]<-artifact_score[i]+input$detectedLowVAF
                        }
                        if(is.null(input$primerPositions)||
                           (!is.na(results$strandbias[i])&&
                            results$strandbias[i]!=2)){
                            if(!is.na(results$strandbias[i])&&
                               results$strandbias[i]<0.001){
                                artifact_score[i]<-artifact_score[i]+input$noPrimerP
                            }
                            if(!is.na(results$Nr_Alt_fwd[i])&&
                               !is.na(results$Nr_Alt_rev[i])&&
                               (results$Nr_Alt_fwd[i]>=(nr_alt/2)&&
                                results$Nr_Alt_rev[i]>=(nr_alt/2))&&
                               results$strandbias[i]<0.001){
                                artifact_score[i]<-artifact_score[i]+input$primerPAlt
                            }
                            if(!is.na(results$Nr_Ref_fwd[i])&&
                               !is.na(results$Nr_Alt_fwd[i])&&
                               (results$Nr_Alt_fwd[i]<=2&&
                                results$Nr_Ref_fwd[i]>=(dp-nr_alt)/2)&&
                               results$strandbias[i]>=0.001){
                                artifact_score[i]<-artifact_score[i]+input$noPrimerPFwd
                            }
                            if(!is.na(results$Nr_Ref_fwd[i])&&
                               !is.na(results$Nr_Alt_fwd[i])&&
                               (results$Nr_Alt_fwd[i]<=2&&
                                results$Nr_Ref_fwd[i]<(dp-nr_alt)/2)&&
                               results$strandbias[i]<0.001){
                                artifact_score[i]<-artifact_score[i]+input$primerPFwd
                            }
                            if(!is.na(results$Nr_Ref_rev[i])&&
                               !is.na(results$Nr_Alt_rev[i])&&
                               (results$Nr_Alt_rev[i]<=2&&
                                results$Nr_Ref_rev[i]>=(dp-nr_alt)/2)&&
                               results$strandbias[i]>=0.001){
                                artifact_score[i]<-artifact_score[i]+input$noPrimerPRev
                            }
                            if(!is.na(results$Nr_Ref_rev[i])&&
                               !is.na(results$Nr_Alt_rev[i])&&
                               (results$Nr_Alt_rev[i]<=2&&
                                results$Nr_Ref_rev[i]<(dp-nr_alt)/2)&&
                               results$strandbias[i]<0.001){
                                artifact_score[i]<-artifact_score[i]+input$primerPRev
                            }
                        }
                        if(!is.null(input$primerPositions)&&
                           !is.na(results$strandbias[i])&&
                           results$strandbias[i]==2){
                            artifact_score[i]<-artifact_score[i]+input$primerLocation
                        }
                        if(!is.na(results$VAF[i])&&results$VAF[i]<0.02){
                            artifact_score[i]<-artifact_score[i]+input$vafLow
                        }
                        if(is.na(artifact_because[i,3])&&
                           !is.na(results$VAF[i])&&results$VAF[i]<0.10){
                            artifact_score[i]<-artifact_score[i]+input$databaseVAF
                        }
                        if(is.na(artifact_because[i,3])&&
                           results$nr_samples[i]>nrsamples_high){
                            artifact_score[i]<-artifact_score[i]+input$databaseHigh
                        }
                        if((!is.na(results$Score[i])&&
                            results$Score[i]<limit_provean)){
                            artifact_score[i]<-artifact_score[i]+input$predictionSafe
                        }
                        if(!is.na(results$Score[i])&&
                           results$Score[i]>limit_provean2&&
                           !is.na(artifact_because[i,7])&&
                           artifact_because[i,7]==0){
                            artifact_score[i]<-artifact_score[i]+input$predictionVAF
                        }
                        if(results$Called[i]>=input$nrcaller4){
                            artifact_score[i]<-artifact_score[i]+input$reward4
                        }
                        if(results$Called[i]>=input$nrcaller5){
                            artifact_score[i]<-artifact_score[i]+input$reward5
                        }
                        if(results$Called[i]>=input$nrcaller6){
                            artifact_score[i]<-artifact_score[i]+input$reward6
                        }
                        if(results$Called[i]==1){
                            artifact_score[i]<-artifact_score[i]+input$oneCaller
                        }
                        if(!is.na(results$BQ_ALT[i])&&
                           results$BQ_ALT[i]<(mean(results$BQ_ALT,na.rm=TRUE)-3*sd(results$BQ_ALT,na.rm=TRUE))){
                            artifact_score[i]<-artifact_score[i]+input$BQ_AltMean
                        }
                        if(!is.na(hotspot[i])){
                            artifact_score[i]<-artifact_score[i]+input$knownHotspot
                        }
                        temp<-frequency_calls[i,17:(length(frequency_calls[1,])-14)]
                        temp<-temp[,!is.na(temp)]
                        if(length(intersect(names(temp),
                                            input$overlapTools))==length(input$overlapTools)){
                            artifact_score[i]<-artifact_score[i]+input$overlapReward
                        }
                        if(artifact_score[i]>=input$artifactThreshold){
                            results$Category[i]<-paste("Artifact (",
                                                       artifact_score[i],")",
                                                       sep="")
                        }
                        if(artifact_score[i]<input$artifactThreshold&&
                           is.na(hotspot[i])){
                            results$Category[i]<-paste("Probably True (",
                                                       artifact_score[i],")",
                                                       sep="")
                        }
                        if(artifact_score[i]<input$artifactThreshold&&
                           !is.na(hotspot[i])){
                            results$Category[i]<-paste("Hotspot (",
                                                       artifact_score[i],")",
                                                       sep="")
                        }
                    }
                }
                progress_small$close()

                #polymorphism score
                progress$inc(1/13,detail="->  Perform final filtration")
                poly_score<-rep(0,length(results[,1]))
                cosmic_flag<-rep(FALSE,length(results[,1]))
                progress_small <- shiny::Progress$new()
                progress_small$set(message = "Calculate Polymorphism Score",
                                   value = 0)
                if(input$polymorphism_score=="No"){
                    for(i in seq_along(results[,1])){
                        progress_small$inc(1/length(results[,1]),
                                           detail=paste("-> Call",i,"out of",
                                                        length(results[,1])))
                        if(!is.na(results$nr_samples[i])&&
                           results$nr_samples[i]>nrsamples){
                            poly_score[i]<-poly_score[i]+1
                        }
                        if(!is.na(results$nr_samples[i])&&
                           results$nr_samples[i]==1){
                            poly_score[i]<-poly_score[i]-1
                        }
                        if(!is.na(artifact_because[i,4])&&
                           artifact_because[i,4]>=2){
                            poly_score[i]<-poly_score[i]+1
                        }
                        if(!is.na(artifact_because[i,4])&&
                           artifact_because[i,4]>=4){
                            poly_score[i]<-poly_score[i]+1
                        }
                        if(!is.na(artifact_because[i,5])&&
                           artifact_because[i,5]>=2){
                            poly_score[i]<-poly_score[i]-1
                        }
                        if(is.na(artifact_because[i,4])){
                            poly_score[i]<-poly_score[i]-1
                        }
                        if(results$Called[i]>=6){
                            poly_score[i]<-poly_score[i]+1
                        }
                        if(!is.na(results$Consequence[i])&&
                           vcountPattern(pattern="frameshift",
                                         as.character(results$Consequence[i]))>0&&
                           vcountPattern(pattern="*",
                                         as.character(results$p.[i]),
                                         fixed = TRUE)==0){
                            poly_score[i]<-poly_score[i]+1
                        }
                        if(!is.na(artifact_because[i,7])&&
                           artifact_because[i,7]==1){
                            poly_score[i]<-poly_score[i]+1
                        }
                        if(!is.na(results$Prediction[i])&&
                           (results$Prediction[i]=="Tolerated"||
                            results$Prediction[i]=="benign"||
                            results$Prediction[i]=="Neutral")&&
                           results$Score[i]>=limit_provean2){
                            poly_score[i]<-poly_score[i]+1
                        }
                        if(!is.na(results$Score[i])&&!is.na(results$p.[i])&&
                           as.character(results$p.[i])!="NA"
                           &&(results$Score[i]<=limit_provean||
                              vcountPattern(pattern="*",
                                            as.character(results$p.[i]),
                                            fixed = TRUE)>0)){
                            poly_score[i]<-poly_score[i]-1
                        }
                        if(!is.na(results$Cosmic_Counts[i])&&
                           results$Cosmic_Counts[i]>100){
                            cosmic_flag[i]<-TRUE
                        }
                        if(is.na(hotspot[i])&&poly_score[i]>=2&&
                           cosmic_flag[i]==TRUE){
                            results$Category[i]<-paste(results$Category[i],
                                                       "Likely Polymorphism",
                                                       sep="")
                        }
                        if(is.na(hotspot[i])&&((poly_score[i]>=2&&
                                                cosmic_flag[i]==FALSE)||
                                               poly_score[i]>=3)){
                            results$Category[i]<-"Polymorphism"
                        }
                    }
                }
                if(input$polymorphism_score=="Yes"){
                    for(i in seq_along(results[,1])){
                        progress_small$inc(1/length(results[,1]),
                                           detail=paste("-> Call",i,"out of",
                                                        length(results[,1])))
                        if(!is.na(results$nr_samples[i])&&
                           results$nr_samples[i]>nrsamples){
                            poly_score[i]<-poly_score[i]+input$polyDetected
                        }
                        if(!is.na(results$nr_samples[i])&&
                           results$nr_samples[i]==1){
                            poly_score[i]<-poly_score[i]+input$polyDetectedOnce
                        }
                        if(!is.na(artifact_because[i,4])&&
                           artifact_because[i,4]>=input$polyDatabasesPolyLow){
                            poly_score[i]<-poly_score[i]+input$polyDatabasesPolyLowReward
                        }
                        if(!is.na(artifact_because[i,4])&&
                           artifact_because[i,4]>=input$polyDatabasesPolyHigh){
                            poly_score[i]<-poly_score[i]+input$polyDatabasesPolyHighReward
                        }
                        if(!is.na(artifact_because[i,5])&&
                           artifact_because[i,5]>=input$polyDatabasesMut){
                            poly_score[i]<-poly_score[i]+input$polyDatabasesMutReward
                        }
                        if(is.na(artifact_because[i,4])){
                            poly_score[i]<-poly_score[i]+input$polyNoDatabase
                        }
                        if(results$Called[i]>=input$polyDatabases){
                            poly_score[i]<-poly_score[i]+input$polyDatabasesReward
                        }
                        if(!is.na(results$Consequence[i])&&
                           vcountPattern(pattern="frameshift",
                                         as.character(results$Consequence[i]))>0
                           &&vcountPattern(pattern="*",
                                           as.character(results$p.[i]),
                                           fixed = TRUE)==0){
                            poly_score[i]<-poly_score[i]+input$polyEffect
                        }
                        if(!is.na(artifact_because[i,7])&&
                           artifact_because[i,7]==1){
                            poly_score[i]<-poly_score[i]+input$polyVAF
                        }
                        if(!is.na(results$Prediction[i])&&
                           (results$Prediction[i]=="Tolerated"||
                            results$Prediction[i]=="benign"||
                            results$Prediction[i]=="Neutral")&&
                           results$Score[i]>=limit_provean2){
                            poly_score[i]<-poly_score[i]+input$polyPrediction
                        }
                        if(!is.na(results$Score[i])&&!is.na(results$p.[i])&&
                           as.character(results$p.[i])!="NA"&&
                           (results$Score[i]<=limit_provean||
                            vcountPattern(pattern="*",
                                          as.character(results$p.[i]),
                                          fixed = TRUE)>0)){
                            poly_score[i]<-poly_score[i]+input$polyPredictionEffect
                        }
                        if(!is.na(results$Cosmic_Counts[i])&&
                           results$Cosmic_Counts[i]>input$polyCosmic){
                            cosmic_flag[i]<-TRUE
                        }
                        if(is.na(hotspot[i])&&
                           poly_score[i]>=input$polyThresholdCritical&&
                           cosmic_flag[i]==TRUE){
                            results$Category[i]<-paste(results$Category[i],
                                                       "Likely Polymorphism",
                                                       sep="")
                        }
                        if(is.na(hotspot[i])&&
                           ((poly_score[i]>=input$polyThresholdCritical&&
                             cosmic_flag[i]==FALSE)||
                            poly_score[i]>=input$polyThreshold)){
                            results$Category[i]<-"Polymorphism"
                        }
                    }
                }
                progress_small$close()

                #corrections
                progress$inc(1/13,detail="->  Perform final filtration")
                progress_small <- shiny::Progress$new()
                progress_small$set(message = "Correct Scores", value = 0)
                if(input$artifact_score=="No"){
                    for(i in seq_along(results[,1])){
                        progress_small$inc(1/length(results[,1]),
                                           detail=paste("-> Call",i,"out of",
                                                        length(results[,1])))
                        if((poly_score[i]>=2&&cosmic_flag[i]==TRUE&&
                            is.na(hotspot[i]))||
                           (is.na(hotspot[i])&&((poly_score[i]>=2&&
                                                 cosmic_flag[i]==FALSE)||
                                                poly_score[i]>=3))){
                            if(!is.na(results$VAF[i])&&results$VAF[i]<=0.1){
                                artifact_score[i]<-artifact_score[i]+5
                                if(artifact_score[i]>-1){
                                    results$Category[i]<-paste("Artifact (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<=-1&&is.na(hotspot[i])){
                                    results$Category[i]<-paste("Probably True (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<=-1&&!is.na(hotspot[i])){
                                    results$Category[i]<-paste("Hotspot (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                            }
                            if(!is.na(results$VAF[i])&&results$VAF[i]<=0.2){
                                artifact_score[i]<-artifact_score[i]+2
                                if(artifact_score[i]>-1){
                                    results$Category[i]<-paste("Artifact (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<=-1&&is.na(hotspot[i])){
                                    results$Category[i]<-paste("Probably True (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<=-1&&!is.na(hotspot[i])){
                                    results$Category[i]<-paste("Hotspot (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                            }
                            if(!is.na(results$Consequence[i])&&
                               vcountPattern(pattern="frameshift",
                                             results$Consequence[i])>0){
                                artifact_score[i]<-artifact_score[i]+2
                                if(artifact_score[i]>-1){
                                    results$Category[i]<-paste("Artifact (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<=-1&&is.na(hotspot[i])){
                                    results$Category[i]<-paste("Probably True (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<=-1&&!is.na(hotspot[i])){
                                    results$Category[i]<-paste("Hotspot (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                            }
                        }
                    }

                }
                if(input$artifact_score=="Yes"){
                    for(i in seq_along(results[,1])){
                        progress_small$inc(1/length(results[,1]),
                                           detail=paste("-> Call",i,"out of",
                                                        length(results[,1])))
                        if((poly_score[i]>=2&&cosmic_flag[i]==TRUE&&
                            is.na(hotspot[i]))||(is.na(hotspot[i])&&
                                                 ((poly_score[i]>=2&&
                                                   cosmic_flag[i]==FALSE)||
                                                  poly_score[i]>=3))){
                            if(!is.na(results$VAF[i])&&results$VAF[i]<=0.1){
                                artifact_score[i]<-artifact_score[i]+input$PolymorphismVAF10
                                if(artifact_score[i]>=input$artifactThreshold){
                                    results$Category[i]<-paste("Artifact (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<input$artifactThreshold&&
                                   is.na(hotspot[i])){
                                    results$Category[i]<-paste("Probably True (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<input$artifactThreshold&&
                                   !is.na(hotspot[i])){
                                    results$Category[i]<-paste("Hotspot (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                            }
                            if(!is.na(results$VAF[i])&&results$VAF[i]<=0.2){
                                artifact_score[i]<-artifact_score[i]+input$PolymorphismVAF20
                                if(artifact_score[i]>=input$artifactThreshold){
                                    results$Category[i]<-paste("Artifact (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<input$artifactThreshold&&
                                   is.na(hotspot[i])){
                                    results$Category[i]<-paste("Probably True (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<input$artifactThreshold&&
                                   !is.na(hotspot[i])){
                                    results$Category[i]<-paste("Hotspot (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                            }
                            if(!is.na(results$Consequence[i])&&
                               vcountPattern(pattern="frameshift",
                                             results$Consequence[i])>0){
                                artifact_score[i]<-artifact_score[i]+input$PolymorphismFrame
                                if(artifact_score[i]>=input$artifactThreshold){
                                    results$Category[i]<-paste("Artifact (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<input$artifactThreshold&&
                                   is.na(hotspot[i])){
                                    results$Category[i]<-paste("Probably True (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                                if(artifact_score[i]<input$artifactThreshold&&
                                   !is.na(hotspot[i])){
                                    results$Category[i]<-paste("Hotspot (",
                                                               artifact_score[i],
                                                               ")",sep="")
                                }
                            }
                        }
                    }

                }
                progress_small$close()

                #identical calls as polymorphism
                progress$inc(1/13,detail="->  Re-consider polymorphisms")
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

                overview4<-cbind(overview4,Mutations=NA,Polymorphisms=NA,
                                 Artifacts=NA)
                for(i in seq_along(overview4[,1])){
                    overview4[i,4]<-length(results.mutations[results.mutations[,1]==overview4[i,1],1])
                    overview4[i,5]<-length(results.polymorphisms[results.polymorphisms[,1]==overview4[i,1],1])
                    overview4[i,6]<-length(results.artifacts[results.artifacts[,1]==overview4[i,1],1])
                    for(j in 2:length(checkpoint[1,])){
                        if(!is.na(checkpoint[i,j])){
                            checkpoint[i,j]<-7
                        }
                    }
                }
                write.table(results,paste(input$output_folder,
                                          "/Results_Final.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                write.table(checkpoint,paste(input$output_folder,
                                             "/checkpoint.txt",sep=""),
                            row.names=FALSE,quote=FALSE,sep="\t")
                output$table4 <- renderDataTable(datatable(overview4))
                output$table_mutations <- renderDataTable(datatable(results.mutations))
                output$table_polymorphisms <- renderDataTable(datatable(results.polymorphisms))
                output$table_artifacts <- renderDataTable(datatable(results.artifacts))
                results.workbook <- createWorkbook()
                addWorksheet(wb=results.workbook,sheetName="Mutations")
                addWorksheet(wb=results.workbook,sheetName="Polymorphisms")
                addWorksheet(wb=results.workbook,sheetName="Artifacts")
                writeData(wb=results.workbook,
                          x=results.mutations,sheet="Mutations")
                writeData(wb=results.workbook,
                          x=results.polymorphisms,sheet="Polymorphisms")
                writeData(wb=results.workbook,
                          x=results.artifacts,sheet="Artifacts")
                saveWorkbook(results.workbook,
                             paste(input$output_folder,"/Results_Final.xlsx",
                                   sep=""),
                             overwrite = TRUE)
                progress$close()
            })

            observeEvent(input$appreci8Rcheckpoint,{
                log_info<-c()
                log_info[1]<-"Starting analysis with the appreci8R...<br><br>"
                output$log_info<-renderUI({HTML(log_info)})

                checkpoint_state<-input$checkpoint
                checkpointFile<-read.table(paste(input$output_folder,
                                                 "/checkpoint.txt",sep=""),
                                           stringsAsFactors = FALSE,header=TRUE,
                                           sep="\t")
                checkpoint<-checkpointFile

                #1: After target filtration
                if(checkpoint_state==1){
                    #1. Reading Input
                    log_info<-c(log_info,"0. Reading input<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    progress <- shiny::Progress$new()
                    progress$set(message = "0. Reading input", value = 0)
                    target_calls<-list()
                    for(i in 1:(length(checkpointFile[1,])-1)){
                        progress$inc(1/(length(checkpointFile[1,])-1),
                                     detail=paste("->",
                                                  as.character(names(checkpointFile[i+1]))))
                        target_calls[[i]]<-list()
                        for(j in seq_along(checkpointFile[,i+1])){
                            if(!is.na(checkpointFile[j,i+1])){
                                target_calls[[i]][[j]]<-read.table(paste(input$output_folder,
                                                                         "/",
                                                                         as.character(names(checkpointFile)[i+1]),
                                                                         ".",
                                                                         checkpointFile[j,1],
                                                                         ".target.txt",sep=""),
                                                                   stringsAsFactors = FALSE,
                                                                   header=TRUE,
                                                                   sep="\t")

                            }
                        }
                    }
                    progress$close()

                    #2. Normalization
                    log_info<-c(log_info,"2. Normalization<br>")
                    output$log_info<-renderUI({HTML(log_info)})

                    progress <- shiny::Progress$new()
                    progress$set(message = "2. Normalization", value = 0)
                    normalized_calls<-list()
                    for(i in seq_along(target_calls)){
                        progress$inc(1/length(target_calls),
                                     detail=paste("->",
                                                  as.character(names(checkpointFile[i+1]))))
                        normalized_calls[[i]]<-list()
                        if(length(target_calls[[i]])>0){
                            temp<-target_calls[[i]][[1]]
                            checkpoint[1,i+1]<-2
                            if(!is.na(temp[1,2])&&length(checkpointFile[,1])>1){
                                for(j in 2:length(checkpointFile[,1])){
                                    temp<-rbind(temp,target_calls[[i]][[j]])
                                    checkpoint[j,i+1]<-2
                                }
                            }
                            #GATK
                            if(i==1&&is.null(input$gatk_indels)){
                                log_info<-c(log_info,
                                            "Please add GATK if you want to analyze its output<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(i==1){
                                if(input$gatk_indels=="C>-A"){
                                    temp2<-indel_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-check_alternative_bases(temp)
                                temp<-temp2
                                if(input$gatk_mnvs=="Yes"){
                                    temp2<-mnv_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-string_diff_finder(temp)
                                temp<-temp2
                                normalized_calls[[i]]<-temp
                                write.table(normalized_calls[[i]],
                                            paste(input$output_folder,"/",
                                                  as.character(names(checkpointFile)[i+1]),
                                                  ".normalized.txt",sep=""),
                                            row.names=FALSE,quote=FALSE,sep="\t")
                            }
                            #Platypus
                            if(i==2&&is.null(input$platypus_indels)){
                                log_info<-c(log_info,
                                            "Please add Platypus if you want to analyze its output<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(i==2){
                                if(input$platypus_indels=="C>-A"){
                                    temp2<-indel_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-check_alternative_bases(temp)
                                temp<-temp2
                                if(input$platypus_mnvs=="Yes"){
                                    temp2<-mnv_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-string_diff_finder(temp)
                                temp<-temp2
                                normalized_calls[[i]]<-temp
                                write.table(normalized_calls[[i]],
                                            paste(input$output_folder,"/",
                                                  as.character(names(checkpointFile)[i+1]),
                                                  ".normalized.txt",sep=""),
                                            row.names=FALSE,quote=FALSE,sep="\t")
                            }
                            #VarScan
                            if(i==3&&is.null(input$varscan_indels)){
                                log_info<-c(log_info,
                                            "Please add VarScan if you want to analyze its output<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(i==3){
                                if(input$varscan_indels=="C>-A"){
                                    temp2<-indel_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-check_alternative_bases(temp)
                                temp<-temp2
                                if(input$varscan_mnvs=="Yes"){
                                    temp2<-mnv_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-string_diff_finder(temp)
                                temp<-temp2
                                normalized_calls[[i]]<-temp
                                write.table(normalized_calls[[i]],
                                            paste(input$output_folder,"/",
                                                  as.character(names(checkpointFile)[i+1]),
                                                  ".normalized.txt",sep=""),
                                            row.names=FALSE,quote=FALSE,sep="\t")
                            }
                            #FreeBayes
                            if(i==4&&is.null(input$freebayes_indels)){
                                log_info<-c(log_info,
                                            "Please add FreeBayes if you want to analyze its output<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(i==4){
                                if(input$freebayes_indels=="C>-A"){
                                    temp2<-indel_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-check_alternative_bases(temp)
                                temp<-temp2
                                if(input$freebayes_mnvs=="Yes"){
                                    temp2<-mnv_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-string_diff_finder(temp)
                                temp<-temp2
                                normalized_calls[[i]]<-temp
                                write.table(normalized_calls[[i]],
                                            paste(input$output_folder,"/",
                                                  as.character(names(checkpointFile)[i+1]),
                                                  ".normalized.txt",sep=""),
                                            row.names=FALSE,quote=FALSE,
                                            sep="\t")
                            }
                            #LoFreq
                            if(i==5&&is.null(input$lofreq_indels)){
                                log_info<-c(log_info,
                                            "Please add LoFreq if you want to analyze its output<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(i==5){
                                if(input$lofreq_indels=="C>-A"){
                                    temp2<-indel_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-check_alternative_bases(temp)
                                temp<-temp2
                                if(input$lofreq_mnvs=="Yes"){
                                    temp2<-mnv_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-string_diff_finder(temp)
                                temp<-temp2
                                normalized_calls[[i]]<-temp
                                write.table(normalized_calls[[i]],
                                            paste(input$output_folder,"/",
                                                  as.character(names(checkpointFile)[i+1]),
                                                  ".normalized.txt",sep=""),
                                            row.names=FALSE,quote=FALSE,
                                            sep="\t")
                            }
                            #SNVer
                            if(i==6&&is.null(input$snver_indels)){
                                log_info<-c(log_info,
                                            "Please add SNVer if you want to analyze its output<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(i==6){
                                if(input$snver_indels=="C>-A"){
                                    temp2<-indel_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-check_alternative_bases(temp)
                                temp<-temp2
                                if(input$snver_mnvs=="Yes"){
                                    temp2<-mnv_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-string_diff_finder(temp)
                                temp<-temp2
                                normalized_calls[[i]]<-temp
                                write.table(normalized_calls[[i]],
                                            paste(input$output_folder,"/",
                                                  as.character(names(checkpointFile)[i+1]),
                                                  ".normalized.txt",sep=""),
                                            row.names=FALSE,quote=FALSE,
                                            sep="\t")
                            }
                            #SamTools
                            if(i==7&&is.null(input$samtools_indels)){
                                log_info<-c(log_info,
                                            "Please add samtools if you want to analyze its output<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(i==7){
                                if(input$samtools_indels=="C>-A"){
                                    temp2<-indel_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-check_alternative_bases(temp)
                                temp<-temp2
                                if(input$samtools_mnvs=="Yes"){
                                    temp2<-mnv_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-string_diff_finder(temp)
                                temp<-temp2
                                normalized_calls[[i]]<-temp
                                write.table(normalized_calls[[i]],
                                            paste(input$output_folder,"/",
                                                  as.character(names(checkpointFile)[i+1]),
                                                  ".normalized.txt",sep=""),
                                            row.names=FALSE,quote=FALSE,
                                            sep="\t")
                            }
                            #VarDict
                            if(i==8&&is.null(input$vardict_indels)){
                                log_info<-c(log_info,
                                            "Please add VarDict if you want to analyze its output<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(i==8){
                                if(input$vardict_indels=="C>-A"){
                                    temp2<-indel_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-check_alternative_bases(temp)
                                temp<-temp2
                                if(input$vardict_mnvs=="Yes"){
                                    temp2<-mnv_converter(temp)
                                    temp<-temp2
                                }
                                temp2<-string_diff_finder(temp)
                                temp<-temp2
                                normalized_calls[[i]]<-temp
                                write.table(normalized_calls[[i]],
                                            paste(input$output_folder,"/",
                                                  as.character(names(checkpointFile)[i+1]),
                                                  ".normalized.txt",sep=""),
                                            row.names=FALSE,quote=FALSE,
                                            sep="\t")
                            }
                            if(length(target_calls)>8){
                                #Caller 1
                                if(i==9&&is.null(input$caller1_indels)){
                                    log_info<-c(log_info,
                                                paste("Please add ",
                                                      as.character(names(checkpointFile)[i+1]),
                                                      "if you want to analyze its output<br>"))
                                    output$log_info<-renderUI({HTML(log_info)})
                                    return()
                                }
                                if(i==9){
                                    if(input$caller1_indels=="C>-A"){
                                        temp2<-indel_converter(temp)
                                        temp<-temp2
                                    }
                                    temp2<-check_alternative_bases(temp)
                                    temp<-temp2
                                    if(input$caller1_mnvs=="Yes"){
                                        temp2<-mnv_converter(temp)
                                        temp<-temp2
                                    }
                                    temp2<-string_diff_finder(temp)
                                    temp<-temp2
                                    normalized_calls[[i]]<-temp
                                    write.table(normalized_calls[[i]],
                                                paste(input$output_folder,"/",
                                                      as.character(names(checkpointFile)[i+1]),
                                                      ".normalized.txt",sep=""),
                                                row.names=FALSE,quote=FALSE,
                                                sep="\t")
                                }
                                if(length(target_calls)>9){
                                    #Caller 2
                                    if(i==10&&is.null(input$caller2_indels)){
                                        log_info<-c(log_info,
                                                    paste("Please add ",
                                                          as.character(names(checkpointFile)[i+1]),
                                                          "if you want to analyze its output<br>"))
                                        output$log_info<-renderUI({HTML(log_info)})
                                        return()
                                    }
                                    if(i==10){
                                        if(input$caller2_indels=="C>-A"){
                                            temp2<-indel_converter(temp)
                                            temp<-temp2
                                        }
                                        temp2<-check_alternative_bases(temp)
                                        temp<-temp2
                                        if(input$caller2_mnvs=="Yes"){
                                            temp2<-mnv_converter(temp)
                                            temp<-temp2
                                        }
                                        temp2<-string_diff_finder(temp)
                                        temp<-temp2
                                        normalized_calls[[i]]<-temp
                                        write.table(normalized_calls[[i]],
                                                    paste(input$output_folder,
                                                          "/",
                                                          as.character(names(checkpointFile)[i+1]),
                                                          ".normalized.txt",
                                                          sep=""),
                                                    row.names=FALSE,quote=FALSE,
                                                    sep="\t")
                                    }
                                    if(length(target_calls)>10){
                                        #Caller 3
                                        if(i==11&&is.null(input$caller11_indels)){
                                            log_info<-c(log_info,
                                                        paste("Please add ",
                                                              as.character(names(checkpointFile)[i+1]),
                                                              "if you want to analyze its output<br>"))
                                            output$log_info<-renderUI({HTML(log_info)})
                                            return()
                                        }
                                        if(i==11){
                                            if(input$caller3_indels=="C>-A"){
                                                temp2<-indel_converter(temp)
                                                temp<-temp2
                                            }
                                            temp2<-check_alternative_bases(temp)
                                            temp<-temp2
                                            if(input$caller3_mnvs=="Yes"){
                                                temp2<-mnv_converter(temp)
                                                temp<-temp2
                                            }
                                            temp2<-string_diff_finder(temp)
                                            temp<-temp2
                                            normalized_calls[[i]]<-temp
                                            write.table(normalized_calls[[i]],
                                                        paste(input$output_folder,
                                                              "/",
                                                              as.character(names(checkpointFile)[i+1]),
                                                              ".normalized.txt",
                                                              sep=""),
                                                        row.names=FALSE,
                                                        quote=FALSE,
                                                        sep="\t")
                                        }
                                        if(length(target_calls)>11){
                                            #Caller 4
                                            if(i==12&&
                                               is.null(input$caller12_indels)){
                                                log_info<-c(log_info,
                                                            paste("Please add ",
                                                                  as.character(names(checkpointFile)[i+1]),
                                                                  "if you want to analyze its output<br>"))
                                                output$log_info<-renderUI({HTML(log_info)})
                                                return()
                                            }
                                            if(i==12){
                                                if(input$caller4_indels=="C>-A"){
                                                    temp2<-indel_converter(temp)
                                                    temp<-temp2
                                                }
                                                temp2<-check_alternative_bases(temp)
                                                temp<-temp2
                                                if(input$caller4_mnvs=="Yes"){
                                                    temp2<-mnv_converter(temp)
                                                    temp<-temp2
                                                }
                                                temp2<-string_diff_finder(temp)
                                                temp<-temp2
                                                normalized_calls[[i]]<-temp
                                                write.table(normalized_calls[[i]],
                                                            paste(input$output_folder,
                                                                  "/",
                                                                  as.character(names(checkpointFile)[i+1]),
                                                                  ".normalized.txt",
                                                                  sep=""),
                                                            row.names=FALSE,
                                                            quote=FALSE,
                                                            sep="\t")
                                            }
                                            if(length(target_calls)>12){
                                                #Caller 5
                                                if(i==13&&is.null(input$caller13_indels)){
                                                    log_info<-c(log_info,
                                                                paste("Please add ",
                                                                      as.character(names(checkpointFile)[i+1]),
                                                                      "if you want to analyze its output<br>"))
                                                    output$log_info<-renderUI({HTML(log_info)})
                                                    return()
                                                }
                                                if(i==13){
                                                    if(input$caller5_indels=="C>-A"){
                                                        temp2<-indel_converter(temp)
                                                        temp<-temp2
                                                    }
                                                    temp2<-check_alternative_bases(temp)
                                                    temp<-temp2
                                                    if(input$caller5_mnvs=="Yes"){
                                                        temp2<-mnv_converter(temp)
                                                        temp<-temp2
                                                    }
                                                    temp2<-string_diff_finder(temp)
                                                    temp<-temp2
                                                    normalized_calls[[i]]<-temp
                                                    write.table(normalized_calls[[i]],
                                                                paste(input$output_folder,
                                                                      "/",
                                                                      as.character(names(checkpointFile)[i+1]),
                                                                      ".normalized.txt",
                                                                      sep=""),
                                                                row.names=FALSE,
                                                                quote=FALSE,
                                                                sep="\t")
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    write.table(checkpoint,paste(input$output_folder,
                                                 "/checkpoint.txt",sep=""),
                                row.names=FALSE,quote=FALSE,sep="\t")
                    checkpoint_state<-2
                    progress$close()
                }

                #2: After normalization
                if(checkpoint_state==2){
                    if(exists("normalized_calls")==FALSE){
                        #1. Reading Input
                        log_info<-c(log_info,"0. Reading input<br>")
                        output$log_info<-renderUI({HTML(log_info)})
                        progress <- shiny::Progress$new()
                        progress$set(message = "0. Reading input", value = 0)
                        normalized_calls<-list()
                        for(i in 1:(length(checkpointFile[1,])-1)){
                            progress$inc(1/(length(checkpointFile[1,])-1),
                                         detail=paste("->",
                                                      as.character(names(checkpointFile[i+1]))))
                            normalized_calls[[i]]<-list()
                            if(!is.na(checkpointFile[1,i+1])){
                                normalized_calls[[i]]<-read.table(paste(input$output_folder,
                                                                        "/",
                                                                        as.character(names(checkpointFile)[i+1]),
                                                                        ".normalized.txt",
                                                                        sep=""),
                                                                  stringsAsFactors = FALSE,
                                                                  header=TRUE,
                                                                  sep="\t")
                            }
                        }
                        progress$close()
                    }
                    #3. Annotate
                    log_info<-c(log_info,"3. Annotate<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    progress <- shiny::Progress$new()
                    progress$set(message = "3. Annotate", value = 0)
                    annotated_calls<-list()
                    overview3<-checkpointFile
                    overview3[c(seq_along(checkpointFile[,1])),c(2:length(checkpointFile[1,]))]<-NA
                    txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
                    connection_txid_symbol<-transcripts(Homo.sapiens,
                                                        columns=c("TXID",
                                                                  "SYMBOL"))
                    for(i in seq_along(normalized_calls)){
                        progress$inc(1/length(normalized_calls))
                        annotated_calls[[i]]<-data.frame()
                        if(length(normalized_calls[[i]])>0){
                            progress_small <- shiny::Progress$new()
                            progress_small$set(message = as.character(names(checkpointFile[i+1])),
                                               value = 0)
                            test<-VCF(rowRanges=GRanges(seqnames=paste("chr",
                                                                       as.character(normalized_calls[[i]][,2]),
                                                                       sep=""),
                                                        ranges=IRanges(as.numeric(normalized_calls[[i]][,3]),
                                                                       (as.numeric(normalized_calls[[i]][,3])+nchar(normalized_calls[[i]][,4])-1))),
                                      fixed=DataFrame(REF=DNAStringSet(normalized_calls[[i]][,4]),
                                                      ALT=DNAStringSetList(strsplit(normalized_calls[[i]][,5],",",fixed=TRUE)),
                                                      QUAL=1,
                                                      FILTER=as.character(normalized_calls[[i]][,1])))
                            if(is.null(input$locations)){
                                log_info<-c(log_info,"Please pick at least one location<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(!is.null(input$locations)){
                                located<-locateVariants(test,txdb,AllVariants())
                                for(j in seq_along(input$locations)){
                                    if(j==1){
                                        of_interest<-data.frame(located$LOCATION==input$locations[j])
                                    }
                                    if(j>1){
                                        of_interest<-data.frame(of_interest,
                                                                located$LOCATION==input$locations[j])
                                    }
                                }
                                if(length(input$locations)==1){
                                    located<-located[of_interest[,1]>0,]
                                }
                                if(length(input$locations)>1){
                                    located<-located[rowSums(of_interest)>0,]
                                }
                            }
                            if(sum(input$locations=="coding")>0&&
                               is.null(input$consequences)){
                                log_info<-c(log_info,"Please pick at least one consequence<br>")
                                output$log_info<-renderUI({HTML(log_info)})
                                return()
                            }
                            if(!is.null(input$consequences)){
                                predicted<-predictCoding(query=test,
                                                         subject=txdb,
                                                         seqSource=Hsapiens)
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
                                for(j in seq_along(input$consequences)){
                                    if(j==1){
                                        of_interest<-data.frame(predicted$CONSEQUENCE==input$consequences[j])
                                    }
                                    if(j>1){
                                        of_interest<-data.frame(of_interest,
                                                                predicted$CONSEQUENCE==input$consequences[j])
                                    }
                                }
                                if(length(input$consequences)==1){
                                    predicted<-predicted[of_interest[,1]>0,]
                                }
                                if(length(input$consequences)>1){
                                    predicted<-predicted[rowSums(of_interest)>0,]
                                }
                            }

                            annotated_calls[[i]]<-data.frame(normalized_calls[[i]],
                                                             Location=NA,c.=NA,
                                                             p.=NA,AA_ref=NA,
                                                             AA_alt=NA,
                                                             Codon_ref=NA,
                                                             Codon_alt=NA,
                                                             Consequence=NA,
                                                             Gene=NA,GeneID=NA,
                                                             TranscriptID=NA)
                            counter_located<-1
                            counter_predicted<-1
                            keep<-rep(TRUE,length(annotated_calls[[i]][,1]))

                            for(k in seq_along(annotated_calls[[i]][,1])){
                                progress_small$inc(1/length(annotated_calls[[i]][,1]),
                                                   detail=paste("-> Call",k,
                                                                "out of",
                                                                length(annotated_calls[[i]][,1])))
                                while(counter_located<=length(ranges(located))&&
                                      start(ranges(located))[counter_located]==annotated_calls[[i]][k,3]){
                                    if(!is.na(annotated_calls[[i]][k,6])){
                                        annotated_calls[[i]][k,6]<-paste(annotated_calls[[i]][k,6],
                                                                         as.character(located$LOCATION[counter_located]),
                                                                         sep=",")
                                        annotated_calls[[i]][k,7]<-paste(annotated_calls[[i]][k,7],
                                                                         as.character(located$LOCSTART[counter_located]),
                                                                         sep=",")
                                    }
                                    if(is.na(annotated_calls[[i]][k,6])){
                                        annotated_calls[[i]][k,6]<-as.character(located$LOCATION[counter_located])
                                        annotated_calls[[i]][k,7]<-as.character(located$LOCSTART[counter_located])
                                    }
                                    counter_located<-counter_located+1
                                }
                                if(!is.na(annotated_calls[[i]][k,6])&&
                                   !is.null(input$consequences)){
                                    for(j in seq_along(strsplit(annotated_calls[[i]][k,6],",")[[1]])){
                                        if(counter_predicted>length(ranges(predicted))||
                                           strsplit(annotated_calls[[i]][k,6],",")[[1]][j]!="coding"){
                                            if(!is.na(annotated_calls[[i]][k,8])){
                                                annotated_calls[[i]][k,8]<-paste(annotated_calls[[i]][k,8],"NA",sep=",")
                                                annotated_calls[[i]][k,9]<-paste(annotated_calls[[i]][k,9],"NA",sep=",")
                                                annotated_calls[[i]][k,10]<-paste(annotated_calls[[i]][k,10],"NA",sep=",")
                                                annotated_calls[[i]][k,11]<-paste(annotated_calls[[i]][k,11],"NA",sep=",")
                                                annotated_calls[[i]][k,12]<-paste(annotated_calls[[i]][k,12],"NA",sep=",")
                                                annotated_calls[[i]][k,13]<-paste(annotated_calls[[i]][k,13],"NA",sep=",")
                                                annotated_calls[[i]][k,14]<-paste(annotated_calls[[i]][k,14],"NA",sep=",")
                                                annotated_calls[[i]][k,15]<-paste(annotated_calls[[i]][k,15],"NA",sep=",")
                                                annotated_calls[[i]][k,16]<-paste(annotated_calls[[i]][k,16],"NA",sep=",")
                                            }
                                            if(is.na(annotated_calls[[i]][k,8])){
                                                annotated_calls[[i]][k,8]<-annotated_calls[[i]][k,9]<-"NA"
                                                annotated_calls[[i]][k,10]<-annotated_calls[[i]][k,11]<-"NA"
                                                annotated_calls[[i]][k,12]<-annotated_calls[[i]][k,13]<-"NA"
                                                annotated_calls[[i]][k,14]<-"NA"
                                                annotated_calls[[i]][k,15]<-annotated_calls[[i]][k,16]<-"NA"
                                            }
                                        }
                                        if(counter_predicted<=length(ranges(predicted))&&
                                           strsplit(annotated_calls[[i]][k,6],",")[[1]][j]=="coding"){
                                            if(start(ranges(predicted))[counter_predicted]==annotated_calls[[i]][k,3]){
                                                if(!is.na(annotated_calls[[i]][k,8])){
                                                    annotated_calls[[i]][k,8]<-paste(annotated_calls[[i]][k,8],
                                                                                     as.character(predicted$PROTEINLOC[counter_predicted][[1]][1]),sep=",")
                                                    if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])!="frameshift"){
                                                        if(as.character(predicted$REFCODON[counter_predicted])!="CTG"){
                                                            annotated_calls[[i]][k,9]<-paste(annotated_calls[[i]][k,9],
                                                                                             as.character(predicted$REFAA[counter_predicted][[1]][1]),sep=",")
                                                        }
                                                        if(as.character(predicted$REFCODON[counter_predicted])=="CTG"){
                                                            annotated_calls[[i]][k,9]<-paste(annotated_calls[[i]][k,9],
                                                                                             "L",sep=",")
                                                        }
                                                        if(as.character(predicted$VARCODON[counter_predicted])!="CTG"){
                                                            annotated_calls[[i]][k,10]<-paste(annotated_calls[[i]][k,10],
                                                                                              as.character(predicted$VARAA[counter_predicted][[1]][1]),sep=",")
                                                        }
                                                        if(as.character(predicted$VARCODON[counter_predicted])=="CTG"){
                                                            annotated_calls[[i]][k,10]<-paste(annotated_calls[[i]][k,10],"
                                                                                              L",sep=",")
                                                        }
                                                    }
                                                    if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])=="frameshift"){
                                                        annotated_calls[[i]][k,9]<-paste(annotated_calls[[i]][k,9],"NA",sep=",")
                                                        annotated_calls[[i]][k,10]<-paste(annotated_calls[[i]][k,10],"NA",sep=",")
                                                    }
                                                    annotated_calls[[i]][k,11]<-paste(annotated_calls[[i]][k,11],
                                                                                      as.character(predicted$REFCODON[counter_predicted]),sep=",")
                                                    annotated_calls[[i]][k,12]<-paste(annotated_calls[[i]][k,12],
                                                                                      as.character(predicted$VARCODON[counter_predicted]),sep=",")
                                                    annotated_calls[[i]][k,13]<-paste(annotated_calls[[i]][k,13],
                                                                                      as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1]),sep=",")
                                                    annotated_calls[[i]][k,14]<-paste(annotated_calls[[i]][k,14],
                                                                                      as.character(connection_txid_symbol[as.numeric(predicted$TXID[counter_predicted][[1]][1]),]$SYMBOL),sep=",")
                                                    annotated_calls[[i]][k,15]<-paste(annotated_calls[[i]][k,15],
                                                                                      as.character(predicted$GENEID[counter_predicted][[1]][1]),sep=",")
                                                    annotated_calls[[i]][k,16]<-paste(annotated_calls[[i]][k,16],
                                                                                      as.character(predicted$TXID[counter_predicted][[1]][1]),sep=",")
                                                }
                                                if(is.na(annotated_calls[[i]][k,8])){
                                                    annotated_calls[[i]][k,8]<-as.character(predicted$PROTEINLOC[counter_predicted][[1]][1])
                                                    if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])!="frameshift"){
                                                        if(as.character(predicted$REFCODON[counter_predicted])!="CTG"){
                                                            annotated_calls[[i]][k,9]<-as.character(predicted$REFAA[counter_predicted][[1]][1])
                                                        }
                                                        if(as.character(predicted$REFCODON[counter_predicted])=="CTG"){
                                                            annotated_calls[[i]][k,9]<-"L"
                                                        }
                                                        if(as.character(predicted$VARCODON[counter_predicted])!="CTG"){
                                                            annotated_calls[[i]][k,10]<-as.character(predicted$VARAA[counter_predicted][[1]][1])
                                                        }
                                                        if(as.character(predicted$VARCODON[counter_predicted])=="CTG"){
                                                            annotated_calls[[i]][k,10]<-"L"
                                                        }
                                                    }
                                                    if(as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])=="frameshift"){
                                                        annotated_calls[[i]][k,9]<-"NA"
                                                        annotated_calls[[i]][k,10]<-"NA"
                                                    }
                                                    annotated_calls[[i]][k,11]<-as.character(predicted$REFCODON[counter_predicted])
                                                    annotated_calls[[i]][k,12]<-as.character(predicted$VARCODON[counter_predicted])
                                                    annotated_calls[[i]][k,13]<-as.character(predicted$CONSEQUENCE[counter_predicted][[1]][1])
                                                    annotated_calls[[i]][k,14]<-as.character(connection_txid_symbol[as.numeric(predicted$TXID[counter_predicted][[1]][1]),]$SYMBOL)
                                                    annotated_calls[[i]][k,15]<-as.character(predicted$GENEID[counter_predicted][[1]][1])
                                                    annotated_calls[[i]][k,16]<-as.character(predicted$TXID[counter_predicted][[1]][1])
                                                }
                                                counter_predicted<-counter_predicted+1
                                            }
                                        }
                                    }
                                }
                                if(is.na(annotated_calls[[i]][k,6])){
                                    keep[k]<-FALSE
                                }
                                if(!is.null(input$consequences)&&
                                   !is.na(annotated_calls[[i]][k,6])&&
                                   sum(strsplit(annotated_calls[[i]][k,6],",")[[1]]=="coding")>0&&
                                   (is.na(annotated_calls[[i]][k,8])||
                                    sum(strsplit(annotated_calls[[i]][k,8],",")[[1]]=="NA")==length(strsplit(annotated_calls[[i]][k,8],",")[[1]]))){
                                    keep[k]<-FALSE
                                }
                            }
                            annotated_calls[[i]]<-annotated_calls[[i]][keep,]
                            for(k in seq_along(overview3[,1])){
                                overview3[k,i+1]<-length(annotated_calls[[i]][annotated_calls[[i]][,1]==overview3[k,1],1])
                                checkpoint[k,i+1]<-3
                            }
                            write.table(annotated_calls[[i]],
                                        paste(input$output_folder,"/",
                                              as.character(names(checkpointFile)[i+1]),
                                              ".annotated.txt",sep=""),
                                        row.names=FALSE,quote=FALSE,sep="\t")
                            progress_small$close()
                        }
                    }
                    write.table(checkpoint,
                                paste(input$output_folder,"/checkpoint.txt",
                                      sep=""),row.names=FALSE,quote=FALSE,
                                sep="\t")
                    output$table3 <- renderDataTable(datatable(overview3))
                    checkpoint_state<-3
                    progress$close()
                }

                #3: After annotation
                if(checkpoint_state==3){
                    if(exists("annotated_calls")==FALSE){
                        #1. Reading Input
                        log_info<-c(log_info,"0. Reading input<br>")
                        output$log_info<-renderUI({HTML(log_info)})
                        progress <- shiny::Progress$new()
                        progress$set(message = "0. Reading input", value = 0)
                        annotated_calls<-list()
                        for(i in 1:(length(checkpointFile[1,])-1)){
                            progress$inc(1/(length(checkpointFile[1,])-1),
                                         detail=paste("->",
                                                      as.character(names(checkpointFile[i+1]))))
                            annotated_calls[[i]]<-data.frame()
                            if(!is.na(checkpointFile[1,i+1])){
                                annotated_calls[[i]]<-read.table(paste(input$output_folder,
                                                                       "/",
                                                                       as.character(names(checkpointFile)[i+1]),
                                                                       ".annotated.txt",
                                                                       sep=""),
                                                                 stringsAsFactors=FALSE,
                                                                 header=TRUE,
                                                                 sep="\t")
                            }
                        }
                        progress$close()
                    }

                    #4. Combine
                    log_info<-c(log_info,"4. Combine Output<br>")
                    output$log_info<-renderUI({HTML(log_info)})

                    progress <- shiny::Progress$new()
                    progress$set(message = "4. Combine Output", value = 0)
                    combined_calls<-data.frame(SampleID=NA,Chr=NA,Pos=NA,
                                               Ref=NA,Alt=NA,Location=NA,
                                               c.=NA,p.=NA,AA_ref=NA,AA_alt=NA,
                                               Codon_ref=NA,Codon_alt=NA,
                                               Consequence=NA,Gene=NA,GeneID=NA,
                                               TranscriptID=NA,GATK=NA,
                                               Platypus=NA,VarScan=NA,
                                               FreeBayes=NA,LoFreq=NA,SNVer=NA,
                                               SamTools=NA,VarDict=NA)
                    if(length(annotated_calls)>8){
                        combined_calls<-cbind(combined_calls,Caller1=NA)
                        if(length(annotated_calls)>9){
                            combined_calls<-cbind(combined_calls,Caller2=NA)
                            if(length(annotated_calls)>10){
                                combined_calls<-cbind(combined_calls,Caller3=NA)
                                if(length(annotated_calls)>11){
                                    combined_calls<-cbind(combined_calls,
                                                          Caller4=NA)
                                    if(length(annotated_calls)>12){
                                        combined_calls<-cbind(combined_calls,
                                                              Caller5=NA)
                                    }
                                }
                            }
                        }
                    }
                    combined_calls_temp<-combined_calls
                    overview4<-cbind(checkpointFile[,1],RawCalls=NA)
                    for(i in seq_along(annotated_calls)){
                        if(length(annotated_calls[[i]])>0){
                            temp<-annotated_calls[[i]]
                            add_to_temp<-matrix(rep(NA,
                                                    (length(combined_calls[1,])-16)),
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
                        progress$inc(1/length(combined_calls_temp_sorted[,1]))
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
                            combined_calls<-rbind(combined_calls,
                                                  combined_calls_temp_sorted[i,])
                        }
                    }
                    temp<-unique(combined_calls)
                    combined_calls<-temp
                    for(i in seq_along(overview4[,1])){
                        overview4[i,2]<-length(combined_calls[combined_calls[,1]==overview4[i,1],1])
                        for(j in seq_along(annotated_calls)){
                            if(length(annotated_calls[[j]])>0){
                                checkpoint[i,j+1]<-4
                            }
                        }
                    }
                    write.table(combined_calls,
                                paste(input$output_folder,"/Results_Raw.txt",
                                      sep=""),row.names=FALSE,quote=FALSE,
                                sep="\t")
                    write.table(checkpoint,
                                paste(input$output_folder,"/checkpoint.txt",
                                      sep=""),row.names=FALSE,quote=FALSE,
                                sep="\t")
                    output$table4 <- renderDataTable(datatable(overview4))
                    checkpoint_state<-4
                    progress$close()
                }

                #4: After combination
                if(checkpoint_state==4){
                    if(exists("combined_calls")==FALSE){
                        #1. Reading Input
                        log_info<-c(log_info,"0. Reading input<br>")
                        output$log_info<-renderUI({HTML(log_info)})
                        combined_calls<-read.table(paste(input$output_folder,
                                                         "/Results_Raw.txt",
                                                         sep=""),
                                                   stringsAsFactors = FALSE,
                                                   header=TRUE,sep="\t")
                    }

                    #5. Pileup
                    log_info<-c(log_info,"5. Evaluate Coverage and BQ<br>")
                    output$log_info<-renderUI({HTML(log_info)})

                    progress <- shiny::Progress$new()
                    progress$set(message = "5. Evaluate Coverage and BQ",
                                 value = 0)
                    results<-cbind(combined_calls[,c(1:5)],Nr_Ref=NA,Nr_Alt=NA,
                                   DP=NA,VAF=NA,BQ_REF=NA,BQ_ALT=NA,
                                   Nr_Ref_fwd=NA,Nr_Alt_fwd=NA,DP_fwd=NA,
                                   VAF_fwd=NA,Nr_Ref_rev=NA,Nr_Alt_rev=NA,
                                   DP_rev=NA,VAF_rev=NA)
                    folder<-input$bam_folder
                    for(i in seq_along(results[,1])){
                        progress$inc(1/length(results[,1]),
                                     detail=paste("-> Call ",i," out of ",
                                                  length(results[,1])))
                        done<-FALSE
                        #SNVs
                        if(nchar(results[i,4])==1&&nchar(results[i,5])==1){
                            results_temp<-getCharacteristicsFreq(results[i,2],
                                                                 results[i,3],
                                                                 results[i,3],
                                                                 results[i,4],
                                                                 results[i,5],
                                                                 folder,
                                                                 results[i,1])
                            results[i,6:19]<-results_temp[1,6:19]
                            if(results[i,8]>=input$dp&&
                               results[i,7]>=input$nr_alt&&
                               (results[i,9]*100)>=input$vaf){
                                results_temp<-getCharacteristicsBQ(results[i,2],
                                                                   results[i,3],
                                                                   results[i,3],
                                                                   results[i,4],
                                                                   results[i,5],
                                                                   folder,
                                                                   results[i,1])
                                results[i,10:11]<-results_temp[1,6:7]
                            }
                            done<-TRUE
                        }
                        #Deletions
                        if(done==FALSE&&nchar(results[i,4])>1&&
                           nchar(results[i,5])==1
                           &&substr(results[i,4],1,1)==results[i,5]){
                            if(nchar(results[i,4])==2){
                                results_temp<-getCharacteristicsFreq(results[i,2],
                                                                     as.numeric(results[i,3])+1,
                                                                     as.numeric(results[i,3])+1,
                                                                     substr(results[i,4],2,2),
                                                                     "-",folder,
                                                                     results[i,1])
                                results[i,6:19]<-results_temp[1,6:19]
                                if(results[i,8]>=input$dp&&
                                   results[i,7]>=input$nr_alt&&
                                   (results[i,9]*100)>=input$vaf){
                                    results_temp<-getCharacteristicsBQ(results[i,2],
                                                                       as.numeric(results[i,3])+1,
                                                                       as.numeric(results[i,3])+1,
                                                                       substr(results[i,4],2,2),
                                                                       "-",
                                                                       folder,
                                                                       results[i,1])
                                    results[i,10:11]<-results_temp[1,6:7]
                                }
                            }
                            if(nchar(results[i,4])>2){
                                results_temp<-getCharacteristicsFreq(results[i,2],as.numeric(results[i,3])+1,
                                                                     as.numeric(results[i,3])+1,
                                                                     substr(results[i,4],2,2),"-",folder,results[i,1])
                                for(j in 3:nchar(results[i,4])){
                                    results_temp<-rbind(results_temp,
                                                        getCharacteristicsFreq(results[i,2],as.numeric(results[i,3])+j-1,
                                                                               as.numeric(results[i,3])+j-1,
                                                                               substr(results[i,4],j,j),"-",folder,results[i,1]))
                                }
                                for(j in 6:19){
                                    results[i,j]<-min(results_temp[,j])
                                }
                                if(results[i,8]>=input$dp&&results[i,7]>=input$nr_alt&&(results[i,9]*100)>=input$vaf){
                                    results_temp<-getCharacteristicsBQ(results[i,2],as.numeric(results[i,3])+1,
                                                                       as.numeric(results[i,3])+1,
                                                                       substr(results[i,4],2,2),"-",folder,results[i,1])
                                    for(j in 3:nchar(results[i,4])){
                                        results_temp<-rbind(results_temp,
                                                            getCharacteristicsBQ(results[i,2],as.numeric(results[i,3])+j-1,
                                                                                 as.numeric(results[i,3])+j-1,
                                                                                 substr(results[i,4],j,j),"-",folder,results[i,1]))
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
                                                                 results[i,4],
                                                                 "+",folder,
                                                                 results[i,1])
                            results[i,6:19]<-results_temp[1,6:19]
                            if(results[i,8]>=input$dp&&
                               results[i,7]>=input$nr_alt&&
                               (results[i,9]*100)>=input$vaf){
                                results_temp<-getCharacteristicsBQ(results[i,2],
                                                                   as.numeric(results[i,3]),
                                                                   as.numeric(results[i,3]),
                                                                   results[i,4],
                                                                   "+",folder,
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
                                                                           folder,results[i,1]))
                            }
                            #Del in the end
                            if(nchar(results[i,4])>nchar(results[i,5])){
                                results_temp<-rbind(results_temp,

                                                    getCharacteristicsFreq(results[i,2],
                                                                           as.numeric(results[i,3])+j,
                                                                           as.numeric(results[i,3])+j,
                                                                           substr(results[i,4],j+1,j+1),
                                                                           "-",
                                                                           folder,results[i,1]))
                            }
                            #Ins in the end
                            if(nchar(results[i,4])>nchar(results[i,5])){
                                results_temp<-rbind(results_temp,
                                                    getCharacteristicsFreq(results[i,2],
                                                                           as.numeric(results[i,3])+j-1,
                                                                           as.numeric(results[i,3])+j-1,
                                                                           substr(results[i,4],j,j),
                                                                           "+",
                                                                           folder,results[i,1]))
                            }
                            for(j in 6:19){
                                results[i,j]<-min(results_temp[,j])
                            }
                            if(results[i,8]>=input$dp&&
                               results[i,7]>=input$nr_alt&&
                               (results[i,9]*100)>=input$vaf){
                                results_temp<-getCharacteristicsBQ(results[i,2],
                                                                   as.numeric(results[i,3]),
                                                                   as.numeric(results[i,3]),
                                                                   substr(results[i,4],1,1),
                                                                   substr(results[i,5],1,1),
                                                                   folder,
                                                                   results[i,1])
                                for(j in 2:min(nchar(results[i,4]),nchar(results[i,5]))){
                                    results_temp<-rbind(results_temp,
                                                        getCharacteristicsBQ(results[i,2],
                                                                             as.numeric(results[i,3])+j-1,
                                                                             as.numeric(results[i,3])+j-1,
                                                                             substr(results[i,4],j,j),
                                                                             substr(results[i,5],j,j),
                                                                             folder,results[i,1]))
                                }
                                #Del in the end
                                if(nchar(results[i,4])>nchar(results[i,5])){
                                    results_temp<-rbind(results_temp,
                                                        getCharacteristicsBQ(results[i,2],
                                                                             as.numeric(results[i,3])+j,
                                                                             as.numeric(results[i,3])+j,
                                                                             substr(results[i,4],j+1,j+1),
                                                                             "-",
                                                                             folder,results[i,1]))
                                }
                                #Ins in the end
                                if(nchar(results[i,4])>nchar(results[i,5])){
                                    results_temp<-rbind(results_temp,
                                                        getCharacteristicsBQ(results[i,2],
                                                                             as.numeric(results[i,3])+j-1,
                                                                             as.numeric(results[i,3])+j-1,
                                                                             substr(results[i,4],j,j),
                                                                             "+",
                                                                             folder,results[i,1]))
                                }
                                for(j in 6:7){
                                    results_temp[1,j]<-min(results_temp[,j])
                                }
                                results[i,10:11]<-results_temp[1,6:7]
                            }
                        }
                    }
                    frequency_calls_temp<-cbind(combined_calls,
                                                results[,c(6:19)])
                    include1<-results[,8]>=input$dp
                    include2<-results[,7]>=input$nr_alt
                    include3<-(results[,9]*100)>=input$vaf
                    include4<-results[,11]>=input$bq
                    for(i in seq_along(results[,1])){
                        if(is.na(results[i,10])){
                            results[i,10]<-0
                        }
                    }
                    include5<-(results[,10]-results[,11])<=input$bq_diff
                    frequency_calls<-frequency_calls_temp[rowSums(cbind(include1,include2,include3,include4,include5))>=5&!is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                    if(exists("overview4")==TRUE){
                        overview4<-cbind(overview4,VAFandBQFiltered=NA)
                    }
                    if(exists("overview4")==FALSE){
                        overview4<-cbind(checkpointFile[,1],RawCalls=NA,
                                         VAFandBQFiltered=NA)
                    }
                    for(i in seq_along(overview4[,1])){
                        overview4[i,3]<-length(frequency_calls[frequency_calls[,1]==overview4[i,1],1])
                        for(j in 2:length(checkpoint[1,])){
                            if(!is.na(checkpoint[i,j])){
                                checkpoint[i,j]<-5
                            }
                        }
                    }
                    write.table(frequency_calls,
                                paste(input$output_folder,
                                      "/Results_Frequency.txt",sep=""),
                                row.names=FALSE,quote=FALSE,sep="\t")
                    write.table(checkpoint,
                                paste(input$output_folder,"/checkpoint.txt",
                                      sep=""),row.names=FALSE,quote=FALSE,
                                sep="\t")
                    output$table4 <- renderDataTable(datatable(overview4))
                    checkpoint_state<-5
                    progress$close()
                }

                #5: After coverage and BQ filtration
                if(checkpoint_state==5){
                    if(exists("frequency_calls")==FALSE){
                        #1. Reading Input
                        log_info<-c(log_info,"0. Reading input<br>")
                        output$log_info<-renderUI({HTML(log_info)})
                        frequency_calls<-read.table(paste(input$output_folder,
                                                          "/Results_Frequency.txt",
                                                          sep=""),
                                                    stringsAsFactors = FALSE,
                                                    header=TRUE,sep="\t")
                    }

                    #6. Extended Characteristics
                    log_info<-c(log_info,
                                "6. Determine Extended Set of Characteristics<br>")
                    output$log_info<-renderUI({HTML(log_info)})

                    progress <- shiny::Progress$new()
                    progress$set(message = "6. Determine Extended Set of Characteristics (databases)",
                                 value = 0)
                    progress$inc(0,detail="-> Downloading databases ")
                    results<-data.frame(frequency_calls[,c(1:5)])
                    results<-cbind(results,dbSNP=NA,dbSNP_MAF=NA)
                    snps<-SNPlocs.Hsapiens.dbSNP144.GRCh37
                    indels<-XtraSNPlocs.Hsapiens.dbSNP144.GRCh37
                    if(!is.null(input$`1kgenomes`)){
                        results<-cbind(results,G1000_AF=NA)
                        g1000<-MafDb.1Kgenomes.phase3.hs37d5
                    }
                    if(!is.null(input$exac)){
                        results<-cbind(results,ExAC_AF=NA)
                        exac<-MafDb.ExAC.r1.0.hs37d5
                    }
                    if(!is.null(input$esp)){
                        results<-cbind(results,ESP6500_AF=NA)
                        esp6500<-MafDb.ESP6500SI.V2.SSA137.hs37d5
                    }
                    if(!is.null(input$gad)){
                        results<-cbind(results,GAD_AF=NA)
                        gad<-MafDb.gnomADex.r2.1.hs37d5
                    }
                    if(!is.null(input$cosmic)){
                        results<-cbind(results,CosmicID=NA,Cosmic_Counts=NA)
                        cosmic_67<-c()
                        data(cosmic_67,envir=environment(),package="COSMIC.67")
                    }
                    if(!is.null(input$clinvar)){
                        results<-cbind(results,ClinVar=NA)
                        clinvar<-data.frame(Gene=NA,Start=NA,Stop=NA,Ref=NA,
                                            Alt=NA,Sig=NA)
                        genes_temp<-c()
                        for(i in seq_along(frequency_calls[,1])){
                            genes_temp<-c(genes_temp,
                                          strsplit(frequency_calls[i,14],
                                                   split=",")[[1]])
                        }
                        genes<-unique(genes_temp[genes_temp!="NA"])
                        for(i in seq_along(genes)){
                            res<-entrez_search("clinvar",term=genes[i])
                            cv<-entrez_summary("clinvar",id=res$ids)
                            info<-extract_from_esummary(cv,
                                                        "variation_set",
                                                        simplify=FALSE)
                            significance<-extract_from_esummary(cv,
                                                                "clinical_significance",
                                                                simplify=FALSE)
                            for(j in seq_along(res$ids)){
                                info2<-info[res$ids[j]][[1]][[1]]
                                significance2<-significance[res$ids[j]][[1]][[1]]
                                if(length(info2$variation_loc[[1]])){
                                    for(k in seq_along(info2$variation_loc[[1]][,1])){
                                        if(info2$variation_loc[[1]][k,2]=="GRCh37"){
                                            temp<-data.frame(Gene=NA,Start=NA,
                                                             Stop=NA,Ref=NA,Alt=NA)
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
                    for(i in seq_along(frequency_calls[,1])){
                        progress$inc(0,detail="-> Pre-processing of the calls ")
                        for(j in 1:(length(strsplit(frequency_calls[i,7],
                                                    split=",")[[1]]))){
                            if(j==1){
                                c.[i]<-paste("c.",
                                             strsplit(frequency_calls[i,7],
                                                      split=",")[[1]][j],
                                             frequency_calls[i,4],">",
                                             frequency_calls[i,5],sep="")
                                c.complement[i]<-paste("c.",
                                                       strsplit(frequency_calls[i,7],
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
                                    p.[i]<-paste("p.",
                                                 strsplit(frequency_calls[i,9],split=",")[[1]][j],
                                                 strsplit(frequency_calls[i,8],split=",")[[1]][j],
                                                 strsplit(frequency_calls[i,10],split=",")[[1]][j],
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
                                                     strsplit(frequency_calls[i,8],split=",")[[1]][j],
                                                     "fs",sep="")
                                    }
                                    if((nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])%%3)==0&&
                                       (nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])%%3)==0){
                                        p.[i]<-paste("p.",
                                                     as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                                     strsplit(frequency_calls[i,8],split=",")[[1]][j],
                                                     as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,12],split=",")[[1]][j]))),sep="")
                                    }
                                }
                            }
                            if(j>1){
                                c.[i]<-paste(c.[i],
                                             paste("c.",
                                                   strsplit(frequency_calls[i,7],split=",")[[1]][j],
                                                   frequency_calls[i,4],">",
                                                   frequency_calls[i,5],sep=""),
                                             sep=",")
                                c.complement[i]<-paste(c.complement[i],
                                                       paste("c.",
                                                             strsplit(frequency_calls[i,7],split=",")[[1]][j],
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
                                    p.[i]<-paste(p.[i],
                                                 paste("p.",
                                                       strsplit(frequency_calls[i,9],split=",")[[1]][j],
                                                       strsplit(frequency_calls[i,8],split=",")[[1]][j],
                                                       strsplit(frequency_calls[i,10],split=",")[[1]][j],
                                                       sep=""),
                                                 sep=",")
                                }
                                if(!is.na(strsplit(frequency_calls[i,11],split=",")[[1]][j])&&
                                   !is.na(strsplit(frequency_calls[i,12],split=",")[[1]][j])&&
                                   strsplit(frequency_calls[i,11],split=",")[[1]][j]!="NA"&&
                                   strsplit(frequency_calls[i,12],split=",")[[1]][j]!="NA"&&
                                   (nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])!=3||
                                    nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])!=3)){
                                    if((nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])%%3)!=0||
                                       (nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])%%3)!=0){
                                        p.[i]<-paste(p.[i],
                                                     paste("p.",
                                                           as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                                           strsplit(frequency_calls[i,8],split=",")[[1]][j],
                                                           "fs",sep=""),
                                                     sep=",")
                                    }
                                    if((nchar(strsplit(frequency_calls[i,11],split=",")[[1]][j])%%3)==0&&
                                       (nchar(strsplit(frequency_calls[i,12],split=",")[[1]][j])%%3)==0){
                                        p.[i]<-paste(p.[i],
                                                     paste("p.",
                                                           as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,11],split=",")[[1]][j]))),
                                                           strsplit(frequency_calls[i,8],split=",")[[1]][j],
                                                           as.character(Biostrings::translate(DNAString(strsplit(frequency_calls[i,12],split=",")[[1]][j]))),sep=""),sep=",")
                                    }
                                }
                            }
                        }
                    }

                    for(i in seq_along(frequency_calls[,1])){
                        progress$inc(1/length(results[,1]),
                                     detail=paste("-> Call ",i," out of ",
                                                  length(results[,1])))
                        #SNPs
                        if(nchar(frequency_calls[i,4])==1&&
                           nchar(frequency_calls[i,5])==1){
                            snp_info<-snpsByOverlaps(snps,
                                                     paste(frequency_calls[i,2],
                                                           ":",
                                                           frequency_calls[i,3],
                                                           "-",
                                                           frequency_calls[i,3],
                                                           sep=""))
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
                            if(!is.null(input$`1kgenomes`)){
                                snp_info<-gscores(g1000,
                                                  GRanges(paste(frequency_calls[i,2],
                                                                ":",
                                                                frequency_calls[i,3],
                                                                sep="")))
                                if(length(snp_info)>0){
                                    results$G1000_AF[i]<-max(snp_info$AF)
                                }
                            }
                            if(!is.null(input$exac)){
                                snp_info<-gscores(exac,
                                                  GRanges(paste(frequency_calls[i,2],
                                                                ":",
                                                                frequency_calls[i,3],
                                                                sep="")))
                                if(length(snp_info)>0){
                                    results$ExAC_AF[i]<-max(snp_info$AF)
                                }
                            }
                            if(!is.null(input$esp)){
                                snp_info<-gscores(esp6500,
                                                  GRanges(paste(frequency_calls[i,2],
                                                                ":",
                                                                frequency_calls[i,3],
                                                                sep="")))
                                if(length(snp_info)>0){
                                    results$ESP6500_AF[i]<-max(snp_info$AF)
                                }
                            }
                            if(!is.null(input$gad)){
                                snp_info<-gscores(gad,
                                                  GRanges(paste(frequency_calls[i,2],
                                                                ":",
                                                                frequency_calls[i,3],
                                                                sep="")))
                                if(length(snp_info)>0){
                                    results$GAD_AF[i]<-max(snp_info$AF)
                                }
                            }
                            if(!is.null(input$cosmic)){
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
                                                                               names(snp_info[j,]),sep=",")
                                                    results$Cosmic_Counts[i]<-paste(results$Cosmic_Counts[i],
                                                                                    snp_info2$CNT,sep=",")
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
                            if(!is.null(input$clinvar)){
                                snp_info_temp<-data.frame()
                                for(j in seq_along(strsplit(frequency_calls[i,14],
                                                           split=",")[[1]])){
                                    if(!is.na(strsplit(frequency_calls[i,14],split=",")[[1]][j])){
                                        temp<-clinvar[grep(strsplit(frequency_calls[i,14],split=",")[[1]][j],clinvar[,1]),]
                                        temp2<-temp[nchar(temp[,4])==1&nchar(temp[,5])==1&temp[,4]!="-"&temp[,5]!="-",]
                                        if(length(snp_info_temp)>0){
                                            snp_info_temp<-rbind(snp_info_temp,
                                                                 temp2)
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
                                            snp_info2[1,5]==frequency_calls[i,5])||
                                           (snp_info2[1,4]==as.character(complement(DNAString(frequency_calls[i,4])))&&
                                            snp_info2[1,5]==as.character(complement(DNAString(frequency_calls[i,5]))))){
                                            results$ClinVar[i]<-snp_info2[1,6]
                                        }
                                    }
                                }
                            }
                        }
                        #Indels
                        if(nchar(frequency_calls[i,4])!=1||
                           nchar(frequency_calls[i,5])!=1){
                            suppressWarnings(snp_info<-snpsByOverlaps(indels,paste("ch",frequency_calls[i,2],":",frequency_calls[i,3],"-",(as.numeric(frequency_calls[i,3])+nchar(frequency_calls[i,4])-1),sep="")))
                            if(length(snp_info)>0){
                                snp_info_rs<-snp_info$RefSNP_id[(start(ranges(snp_info))<=frequency_calls[i,3])&(end(ranges(snp_info))>=(as.numeric(frequency_calls[i,3])+nchar(frequency_calls[i,4])-1))]
                                if(length(snp_info_rs)>0){
                                    ncbi<-ncbi_snp_query(snp_info_rs)
                                    for(j in seq_along(ncbi[,1])){
                                        if(nchar(results[i,4])>nchar(results[i,5])){
                                            if(length(grep(substr(results[i,4],
                                                                  2,
                                                                  nchar(results[i,4])),
                                                           ncbi[j,9]))>0){
                                                results[i,6]<-ncbi[j,1]
                                            }
                                        }
                                        if(nchar(results[i,4])<nchar(results[i,5])){
                                            if(length(grep(substr(results[i,5],
                                                                  2,
                                                                  nchar(results[i,5])),
                                                           ncbi[j,9]))>0){
                                                results[i,6]<-ncbi[j,1]
                                            }
                                        }
                                    }
                                }
                            }
                            if(!is.null(input$cosmic)){
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
                                                    results$CosmicID[i]<-paste(results$CosmicID[i],names(snp_info[j,]),sep=",")
                                                    results$Cosmic_Counts[i]<-paste(results$Cosmic_Counts[i],snp_info2$CNT,sep=",")
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
                            if(!is.null(input$clinvar)){
                                snp_info_temp<-data.frame()
                                for(j in seq_along(strsplit(frequency_calls[i,14],
                                                           split=",")[[1]])){
                                    if(!is.na(strsplit(frequency_calls[i,14],
                                                       split=",")[[1]][j])){
                                        temp<-clinvar[grep(strsplit(frequency_calls[i,14],
                                                                    split=",")[[1]][j],
                                                           clinvar[,1]),]
                                        temp2<-temp[nchar(temp[,4])>1|nchar(temp[,5])>1|temp[,4]=="-"|temp[,5]=="-",]
                                        if(length(snp_info_temp)>0){
                                            snp_info_temp<-rbind(snp_info_temp,
                                                                 temp2)
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
                                               snp_info2[j,5]==substr(frequency_calls[i,5],
                                                                      2,
                                                                      nchar(frequency_calls[i,5]))){
                                                results$ClinVar[i]<-snp_info2[j,6]
                                            }
                                            if(snp_info2[j,5]=="-"&&
                                               snp_info2[j,4]==substr(frequency_calls[i,4],
                                                                      2,
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
                        suppressWarnings(ncbi<-ncbi_snp_query2(results[!is.na(results[,6]),6]))
                    }
                    if(length(results[!is.na(results[,6]),6])>3){
                        abfrage<-results[!is.na(results[,6]),6]
                        if(((length(results[!is.na(results[,6]),6])-1)%%3)==0){
                            limits<-seq(1,
                                        length(results[!is.na(results[,6]),6]),
                                        3)
                        }
                        if(((length(results[!is.na(results[,6]),6])-1)%%3)!=0){
                            limits<-c(seq(1,
                                          length(results[!is.na(results[,6]),6]),
                                          3),
                                      length(results[!is.na(results[,6]),6]))
                        }
                        suppressWarnings(ncbi<-ncbi_snp_query(abfrage[1:3]))
                        for(i in 2:(length(limits)-1)){
                            suppressWarnings(temp<-ncbi_snp_query(abfrage[limits[i]:(limits[i+1]-1)]))
                            ncbi<-rbind(ncbi,temp)
                        }
                    }
                    for(i in seq_along(results[,1])){
                        if(!is.na(results[i,6])){
                            results$dbSNP_MAF[i]<-as.numeric(max(ncbi[ncbi[,1]==results[i,6],10]))
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
                    progress$close()

                    results<-cbind(results,Prediction=NA,Score=NA)
                    progress <- shiny::Progress$new()
                    progress$set(message = "6. Determine Extended Set of Characteristics (prediction)",
                                 value = 0)
                    if(input$predict!="PolyPhen2"){
                        for(i in seq(1,length(results[,6]))[!is.na(results[,6])]){
                            progress$inc(1/length(seq(1,length(results[,6]))[!is.na(results[,6])]),
                                         detail=paste("-> Call ",i," out of ",
                                                      length(results[,1])))
                            suppressWarnings(info<-select(SIFT.Hsapiens.dbSNP137,keys=substr(results[i,6],3,nchar(results[i,6]))))
                            if(length(info)>0){
                                if(input$predict=="SIFT"){
                                    #score <0.05 -> damaging (else: tolerated)
                                    results$Prediction[i]<-info[which.min(info[,15]),16]
                                    results$Score[i]<-min(info[,15])
                                }
                                if(input$predict=="Provean"){
                                    #score <-2.5 -> deleterious (else: neutral)
                                    results$Prediction[i]<-info[which.min(info[,11]),12]
                                    results$Score[i]<-min(info[,11])
                                }
                            }
                        }
                    }
                    if(input$predict=="PolyPhen2"){
                        #Polyphen (probably damaging, possibly damaging, benign,
                        #unknown); probability of variant being damaging
                        for(i in seq(1,length(results[,6]))[!is.na(results[,6])]){
                            progress$inc(1/length(seq(1,length(results[,6]))[!is.na(results[,6])]),
                                         detail=paste("-> Call ",i," out of ",
                                                      length(results[,1])))
                            suppressWarnings(info<-select(PolyPhen.Hsapiens.dbSNP131,keys=results[i,6]))
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
                    for(i in seq_along(checkpoint[,1])){
                        for(j in 2:length(checkpoint[1,])){
                            if(!is.na(checkpoint[i,j])){
                                checkpoint[i,j]<-6
                            }
                        }
                    }
                    if(is.null(input$dbSNP)){
                        database_calls<-cbind(results[,c(1:5,8:(length(results[1,])))],
                                              c.,c.complement,p.)
                    }
                    if(!is.null(input$dbSNP)){
                        database_calls<-cbind(results,c.,c.complement,p.)
                    }
                    write.table(database_calls,
                                paste(input$output_folder,
                                      "/Results_Databases.txt",sep=""),
                                row.names=FALSE,quote=FALSE,sep="\t")
                    write.table(checkpoint,
                                paste(input$output_folder,"/checkpoint.txt",
                                      sep=""),
                                row.names=FALSE,quote=FALSE,sep="\t")
                    checkpoint_state<-6
                    progress$close()
                }

                #6: After Extended Set of Characteristics
                if(checkpoint_state==6){
                    if(exists("frequency_calls")==FALSE||
                       exists("database_calls")==FALSE||
                       exists("combined_calls")==FALSE){
                        #1. Reading Input
                        log_info<-c(log_info,"0. Reading input<br>")
                        output$log_info<-renderUI({HTML(log_info)})
                        frequency_calls<-read.table(paste(input$output_folder,
                                                          "/Results_Frequency.txt",
                                                          sep=""),
                                                    stringsAsFactors = FALSE,
                                                    header=TRUE,sep="\t")
                        database_calls<-read.table(paste(input$output_folder,
                                                         "/Results_Databases.txt",
                                                         sep=""),
                                                   stringsAsFactors = FALSE,
                                                   header=TRUE,sep="\t")
                        combined_calls<-read.table(paste(input$output_folder,
                                                         "/Results_Raw.txt",
                                                         sep=""),
                                                   stringsAsFactors = FALSE,
                                                   header=TRUE,sep="\t")
                    }

                    #7. Final filtration
                    log_info<-c(log_info,"7. Perform Final Filtration<br>")
                    output$log_info<-renderUI({HTML(log_info)})
                    progress <- shiny::Progress$new()
                    progress$set(message = "7. Perform final filtration",
                                 value = 0)

                    if(input$stricter_thresholds=="No"){
                        dp<-input$dp
                        nr_alt<-input$nr_alt
                        vaf<-input$vaf
                        low_bq<-input$low_bq
                        bq_diff<-input$bq_diff
                    }
                    if(input$stricter_thresholds=="Yes"){
                        dp<-input$dp2
                        nr_alt<-input$nr_alt2
                        vaf<-input$vaf2
                        low_bq<-input$bq2
                        bq_diff<-input$bq_diff2
                    }
                    nrsamples<-input$nr_samples
                    nrsamples_high<-ceiling(length(checkpointFile[,1])/2)
                    if(nrsamples_high==1){
                        nrsamples_high<-2
                    }
                    if(input$predict=="SIFT"){
                        limit_provean<-input$damaging_safe1
                        limit_provean2<-input$tolerated_safe1
                    }
                    if(input$predict=="Provean"){
                        limit_provean<-input$damaging_safe2
                        limit_provean2<-input$tolerated_safe2
                    }
                    if(input$predict=="PolyPhen2"){
                        limit_provean<-input$damaging_safe3
                        limit_provean2<-input$tolerated_safe3
                    }

                    if(!is.null(input$primerPositions)){
                        primer_temp<-input$primerPositions
                        primer<-read.table(primer_temp$datapath,
                                           header=FALSE,sep="\t",
                                           stringsAsFactors=FALSE)
                    }
                    if(!is.null(input$hotspots)){
                        hotspots_temp<-input$hotspots
                        hotspots<-read.table(hotspots_temp$datapath,
                                             header=TRUE,sep="\t",
                                             stringsAsFactors=FALSE)
                    }

                    results<-cbind(frequency_calls[,c(1:5,14:16,6,13)],
                                   database_calls[,c((length(database_calls[1,])-2):length(database_calls[1,]))],
                                   frequency_calls[,c(11,12)],
                                   Nr_Ref=frequency_calls$Nr_Ref,
                                   Nr_Alt=frequency_calls$Nr_Alt,
                                   DP=frequency_calls$DP,
                                   VAF=frequency_calls$VAF,
                                   frequency_calls[,c(17:(length(frequency_calls[1,])-14))],
                                   Called=rowSums(frequency_calls[,c(17:(length(frequency_calls[1,])-14))],na.rm=TRUE),
                                   database_calls[,c(6:(length(database_calls[1,])-3))],
                                   frequency_calls[,c((length(frequency_calls[1,])-9):(length(frequency_calls[1,])))])

                    artifact_because<-data.frame(nr_samples=rep(NA,length(frequency_calls[,1])),
                                                 nr_samples_similar=rep(NA,length(frequency_calls[,1])),
                                                 nr_databases=rep(NA,length(frequency_calls[,1])),
                                                 polymorphism_db=rep(NA,length(frequency_calls[,1])),
                                                 mutation_db=rep(NA,length(frequency_calls[,1])),
                                                 cosmic_nr=rep(NA,length(frequency_calls[,1])),
                                                 Poly_freq=rep(NA,length(frequency_calls[,1])))

                    #filter frequency
                    if(input$stricter_thresholds=="Yes"){
                        progress$inc(1/13,
                                     detail="->  Consider Frequency and Base Quality")
                        include1<-results$DP>=dp
                        include2<-results$Nr_Alt>=nr_alt
                        include3<-(results$VAF*100)>=vaf
                        include4<-results$BQ_ALT>=low_bq
                        include5<-(results$BQ_REF-results$BQ_ALT)<=bq_diff
                        temp<-results[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                        results<-temp
                        temp<-frequency_calls[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                        frequency_calls<-temp
                        temp<-database_calls[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                        database_calls<-temp
                        temp<-artifact_because[rowSums(cbind(include1,include2,include3,include4,include5))>=5|is.na(rowSums(cbind(include1,include2,include3,include4,include5))>=5),]
                        artifact_because<-temp
                    }
                    if(input$stricter_thresholds=="No"){
                        progress$inc(1/13)
                    }

                    #nr of samples
                    progress$inc(1/13,
                                 detail="->  Consider samples with the same call")
                    progress_small <- shiny::Progress$new()
                    progress_small$set(message = "", value = 0)
                    for(i in seq_along(results[,1])){
                        progress_small$inc(1/length(results[,1]),
                                           detail=paste("-> Call ",i," out of ",
                                                        length(results[,1])))
                        artifact_because[i,1]<-length(combined_calls[intersect(intersect(grep(results[i,2],combined_calls[,2]),grep(results[i,3],combined_calls[,3])),intersect(grep(results[i,4],combined_calls[,4]),grep(results[i,5],combined_calls[,5]))),1])
                    }
                    progress_small$close()

                    progress$inc(1/13,
                                 detail="->  Consider samples with a call at the same position")
                    progress_small <- shiny::Progress$new()
                    progress_small$set(message = "", value = 0)
                    for(i in seq_along(results[,1])){
                        progress_small$inc(1/length(results[,1]),
                                           detail=paste("-> Call ",i," out of ",
                                                        length(results[,1])))
                        artifact_because[i,2]<-length(combined_calls[intersect(grep(results[i,2],combined_calls[,2]),grep(results[i,3],combined_calls[,3])),1])
                    }
                    progress_small$close()

                    progress$inc(1/13,
                                 detail="->  Consider background information")
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
                    progress$inc(1/13,detail="->  Consider nr of databases")
                    if(length(database_calls[1,])>10){
                        if(length(grep("dbSNP",names(database_calls)))>0){
                            for(i in seq_along(database_calls[,1])){
                                if(!is.na(results$dbSNP[i])){
                                    artifact_because[i,3]<-sum(artifact_because[i,3],1,na.rm=TRUE)
                                    if(!is.na(results$dbSNP_MAF[i])&&
                                       as.numeric(results$dbSNP_MAF[i])<=0.001){
                                        artifact_because[i,5]<-sum(artifact_because[i,5],1,na.rm=TRUE)
                                    }
                                    if(!is.na(results$dbSNP_MAF[i])&&
                                       as.numeric(results$dbSNP_MAF[i])>0.001){
                                        artifact_because[i,4]<-sum(artifact_because[i,4],1,na.rm=TRUE)
                                    }
                                }
                            }
                        }
                        if(length(grep("G1000_AF",names(database_calls)))>0){
                            for(i in seq_along(database_calls[,1])){
                                if(!is.na(results$G1000_AF[i])){
                                    artifact_because[i,3]<-sum(artifact_because[i,3],1,na.rm=TRUE)
                                    if(as.numeric(results$G1000_AF[i])<=0.001){
                                        artifact_because[i,5]<-sum(artifact_because[i,5],1,na.rm=TRUE)
                                    }
                                    if(as.numeric(results$G1000_AF[i])>0.001){
                                        artifact_because[i,4]<-sum(artifact_because[i,4],1,na.rm=TRUE)
                                    }
                                }
                            }
                        }
                        if(length(grep("ExAC_AF",names(database_calls)))>0){
                            for(i in seq_along(database_calls[,1])){
                                if(!is.na(results$ExAC_AF[i])){
                                    artifact_because[i,3]<-sum(artifact_because[i,3],1,na.rm=TRUE)
                                    if(as.numeric(results$ExAC_AF[i])<=0.0005){
                                        artifact_because[i,5]<-sum(artifact_because[i,5],1,na.rm=TRUE)
                                    }
                                    if(as.numeric(results$ExAC_AF[i])>0.0005){
                                        artifact_because[i,4]<-sum(artifact_because[i,4],1,na.rm=TRUE)
                                    }
                                }
                            }
                        }
                        if(length(grep("ESP6500_AF",names(database_calls)))>0){
                            for(i in seq_along(database_calls[,1])){
                                if(!is.na(results$ESP6500_AF[i])){
                                    artifact_because[i,3]<-sum(artifact_because[i,3],1,na.rm=TRUE)
                                    if(as.numeric(results$ESP6500_AF[i])<=0.0003){
                                        artifact_because[i,5]<-sum(artifact_because[i,5],1,na.rm=TRUE)
                                    }
                                    if(as.numeric(results$ESP6500_AF[i])>0.0003){
                                        artifact_because[i,4]<-sum(artifact_because[i,4],1,na.rm=TRUE)
                                    }
                                }
                            }
                        }
                        if(length(grep("GAD_AF",names(database_calls)))>0){
                            for(i in seq_along(database_calls[,1])){
                                if(!is.na(results$GAD_AF[i])){
                                    artifact_because[i,3]<-sum(artifact_because[i,3],1,na.rm=TRUE)
                                    if(as.numeric(results$GAD_AF[i])<=0.001){
                                        artifact_because[i,5]<-sum(artifact_because[i,5],1,na.rm=TRUE)
                                    }
                                    if(as.numeric(results$GAD_AF[i])>0.001){
                                        artifact_because[i,4]<-sum(artifact_because[i,4],1,na.rm=TRUE)
                                    }
                                }
                            }
                        }
                        if(length(grep("CosmicID",names(database_calls)))>0){
                            for(i in seq_along(database_calls[,1])){
                                if(!is.na(results$CosmicID[i])){
                                    artifact_because[i,3]<-sum(artifact_because[i,3],1,na.rm=TRUE)
                                    artifact_because[i,6]<-sum(as.numeric(strsplit(as.character(database_calls$Cosmic_Counts[i]),split=",")[[1]]))
                                    if(artifact_because[i,6]>20){
                                        artifact_because[i,5]<-sum(artifact_because[i,5],1,na.rm=TRUE)
                                    }
                                    if(artifact_because[i,6]<=20){
                                        artifact_because[i,4]<-sum(artifact_because[i,4],1,na.rm=TRUE)
                                    }
                                }
                            }
                        }
                        if(length(grep("ClinVar",names(database_calls)))>0){
                            for(i in seq_along(database_calls[,1])){
                                if(!is.na(results$ClinVar[i])){
                                    artifact_because[i,3]<-sum(artifact_because[i,3],1,na.rm=TRUE)
                                    if(length(grep("Pathogenic",
                                                   results$ClinVar[i],
                                                   ignore.case = TRUE))>0){
                                        artifact_because[i,5]<-sum(artifact_because[i,5],1,na.rm=TRUE)
                                    }
                                    if(length(grep("Benign",
                                                   results$ClinVar[i],
                                                   ignore.case = TRUE))>0){
                                        artifact_because[i,4]<-sum(artifact_because[i,4],1,na.rm=TRUE)
                                    }
                                }
                            }
                        }
                    }

                    #tolerated and freq
                    progress$inc(1/13,detail="->  Consider VAF when tolerated")
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
                    progress$inc(1/13,
                                 detail="->  Consider VAF when high nr of samples")
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

                    #test for strand bias (8 von 15)
                    progress$inc(1/13,detail="->  Consider strand bias")
                    strandbias<-rep(NA,length(results[,1]))
                    for(i in seq_along(results[,1])){
                        if(!is.na(results$Nr_Ref_fwd[i])&&
                           !is.na(results$Nr_Alt_fwd[i])&&
                           !is.na(results$Nr_Ref_rev[i])&&
                           !is.na(results$Nr_Alt_rev[i])){
                            test<-fisher.test(x=matrix(c(results$Nr_Ref_fwd[i],
                                                         results$Nr_Alt_fwd[i],
                                                         results$Nr_Ref_rev[i],
                                                         results$Nr_Alt_rev[i]),
                                                       ncol=2))
                            strandbias[i]<-test$p.value
                        }
                        if(!is.null(input$primerPositions)){
                            chr<-as.character(results[i,2])==as.character(primer[,1])
                            start<-results[i,3]>primer[,2]
                            end<-(as.numeric(results[i,3])+nchar(results[i,4])-1)<=primer[,3]
                            if(sum(rowSums(cbind(chr,start,end))==3)>0){
                                strandbias[i]<-2
                            }
                        }
                    }

                    #check for hotspots
                    progress$inc(1/13,detail="->  Consider hotspot list")
                    hotspot<-rep(NA,length(results[,1]))
                    progress_small <- shiny::Progress$new()
                    progress_small$set(message = "", value = 0)
                    if(!is.null(input$hotspots)){
                        for(i in seq_along(hotspots[,1])){
                            progress_small$inc(1/length(hotspots[,1]),
                                               detail=paste("->  Hotspot",i,
                                                            "out of",
                                                            length(hotspots[,1])))
                            found1<-grep(hotspots[i,1],results$Gene)
                            if(length(found1)>0){
                                if(length(grep("fs",hotspots[i,2]))==0&&
                                   length(grep("del",hotspots[i,2]))==0&&
                                   length(grep("ins",hotspots[i,2]))==0){
                                    #Just an SNV
                                    found2<-grep(hotspots[i,2],results$p.,
                                                 fixed=TRUE)
                                    flag<-NA
                                    if(length(found2)>0){
                                        flag<-rep(FALSE,length(results[,1]))
                                        if(is.na(hotspots[i,3])){
                                            for(j in seq_along(found2)){
                                                flag[found2[j]]<-nchar(results$Ref[found2[j]])==1&&
                                                    nchar(results$Alt[found2[j]])==1
                                            }
                                        }
                                        if(!is.na(hotspots[i,3])){
                                            for(j in seq_along(found2)){
                                                flag[found2[j]]<-nchar(results$Ref[found2[j]])==1&&
                                                    nchar(results$Alt[found2[j]])==1&&
                                                    as.numeric(results$VAF[found2[j]])>=as.numeric(hotspots[i,3])
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
                                    searchstring<-strsplit(searchstring_temp,
                                                           split="_")[[1]][1]
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
                    progress_small$close()
                    write.table(cbind(hotspot,results),
                                paste(input$output_folder,"Hotspot_test.txt"),
                                sep="\t",quote=FALSE,row.names=FALSE)

                    ##final filtration
                    results<-cbind(results,strandbias,artifact_because[,c(1:2)],
                                   Category=NA)

                    #artifact score
                    progress$inc(1/13,detail="->  Perform final filtration")
                    artifact_score<-rep(0,length(results[,1]))
                    progress_small <- shiny::Progress$new()
                    progress_small$set(message = "Calculate Artifact Score",
                                       value = 0)
                    if(input$artifact_score=="No"){
                        for(i in seq_along(results[,1])){
                            progress_small$inc(1/length(results[,1]),
                                               detail=paste("-> Call",i,
                                                            "out of",
                                                            length(results[,1])))
                            if(results$nr_samples[i]>nrsamples){
                                artifact_score[i]<-artifact_score[i]+2
                            }
                            if(results$nr_samples[i]>nrsamples_high&&
                               is.na(hotspot[i])){
                                artifact_score[i]<-artifact_score[i]+2
                            }
                            if((nchar(results$Ref[i])>1||
                                nchar(results$Alt[i])>1)&&
                               results$nr_samples_similar[i]>results$nr_samples[i]){
                                artifact_score[i]<-artifact_score[i]+1
                            }
                            if((nchar(results$Ref[i])>1||
                                nchar(results$Alt[i])>1)&&
                               !is.na(results$VAF[i])&&results$VAF[i]<0.05){
                                artifact_score[i]<-artifact_score[i]+1
                            }
                            if(!is.na(artifact_because[i,7])&&
                               artifact_because[i,7]==2){
                                artifact_score[i]<-artifact_score[i]+2
                            }
                            if(is.null(input$primerPositions)||
                               (!is.na(results$strandbias[i])&&
                                results$strandbias[i]!=2)){
                                if(!is.na(results$strandbias[i])&&
                                   results$strandbias[i]<0.001){
                                    artifact_score[i]<-artifact_score[i]+1
                                }
                                if(!is.na(results$Nr_Alt_fwd[i])&&
                                   !is.na(results$Nr_Alt_rev[i])&&
                                   (results$Nr_Alt_fwd[i]>=(nr_alt/2)&&
                                    results$Nr_Alt_rev[i]>=(nr_alt/2))&&
                                   results$strandbias[i]<0.001){
                                    artifact_score[i]<-artifact_score[i]-1
                                }
                                if(!is.na(results$Nr_Ref_fwd[i])&&
                                   !is.na(results$Nr_Alt_fwd[i])&&
                                   (results$Nr_Alt_fwd[i]<=2&&
                                    results$Nr_Ref_fwd[i]>=(dp-nr_alt)/2)&&
                                   results$strandbias[i]>=0.001){
                                    artifact_score[i]<-artifact_score[i]+1
                                }
                                if(!is.na(results$Nr_Ref_fwd[i])&&
                                   !is.na(results$Nr_Alt_fwd[i])&&
                                   (results$Nr_Alt_fwd[i]<=2&&
                                    results$Nr_Ref_fwd[i]<(dp-nr_alt)/2)&&
                                   results$strandbias[i]<0.001){
                                    artifact_score[i]<-artifact_score[i]-1
                                }
                                if(!is.na(results$Nr_Ref_rev[i])&&
                                   !is.na(results$Nr_Alt_rev[i])&&
                                   (results$Nr_Alt_rev[i]<=2&&
                                    results$Nr_Ref_rev[i]>=(dp-nr_alt)/2)&&
                                   results$strandbias[i]>=0.001){
                                    artifact_score[i]<-artifact_score[i]+1
                                }
                                if(!is.na(results$Nr_Ref_rev[i])&&
                                   !is.na(results$Nr_Alt_rev[i])&&
                                   (results$Nr_Alt_rev[i]<=2&&
                                    results$Nr_Ref_rev[i]<(dp-nr_alt)/2)&&
                                   results$strandbias[i]<0.001){
                                    artifact_score[i]<-artifact_score[i]-1
                                }
                            }
                            if(!is.null(input$primerPositions)&&
                               !is.na(results$strandbias[i])&&
                               results$strandbias[i]==2){
                                artifact_score[i]<-artifact_score[i]-1
                            }
                            if(!is.na(results$VAF[i])&&results$VAF[i]<0.02){
                                artifact_score[i]<-artifact_score[i]+2
                            }
                            if(is.na(artifact_because[i,3])&&
                               !is.na(results$VAF[i])&&
                               results$VAF[i]<0.10){
                                artifact_score[i]<-artifact_score[i]+1
                            }
                            if(is.na(artifact_because[i,3])&&
                               results$nr_samples[i]>nrsamples_high){
                                artifact_score[i]<-artifact_score[i]+1
                            }
                            if((!is.na(results$Score[i])&&
                                results$Score[i]<limit_provean)){
                                artifact_score[i]<-artifact_score[i]-1
                            }
                            if(!is.na(results$Score[i])&&
                               results$Score[i]>limit_provean2&&
                               !is.na(artifact_because[i,7])&&
                               artifact_because[i,7]==0){
                                artifact_score[i]<-artifact_score[i]+1
                            }
                            if(results$Called[i]>=4){
                                artifact_score[i]<-artifact_score[i]-1
                            }
                            if(results$Called[i]>=5){
                                artifact_score[i]<-artifact_score[i]-1
                            }
                            if(results$Called[i]>=6){
                                artifact_score[i]<-artifact_score[i]-1
                            }
                            if(results$Called[i]==1){
                                artifact_score[i]<-artifact_score[i]+1
                            }
                            if(!is.na(results$BQ_ALT[i])&&
                               results$BQ_ALT[i]<(mean(results$BQ_ALT,na.rm=TRUE)-3*sd(results$BQ_ALT,na.rm=TRUE))){
                                artifact_score[i]<-artifact_score[i]+4
                            }
                            if(!is.na(hotspot[i])){
                                artifact_score[i]<-artifact_score[i]-3
                            }
                            if(!is.na(results$LoFreq[i])&&
                               !is.na(results$FreeBayes[i])&&
                               !is.na(results$VarDict[i])&&
                               results$LoFreq[i]==1&&
                               results$FreeBayes[i]==1&&results$VarDict[i]==1){
                                artifact_score[i]<-artifact_score[i]-3
                            }
                            if(artifact_score[i]>-1){
                                results$Category[i]<-paste("Artifact (",
                                                           artifact_score[i],
                                                           ")",sep="")
                            }
                            if(artifact_score[i]<=-1&&is.na(hotspot[i])){
                                results$Category[i]<-paste("Probably True (",
                                                           artifact_score[i],
                                                           ")",sep="")
                            }
                            if(artifact_score[i]<=-1&&!is.na(hotspot[i])){
                                results$Category[i]<-paste("Hotspot (",
                                                           artifact_score[i],
                                                           ")",sep="")
                            }
                        }
                    }
                    if(input$artifact_score=="Yes"){
                        for(i in seq_along(results[,1])){
                            progress_small$inc(1/length(results[,1]),
                                               detail=paste("-> Call",i,
                                                            "out of",
                                                            length(results[,1])))
                            if(results$nr_samples[i]>nrsamples){
                                artifact_score[i]<-artifact_score[i]+input$detectedLow
                            }
                            if(results$nr_samples[i]>nrsamples_high&&
                               is.na(hotspot[i])){
                                artifact_score[i]<-artifact_score[i]+input$detectedHigh
                            }
                            if((nchar(results$Ref[i])>1||
                                nchar(results$Alt[i])>1)&&
                               results$nr_samples_similar[i]>results$nr_samples[i]){
                                artifact_score[i]<-artifact_score[i]+input$isIndel
                            }
                            if((nchar(results$Ref[i])>1||
                                nchar(results$Alt[i])>1)&&
                               !is.na(results$VAF[i])&&results$VAF[i]<0.05){
                                artifact_score[i]<-artifact_score[i]+input$isIndelVAF
                            }
                            if(!is.na(artifact_because[i,7])&&
                               artifact_because[i,7]==2){
                                artifact_score[i]<-artifact_score[i]+input$detectedLowVAF
                            }
                            if(is.null(input$primerPositions)||
                               (!is.na(results$strandbias[i])&&
                                results$strandbias[i]!=2)){
                                if(!is.na(results$strandbias[i])&&
                                   results$strandbias[i]<0.001){
                                    artifact_score[i]<-artifact_score[i]+input$noPrimerP
                                }
                                if(!is.na(results$Nr_Alt_fwd[i])&&
                                   !is.na(results$Nr_Alt_rev[i])&&
                                   (results$Nr_Alt_fwd[i]>=(nr_alt/2)&&
                                    results$Nr_Alt_rev[i]>=(nr_alt/2))&&
                                   results$strandbias[i]<0.001){
                                    artifact_score[i]<-artifact_score[i]+input$primerPAlt
                                }
                                if(!is.na(results$Nr_Ref_fwd[i])&&
                                   !is.na(results$Nr_Alt_fwd[i])&&
                                   (results$Nr_Alt_fwd[i]<=2&&
                                    results$Nr_Ref_fwd[i]>=(dp-nr_alt)/2)&&
                                   results$strandbias[i]>=0.001){
                                    artifact_score[i]<-artifact_score[i]+input$noPrimerPFwd
                                }
                                if(!is.na(results$Nr_Ref_fwd[i])&&
                                   !is.na(results$Nr_Alt_fwd[i])&&
                                   (results$Nr_Alt_fwd[i]<=2&&
                                    results$Nr_Ref_fwd[i]<(dp-nr_alt)/2)&&
                                   results$strandbias[i]<0.001){
                                    artifact_score[i]<-artifact_score[i]+input$primerPFwd
                                }
                                if(!is.na(results$Nr_Ref_rev[i])&&
                                   !is.na(results$Nr_Alt_rev[i])&&
                                   (results$Nr_Alt_rev[i]<=2&&
                                    results$Nr_Ref_rev[i]>=(dp-nr_alt)/2)&&
                                   results$strandbias[i]>=0.001){
                                    artifact_score[i]<-artifact_score[i]+input$noPrimerPRev
                                }
                                if(!is.na(results$Nr_Ref_rev[i])&&
                                   !is.na(results$Nr_Alt_rev[i])&&
                                   (results$Nr_Alt_rev[i]<=2&&
                                    results$Nr_Ref_rev[i]<(dp-nr_alt)/2)&&
                                   results$strandbias[i]<0.001){
                                    artifact_score[i]<-artifact_score[i]+input$primerPRev
                                }
                            }
                            if(!is.null(input$primerPositions)&&
                               !is.na(results$strandbias[i])&&
                               results$strandbias[i]==2){
                                artifact_score[i]<-artifact_score[i]+input$primerLocation
                            }
                            if(!is.na(results$VAF[i])&&results$VAF[i]<0.02){
                                artifact_score[i]<-artifact_score[i]+input$vafLow
                            }
                            if(is.na(artifact_because[i,3])&&
                               !is.na(results$VAF[i])&&results$VAF[i]<0.10){
                                artifact_score[i]<-artifact_score[i]+input$databaseVAF
                            }
                            if(is.na(artifact_because[i,3])&&
                               results$nr_samples[i]>nrsamples_high){
                                artifact_score[i]<-artifact_score[i]+input$databaseHigh
                            }
                            if((!is.na(results$Score[i])&&
                                results$Score[i]<limit_provean)){
                                artifact_score[i]<-artifact_score[i]+input$predictionSafe
                            }
                            if(!is.na(results$Score[i])&&
                               results$Score[i]>limit_provean2&&
                               !is.na(artifact_because[i,7])&&
                               artifact_because[i,7]==0){
                                artifact_score[i]<-artifact_score[i]+input$predictionVAF
                            }
                            if(results$Called[i]>=input$nrcaller4){
                                artifact_score[i]<-artifact_score[i]+input$reward4
                            }
                            if(results$Called[i]>=input$nrcaller5){
                                artifact_score[i]<-artifact_score[i]+input$reward5
                            }
                            if(results$Called[i]>=input$nrcaller6){
                                artifact_score[i]<-artifact_score[i]+input$reward6
                            }
                            if(results$Called[i]==1){
                                artifact_score[i]<-artifact_score[i]+input$oneCaller
                            }
                            if(!is.na(results$BQ_ALT[i])&&
                               results$BQ_ALT[i]<(mean(results$BQ_ALT,na.rm=TRUE)-3*sd(results$BQ_ALT,na.rm=TRUE))){
                                artifact_score[i]<-artifact_score[i]+input$BQ_AltMean
                            }
                            if(!is.na(hotspot[i])){
                                artifact_score[i]<-artifact_score[i]+input$knownHotspot
                            }
                            temp<-frequency_calls[i,17:(length(frequency_calls[1,])-14)]
                            temp<-temp[,!is.na(temp)]
                            if(length(intersect(names(temp),input$overlapTools))==length(input$overlapTools)){
                                artifact_score[i]<-artifact_score[i]+input$overlapReward
                            }
                            if(artifact_score[i]>=input$artifactThreshold){
                                results$Category[i]<-paste("Artifact (",
                                                           artifact_score[i],
                                                           ")",sep="")
                            }
                            if(artifact_score[i]<input$artifactThreshold&&
                               is.na(hotspot[i])){
                                results$Category[i]<-paste("Probably True (",
                                                           artifact_score[i],
                                                           ")",sep="")
                            }
                            if(artifact_score[i]<input$artifactThreshold&&
                               !is.na(hotspot[i])){
                                results$Category[i]<-paste("Hotspot (",
                                                           artifact_score[i],
                                                           ")",sep="")
                            }
                        }
                    }
                    progress_small$close()

                    #polymorphism score
                    progress$inc(1/13,detail="->  Perform final filtration")
                    poly_score<-rep(0,length(results[,1]))
                    cosmic_flag<-rep(FALSE,length(results[,1]))
                    progress_small <- shiny::Progress$new()
                    progress_small$set(message = "Calculate Polymorphism Score",
                                       value = 0)
                    if(input$polymorphism_score=="No"){
                        for(i in seq_along(results[,1])){
                            progress_small$inc(1/length(results[,1]),
                                               detail=paste("-> Call",i,
                                                            "out of",
                                                            length(results[,1])))
                            if(!is.na(results$nr_samples[i])&&
                               results$nr_samples[i]>nrsamples){
                                poly_score[i]<-poly_score[i]+1
                            }
                            if(!is.na(results$nr_samples[i])&&
                               results$nr_samples[i]==1){
                                poly_score[i]<-poly_score[i]-1
                            }
                            if(!is.na(artifact_because[i,4])&&
                               artifact_because[i,4]>=2){
                                poly_score[i]<-poly_score[i]+1
                            }
                            if(!is.na(artifact_because[i,4])&&
                               artifact_because[i,4]>=4){
                                poly_score[i]<-poly_score[i]+1
                            }
                            if(!is.na(artifact_because[i,5])&&
                               artifact_because[i,5]>=2){
                                poly_score[i]<-poly_score[i]-1
                            }
                            if(is.na(artifact_because[i,4])){
                                poly_score[i]<-poly_score[i]-1
                            }
                            if(results$Called[i]>=6){
                                poly_score[i]<-poly_score[i]+1
                            }
                            if(!is.na(results$Consequence[i])&&
                               vcountPattern(pattern="frameshift",
                                             results$Consequence[i])>0&&
                               vcountPattern(pattern="*",
                                             as.character(results$p.[i]),
                                             fixed = TRUE)==0){
                                poly_score[i]<-poly_score[i]+1
                            }
                            if(!is.na(artifact_because[i,7])&&
                               artifact_because[i,7]==1){
                                poly_score[i]<-poly_score[i]+1
                            }
                            if(!is.na(results$Prediction[i])&&
                               (results$Prediction[i]=="Tolerated"||
                                results$Prediction[i]=="benign"||
                                results$Prediction[i]=="Neutral")&&
                               results$Score[i]>=limit_provean2){
                                poly_score[i]<-poly_score[i]+1
                            }
                            if(!is.na(results$Score[i])&&!is.na(results$p.[i])&&
                               as.character(results$p.[i])!="NA"&&
                               (results$Score[i]<=limit_provean||
                                vcountPattern(pattern="*",
                                              as.character(results$p.[i]),
                                              fixed = TRUE)>0)){
                                poly_score[i]<-poly_score[i]-1
                            }
                            if(!is.na(results$Cosmic_Counts[i])&&
                               results$Cosmic_Counts[i]>100){
                                cosmic_flag[i]<-TRUE
                            }
                            if(is.na(hotspot[i])&&poly_score[i]>=2&&
                               cosmic_flag[i]==TRUE){
                                results$Category[i]<-paste(results$Category[i],
                                                           "Likely Polymorphism",
                                                           sep="")
                            }
                            if(is.na(hotspot[i])&&((poly_score[i]>=2&&
                                                    cosmic_flag[i]==FALSE)
                                                   ||poly_score[i]>=3)){
                                results$Category[i]<-"Polymorphism"
                            }
                        }
                    }
                    if(input$polymorphism_score=="Yes"){
                        for(i in seq_along(results[,1])){
                            progress_small$inc(1/length(results[,1]),
                                               detail=paste("-> Call",i,
                                                            "out of",
                                                            length(results[,1])))
                            if(!is.na(results$nr_samples[i])&&
                               results$nr_samples[i]>nrsamples){
                                poly_score[i]<-poly_score[i]+input$polyDetected
                            }
                            if(!is.na(results$nr_samples[i])&&
                               results$nr_samples[i]==1){
                                poly_score[i]<-poly_score[i]+input$polyDetectedOnce
                            }
                            if(!is.na(artifact_because[i,4])&&
                               artifact_because[i,4]>=input$polyDatabasesPolyLow){
                                poly_score[i]<-poly_score[i]+input$polyDatabasesPolyLowReward
                            }
                            if(!is.na(artifact_because[i,4])&&
                               artifact_because[i,4]>=input$polyDatabasesPolyHigh){
                                poly_score[i]<-poly_score[i]+input$polyDatabasesPolyHighReward
                            }
                            if(!is.na(artifact_because[i,5])&&
                               artifact_because[i,5]>=input$polyDatabasesMut){
                                poly_score[i]<-poly_score[i]+input$polyDatabasesMutReward
                            }
                            if(is.na(artifact_because[i,4])){
                                poly_score[i]<-poly_score[i]+input$polyNoDatabase
                            }
                            if(results$Called[i]>=input$polyDatabases){
                                poly_score[i]<-poly_score[i]+input$polyDatabasesReward
                            }
                            if(!is.na(results$Consequence[i])&&
                               vcountPattern(pattern="frameshift",
                                             results$Consequence[i])>0&&
                               vcountPattern(pattern="*",
                                             as.character(results$p.[i]),
                                             fixed = TRUE)==0){
                                poly_score[i]<-poly_score[i]+input$polyEffect
                            }
                            if(!is.na(artifact_because[i,7])&&
                               artifact_because[i,7]==1){
                                poly_score[i]<-poly_score[i]+input$polyVAF
                            }
                            if(!is.na(results$Prediction[i])&&
                               (results$Prediction[i]=="Tolerated"||
                                results$Prediction[i]=="benign"||
                                results$Prediction[i]=="Neutral")&&
                               results$Score[i]>=limit_provean2){
                                poly_score[i]<-poly_score[i]+input$polyPrediction
                            }
                            if(!is.na(results$Score[i])&&
                               !is.na(results$p.[i])&&
                               as.character(results$p.[i])!="NA"&&
                               (results$Score[i]<=limit_provean||
                                vcountPattern(pattern="*",
                                              as.character(results$p.[i]),
                                              fixed = TRUE)>0)){
                                poly_score[i]<-poly_score[i]+input$polyPredictionEffect
                            }
                            if(!is.na(results$Cosmic_Counts[i])&&
                               results$Cosmic_Counts[i]>input$polyCosmic){
                                cosmic_flag[i]<-TRUE
                            }
                            if(is.na(hotspot[i])&&
                               poly_score[i]>=input$polyThresholdCritical&&
                               cosmic_flag[i]==TRUE){
                                results$Category[i]<-paste(results$Category[i],
                                                           "Likely Polymorphism",
                                                           sep="")
                            }
                            if(is.na(hotspot[i])&&
                               ((poly_score[i]>=input$polyThresholdCritical&&
                                 cosmic_flag[i]==FALSE)||
                                poly_score[i]>=input$polyThreshold)){
                                results$Category[i]<-"Polymorphism"
                            }
                        }
                    }
                    progress_small$close()

                    #corrections
                    progress$inc(1/13,detail="->  Perform final filtration")
                    progress_small <- shiny::Progress$new()
                    progress_small$set(message = "Correct Scores", value = 0)
                    if(input$artifact_score=="No"){
                        for(i in seq_along(results[,1])){
                            progress_small$inc(1/length(results[,1]),
                                               detail=paste("-> Call",i,
                                                            "out of",
                                                            length(results[,1])))
                            if((poly_score[i]>=2&&cosmic_flag[i]==TRUE&&
                                is.na(hotspot[i]))||(is.na(hotspot[i])&&
                                                     ((poly_score[i]>=2&&
                                                       cosmic_flag[i]==FALSE)||
                                                      poly_score[i]>=3))){
                                if(!is.na(results$VAF[i])&&
                                   results$VAF[i]<=0.1){
                                    artifact_score[i]<-artifact_score[i]+5
                                    if(artifact_score[i]>-1){
                                        results$Category[i]<-paste("Artifact (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<=-1&&
                                       is.na(hotspot[i])){
                                        results$Category[i]<-paste("Probably True (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<=-1&&!is.na(hotspot[i])){
                                        results$Category[i]<-paste("Hotspot (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                }
                                if(!is.na(results$VAF[i])&&
                                   results$VAF[i]<=0.2){
                                    artifact_score[i]<-artifact_score[i]+2
                                    if(artifact_score[i]>-1){
                                        results$Category[i]<-paste("Artifact (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<=-1&&
                                       is.na(hotspot[i])){
                                        results$Category[i]<-paste("Probably True (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<=-1&&
                                       !is.na(hotspot[i])){
                                        results$Category[i]<-paste("Hotspot (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                }
                                if(!is.na(results$Consequence[i])&&
                                   vcountPattern(pattern="frameshift",
                                                 results$Consequence[i])>0){
                                    artifact_score[i]<-artifact_score[i]+2
                                    if(artifact_score[i]>-1){
                                        results$Category[i]<-paste("Artifact (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<=-1&&is.na(hotspot[i])){
                                        results$Category[i]<-paste("Probably True (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<=-1&&!is.na(hotspot[i])){
                                        results$Category[i]<-paste("Hotspot (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                }
                            }
                        }
                    }
                    if(input$artifact_score=="Yes"){
                        for(i in seq_along(results[,1])){
                            progress_small$inc(1/length(results[,1]),
                                               detail=paste("-> Call",i,
                                                            "out of",
                                                            length(results[,1])))
                            if((poly_score[i]>=2&&cosmic_flag[i]==TRUE&&
                                is.na(hotspot[i]))||(is.na(hotspot[i])&&
                                                     ((poly_score[i]>=2&&
                                                       cosmic_flag[i]==FALSE)||
                                                      poly_score[i]>=3))){
                                if(!is.na(results$VAF[i])&&results$VAF[i]<=0.1){
                                    artifact_score[i]<-artifact_score[i]+input$PolymorphismVAF10
                                    if(artifact_score[i]>=input$artifactThreshold){
                                        results$Category[i]<-paste("Artifact (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<input$artifactThreshold&&
                                       is.na(hotspot[i])){
                                        results$Category[i]<-paste("Probably True (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<input$artifactThreshold&&
                                       !is.na(hotspot[i])){
                                        results$Category[i]<-paste("Hotspot (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                }
                                if(!is.na(results$VAF[i])&&results$VAF[i]<=0.2){
                                    artifact_score[i]<-artifact_score[i]+input$PolymorphismVAF20
                                    if(artifact_score[i]>=input$artifactThreshold){
                                        results$Category[i]<-paste("Artifact (",
                                                                   artifact_score[i],")",sep="")
                                    }
                                    if(artifact_score[i]<input$artifactThreshold&&
                                       is.na(hotspot[i])){
                                        results$Category[i]<-paste("Probably True (",
                                                                   artifact_score[i],")",sep="")
                                    }
                                    if(artifact_score[i]<input$artifactThreshold&&
                                       !is.na(hotspot[i])){
                                        results$Category[i]<-paste("Hotspot (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                }
                                if(!is.na(results$Consequence[i])&&
                                   vcountPattern(pattern="frameshift",
                                                 results$Consequence[i])>0){
                                    artifact_score[i]<-artifact_score[i]+input$PolymorphismFrame
                                    if(artifact_score[i]>=input$artifactThreshold){
                                        results$Category[i]<-paste("Artifact (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<input$artifactThreshold&&
                                       is.na(hotspot[i])){
                                        results$Category[i]<-paste("Probably True (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                    if(artifact_score[i]<input$artifactThreshold&&
                                       !is.na(hotspot[i])){
                                        results$Category[i]<-paste("Hotspot (",
                                                                   artifact_score[i],
                                                                   ")",sep="")
                                    }
                                }
                            }
                        }

                    }
                    progress_small$close()

                    #identical calls as polymorphism
                    progress$inc(1/13,detail="->  Re-consider polymorphisms")
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

                    if(exists("overview4")==TRUE){
                        overview4<-cbind(overview4,Mutations=NA,
                                         Polymorphisms=NA,Artifacts=NA)
                    }
                    if(exists("overview4")==FALSE){
                        overview4<-cbind(checkpointFile[,1],RawCalls=NA,
                                         VAFandBQFiltered=NA,Mutations=NA,
                                         Polymorphisms=NA,Artifacts=NA)
                    }
                    for(i in seq_along(overview4[,1])){
                        overview4[i,4]<-length(results.mutations[results.mutations[,1]==overview4[i,1],1])
                        overview4[i,5]<-length(results.polymorphisms[results.polymorphisms[,1]==overview4[i,1],1])
                        overview4[i,6]<-length(results.artifacts[results.artifacts[,1]==overview4[i,1],1])
                        for(j in 2:length(checkpoint[1,])){
                            if(!is.na(checkpoint[i,j])){
                                checkpoint[i,j]<-7
                            }
                        }
                    }
                    write.table(results,
                                paste(input$output_folder,"/Results_Final.txt",
                                      sep=""),row.names=FALSE,quote=FALSE,
                                sep="\t")
                    write.table(checkpoint,
                                paste(input$output_folder,"/checkpoint.txt",
                                      sep=""),row.names=FALSE,quote=FALSE,
                                sep="\t")
                    output$table4 <- renderDataTable(datatable(overview4))
                    output$table_mutations <- renderDataTable(datatable(results.mutations))
                    output$table_polymorphisms <- renderDataTable(datatable(results.polymorphisms))
                    output$table_artifacts <- renderDataTable(datatable(results.artifacts))
                    results.workbook <- createWorkbook()
                    addWorksheet(wb=results.workbook,sheetName="Mutations")
                    addWorksheet(wb=results.workbook,sheetName="Polymorphisms")
                    addWorksheet(wb=results.workbook,sheetName="Artifacts")
                    writeData(wb=results.workbook,x=results.mutations,
                              sheet="Mutations")
                    writeData(wb=results.workbook,x=results.polymorphisms,
                              sheet="Polymorphisms")
                    writeData(wb=results.workbook,x=results.artifacts,
                              sheet="Artifacts")
                    saveWorkbook(results.workbook,
                                 paste(input$output_folder,
                                       "/Results_Final.xlsx",sep=""),
                                 overwrite = TRUE)
                    checkpoint_state<-7
                    progress$close()
                }

                #7: After Final Filtration
                if(checkpoint_state==7){
                    #1. Reading Input
                    log_info<-c(log_info,"You are done <br>")
                    output$log_info<-renderUI({HTML(log_info)})

                    if(exists("results.artifacts")==FALSE){
                        results.artifacts<-read.xlsx(paste(input$output_folder,
                                                           "/Results_Final.xlsx",
                                                           sep=""),
                                                     sheet="Artifacts")
                        results.polymorphisms<-read.xlsx(paste(input$output_folder,
                                                               "/Results_Final.xlsx",
                                                               sep=""),
                                                         sheet="Polymorphisms")
                        results.mutations<-read.xlsx(paste(input$output_folder,"
                                                           /Results_Final.xlsx",
                                                           sep=""),
                                                     sheet="Mutations")

                        overview4<-cbind(checkpointFile[,1],RawCalls=NA,
                                         VAFandBQFiltered=NA,Mutations=NA,
                                         Polymorphisms=NA,Artifacts=NA)
                        for(i in seq_along(overview4[,1])){
                            overview4[i,4]<-length(results.mutations[results.mutations[,1]==overview4[i,1],1])
                            overview4[i,5]<-length(results.polymorphisms[results.polymorphisms[,1]==overview4[i,1],1])
                            overview4[i,6]<-length(results.artifacts[results.artifacts[,1]==overview4[i,1],1])
                            for(j in 2:length(checkpoint[1,])){
                                if(!is.na(checkpoint[i,j])){
                                    checkpoint[i,j]<-7
                                }
                            }
                        }
                        output$table4 <- renderDataTable(datatable(overview4))
                        output$table_mutations <- renderDataTable(datatable(results.mutations))
                        output$table_polymorphisms <- renderDataTable(datatable(results.polymorphisms))
                        output$table_artifacts <- renderDataTable(datatable(results.artifacts))
                    }
                }
            })
        }
    )
}

