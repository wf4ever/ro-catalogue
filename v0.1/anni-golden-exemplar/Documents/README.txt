FUNCTIONAL ANNOTATION OF SINGLE NUCLEOTIDE POLYMORHPISMS USING NEXT-GENERATION TEXT MINING RESEARCH OBJECT

Functional annotation of single nucleotide polymorphisms (SNPs) using next-generation text mining.


SUMMARY
___________________________________________

The scientific experiment represented by this research object pertains to the functional annotation of SNPs using next-generation text mining technology. This study characterizes a set of SNPs from an article that can be seen as a golden standard when it comes to characterizing genetic variation in human metabolism [1]. To validate the results from the research object, it compares the text mining generated annotation with annotations retieved from the Kyoto Encyclopedia of Genes and Genomes (KEGG) pathway database, and the annotations as described in the gold standard publication.

We hypothesize that SNPs can be functionally annotated using next-generation text mining, and that new hypotheses regarding the role of SNPs in biological processes relevant for human health can be formulated using these functional annotations.

All the data involved in the characterization of the SNPs are stored in local relational databases (named "Anni databases") and accessed via a set of web services (named "Anni web services"). The results are stored in local output files.


NEXT-GENERATION TEXT MINING

By next-generation text mining we mean knowledge discovery based on the concept profile matching technology. The technology uses the vector space model to relate two concepts (such as SNPs and pathways) to each other. Vectors can be compared efficiently and transparently [2], and the model yields a measure of the strength of the relationship. We call the vectors "concept profiles". A concept profile is a list of concepts with for every concept a weight to indicate its importance to the main concept. An example of a tool that uses concept profile technology is Anni 2.0 [3]. The web services used in this study performs operations on the databases behind Anni.

To construct a concept profile, first PubMed records are associated to a concept using the indexing engine Peregrine [4] equipped with an in-house thesaurus of biomedical and chemical concepts. For all concepts except genes the PubMed records are comprised of the texts in which the concept is mentioned. For genes only a subset of PubMed records are used in order to limit the impact of ambiguous terms and distant homologs. Gene Ontology (GO) terms are sometimes given as words or phrases that are infrequently found in the normal texts. To still provide broad coverage of GO terms, the PubMed records that were used as evidence for annotating genes with this GO term are added. For every concept in the thesaurus that is associated to at least five PubMed records, a concept profile is created. This concept profile is in reality a vector containing all concepts related to the main concept (direct co-occurrence), weighted by their importance using the symmetric uncertainly coefficient. Concept profiles can be matched to identify similarities between concept profiles via their shared concepts (indirect relations), for instance to identify genes associated with similar biological processes. Any distance measure can be used for this matching such as the mutual information, inner product, cosine, angle, Euclidean distance or Pearson’s correlation. The web services an inner product measure.


CONCEPT SETS FROM THE ANNI DATABASE

The sort of annotation that will be available for the SNPs depends on the selection of concept sets from the local Anni concept profile database.

Note that the databases are subject to periodic updates to reflect new knowledge available for the different concepts in ontologies and in the scientific literature. 

Database changes might affect the outcome of the experiment. 


ANNOTATING THE SNPs

The SNPs are annotated by first mapping the SNPs to a locus (EntrezGene id) through the Ensembl BioMart web services. The EntrezGene id is used to query the Anni concept database to retrieve the internal concept id, which is used to retrieve the concept profile for the concept from the concept profile database. The concept profile for the gene is thereafter matched to all concept profiles for every concept in the specified concept set. Documents supporting this relation, either by co-occurrence or by an intermediate concept co-occurring with the gene and a concept in the concept set, are retrieved and presented.

 
REFERENCES

[1] Illig T, Gieger C, Zhai G, Römisch-Margl W, Wang-Sattler R, Prehn C, Altmaier E, Kastenmüller G, Kato BS, Mewes HW, Meitinger T, de Angelis MH, Kronenberg F, Soranzo N, Wichmann HE, Spector TD, Adamski J, Suhre K: A genome-wide perspective of genetic variation in human metabolism. Nature Genetics 2010, 42(2):137-41.

[2] Jelier R, Schuemie MJ, Roes PJ, van Mulligen EM, Kors JA: Literature-based
concept profiles for gene annotation: the issue of weighting. International
journal of medical informatics 2008, 77(5):354-362.

[3] Jelier R, Schuemie MJ, Veldhoven A, Dorssers LC, Jenster G, Kors JA: Anni 2.0: a
multipurpose text-mining tool for the life sciences. Genome biology 2008,
9(6):R96.

[4] Schuemie M, Jelier R, Kors JA: Peregrine: Lightweight gene name
normalization by dictionary lookup. In: Biocreative 2 workshop: 2007;
Madrid.


