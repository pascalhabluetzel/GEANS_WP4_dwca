dwca_test = function (metadata, sequences, taxa, out_folder) {
  metadata_df = read.csv(metadata)
  seq = as.data.frame(t(sequences))
  seq$DNA_sequence = row.names(seq)
  seql = reshape(seq, 
                 idvar = "DNA_sequence",
                 varying = list(colnames(seq)[1:3]),
                 v.names = "organismQuantity",
                 times = colnames(seq)[1:3],
                 direction = "long")
  colnames(seql)[colnames(seql) == "time"] = "samp_name"
  tax = as.data.frame(taxa)
  tax$DNA_sequence = row.names(tax)
  merged_df = merge(seql, tax, by = "DNA_sequence", all.x = TRUE, all.y = TRUE)
  merged2_df = merge(merged_df, metadata_df, by = "samp_name", all.x = TRUE, all.y = TRUE)
  occ = merged2_df[, c("basisOfRecord",
                       "eventID",
                       "eventDate",
                       "recordedBy",
                       "organismQuantity",
                       "organismQuantityType",
                       "samplingProtocol",
                       "associatedSequences",
                       "decimalLatitude",
                       "decimalLongitude",
                       "geodeticDatum",
                       "Domain",
                       "Supergroup",
                       "Division",
                       "Subdivision",
                       "Class",
                       "Order",
                       "Family",
                       "Genus",
                       "Species")]
  asv = merged2_df[, c("DNA_sequence",
                       "sop",
                       "target_gene",
                       "target_subfragment",
                       "pcr_primer_forward",
                       "pcr_primer_reverse",
                       "pcr_primer_name_forward",
                       "pcr_primer_name_reverse",
                       "pcr_primer_reference",
                       "env_broad_scale",
                       "env_medium",
                       "env_local_scale",
                       "seq_meth",
                       "otu_db")]
  meta = merged2_df[, colnames(metadata_df)]
  out = list(occ, asv, meta)
  write.csv(occ, paste(out_folder, "/", "Occurrence_table_test.csv", sep=""), row.names=F)
  write.csv(asv, paste(out_folder, "/", "ASV_table_test.csv", sep=""), row.names=F)
  write.csv(meta, paste(out_folder, "/", "Metadata_table_test.csv", sep=""), row.names=F)
  return(out)
}