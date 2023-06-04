# GEANS_WP4_dwca
This repository has example data and code to produce occurrence and ASV tables from Illumina metabarcoding data using DADA2.

A Darwin core archive file for metabarcoding data requires three separate input files. The first is a metadata table, describing the relevant context of the observations, the second is the actual occurrence table and the third contains information on the amplicon sequence variants (ASVs) that were registered. The metadata table must be created manually by the user. The column heads must be identical with the corresponding field names in the Darwin core archive and MIx standards. The values of one field in the metadata table must correspond with the names of the samples in the DADA2 analysis. The sequences and read counts as well as taxonomic assignments which are the native output of the DADA2 workflow can then be combined with the content of the metadata table. In a second step, this content is distributed over the required input files for the Darwin core archive (metadata table, occurrence table and DNA extension table).


# User guide

The script in the R-Markdown file contains a full example analysis using DADA2. Note that 16 GB RAM are neccessary to run the taxonomic assignment. At the end of the script, the _dwca_test_ function is used to generate the occurrence table, the DNA extension table and the updated metadata table. The _dwca_test_ function takes four arguments, that must be entered in the correct order. The first argument is the path to the metadata table. This table must be in .csv format (comma separated, plain text). The second argument is a sequence table and is either the output of the _makeSequenceTable_ or _removeBimeraDenovo_ functions of DADA2. Argument three is the taxa table that is produced by the _assignTaxonomy_ function of DADA2. Finally, a path to a output folder needs to be specified as fourth argument.


# Limitations

Currently, only are limited number of Darwin core archive and MIxS fields are incorporated in the tool. The main reason for this is that there is no agreement among experts and data aggregators on which fields are required or (highly) recommended and what the values of these fields should exactly be. There is currently also no field that can accommodate the bootstraps values of the Bayesian analysis of DADA2 and this function is therefore not used in the example.

The idea that bioinformatics pipelines produce data that can be directly uploaded to biodiversity data aggregators seems to be a promising avenue for biodiversity informatics. Despite the current limitations we already publish the code for doing so on output of DADA2 in the hope it will be a useful guide for DADA2 users or bioinformatics and biodiversity informatics tool developers.
