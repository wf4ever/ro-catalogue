# chembox evaluation experiment

Converting a small part of Matthew Gamble's "chemmim" evaluation of chemical descriptions to use the RO checklist evaluation framework, with a view to making a concrete comparison between the approaches used.


## Content of the folder

chembox_evaluate.sh: the script for running the assessment locally or remotely

chembox-minim-samples.ttl: the checklist used for assessment

chembox-uris-100.txt: the 100 sample chemical compounds assessed

MIM-chembox-uris.100.results: the assessment result from the MIM assessment tool


## To reproduce the Minim assessment

    ./chembox_evaluate.sh

(This script is currently configured to use a checklist service deployed at andros.zoo.ox.ac.uk, evaluating ROs served by sandbox.wf4ever-project.org/rodl.
We have been experiencing timeout problems if we try to run the evaluation service from the sandbox - possibly due to a reverse proxy server configuration.)

Expected results: see below

Note: this script takes a couple of hours to complete.


## Results from 28-may using "in-use-submission" RO and local checklist evaluation

    (romenv)conina:chemin-box graham$ ./chembox_evaluate.sh 
    Using local evaluation of file:///usr/workspace/wf4ever-ro-catalogue/v0.1
    CHECKLIST_SERVICE: http://localhost:8080/evaluate/trafficlight_json
    ROBASE:            file:///usr/workspace/wf4ever-ro-catalogue/v0.1
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Altechromone_A :: http://purl.org/net/chembox/Altechromone_A -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tralomethrin :: http://purl.org/net/chembox/Tralomethrin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Carbendazim :: http://purl.org/net/chembox/Carbendazim -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/N-Methylformamide :: http://purl.org/net/chembox/N-Methylformamide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Diphenylketene :: http://purl.org/net/chembox/Diphenylketene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Yohimban :: http://purl.org/net/chembox/Yohimban -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Merocyanine :: http://purl.org/net/chembox/Merocyanine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Potassium_propanoate :: http://purl.org/net/chembox/Potassium_propanoate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Butanethiol :: http://purl.org/net/chembox/Butanethiol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Triformin :: http://purl.org/net/chembox/Triformin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Adipic_acid_dihydrazide :: http://purl.org/net/chembox/Adipic_acid_dihydrazide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Glutaconaldehyde :: http://purl.org/net/chembox/Glutaconaldehyde -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Geranic_acid :: http://purl.org/net/chembox/Geranic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Sudan_Yellow_3G :: http://purl.org/net/chembox/Sudan_Yellow_3G -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Levothyroxine :: http://purl.org/net/chembox/Levothyroxine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2-Nonenal :: http://purl.org/net/chembox/2-Nonenal -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Polylactic_acid :: http://purl.org/net/chembox/Polylactic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Botrydial :: http://purl.org/net/chembox/Botrydial -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Diucifon :: http://purl.org/net/chembox/Diucifon -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Boron_monoxide :: http://purl.org/net/chembox/Boron_monoxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Potassium_superoxide :: http://purl.org/net/chembox/Potassium_superoxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tryptoline :: http://purl.org/net/chembox/Tryptoline -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2,4,6-Tribromophenol :: http://purl.org/net/chembox/2,4,6-Tribromophenol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Orthoformic_acid :: http://purl.org/net/chembox/Orthoformic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Dihydrofolic_acid :: http://purl.org/net/chembox/Dihydrofolic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Calcium_peroxide :: http://purl.org/net/chembox/Calcium_peroxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Retinal :: http://purl.org/net/chembox/Retinal -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Retene :: http://purl.org/net/chembox/Retene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Chromium%28III%29_sulfate :: http://purl.org/net/chembox/Chromium%2528III%2529_sulfate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Alkannin :: http://purl.org/net/chembox/Alkannin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Uridine_triphosphate :: http://purl.org/net/chembox/Uridine_triphosphate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Pyruvic_acid :: http://purl.org/net/chembox/Pyruvic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Morphine-6-glucuronide :: http://purl.org/net/chembox/Morphine-6-glucuronide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Astatine_monoiodide :: http://purl.org/net/chembox/Astatine_monoiodide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, minimally satisfies
      No ChemSpider identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Cyfluthrin :: http://purl.org/net/chembox/Cyfluthrin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Monoammonium_glutamate :: http://purl.org/net/chembox/Monoammonium_glutamate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Dichloroisocyanuric_acid :: http://purl.org/net/chembox/Dichloroisocyanuric_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Calusterone :: http://purl.org/net/chembox/Calusterone -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Diptoindonesin_A :: http://purl.org/net/chembox/Diptoindonesin_A -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Gemopatrilat :: http://purl.org/net/chembox/Gemopatrilat -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Piperine :: http://purl.org/net/chembox/Piperine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Wedelolactone :: http://purl.org/net/chembox/Wedelolactone -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/%28Benzylideneacetone%29iron_tricarbonyl :: http://purl.org/net/chembox/%2528Benzylideneacetone%2529iron_tricarbonyl -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Potassium_citrate :: http://purl.org/net/chembox/Potassium_citrate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Thallium%28III%29_nitrate :: http://purl.org/net/chembox/Thallium%2528III%2529_nitrate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Deuterated_DMF :: http://purl.org/net/chembox/Deuterated_DMF -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/N-Oxalylglycine :: http://purl.org/net/chembox/N-Oxalylglycine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/6-Phosphogluconic_acid :: http://purl.org/net/chembox/6-Phosphogluconic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Cyclohexylamine :: http://purl.org/net/chembox/Cyclohexylamine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/6-Ketoprogesterone :: http://purl.org/net/chembox/6-Ketoprogesterone -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, minimally satisfies
      No ChemSpider identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Hydroxypyruvic_acid :: http://purl.org/net/chembox/Hydroxypyruvic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Ethyl_acetate :: http://purl.org/net/chembox/Ethyl_acetate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Manganese%28II%29_phthalocyanine :: http://purl.org/net/chembox/Manganese%2528II%2529_phthalocyanine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tetrabutylammonium_hydroxide :: http://purl.org/net/chembox/Tetrabutylammonium_hydroxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Glycin :: http://purl.org/net/chembox/Glycin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Salicylaldehyde :: http://purl.org/net/chembox/Salicylaldehyde -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Pentagalloyl_glucose :: http://purl.org/net/chembox/Pentagalloyl_glucose -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Iscotrizinol :: http://purl.org/net/chembox/Iscotrizinol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Neo-Inositol :: http://purl.org/net/chembox/Neo-Inositol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2-Ethoxyethanol :: http://purl.org/net/chembox/2-Ethoxyethanol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Hematein :: http://purl.org/net/chembox/Hematein -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Phenol_red :: http://purl.org/net/chembox/Phenol_red -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Oenanthotoxin :: http://purl.org/net/chembox/Oenanthotoxin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Hexanitrohexaazaisowurtzitane :: http://purl.org/net/chembox/Hexanitrohexaazaisowurtzitane -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tunicamycin :: http://purl.org/net/chembox/Tunicamycin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Phytanoyl-CoA :: http://purl.org/net/chembox/Phytanoyl-CoA -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Deoxyepinephrine :: http://purl.org/net/chembox/Deoxyepinephrine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Swainsonine :: http://purl.org/net/chembox/Swainsonine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Linoelaidic_acid :: http://purl.org/net/chembox/Linoelaidic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Hexafluoroethane :: http://purl.org/net/chembox/Hexafluoroethane -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2-Chloro-9,10-bis%28phenylethynyl%29anthracene :: http://purl.org/net/chembox/2-Chloro-9,10-bis%2528phenylethynyl%2529anthracene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Uridine_diphosphate_glucose :: http://purl.org/net/chembox/Uridine_diphosphate_glucose -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Propiophenone :: http://purl.org/net/chembox/Propiophenone -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Titanium%28III%29_fluoride :: http://purl.org/net/chembox/Titanium%2528III%2529_fluoride -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/SCH_23390 :: http://purl.org/net/chembox/SCH_23390 -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Gold%28III%29_fluoride :: http://purl.org/net/chembox/Gold%2528III%2529_fluoride -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/DABCO :: http://purl.org/net/chembox/DABCO -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Leukotriene_C4 :: http://purl.org/net/chembox/Leukotriene_C4 -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tris%281,3-dichloro-2-propyl%29phosphate :: http://purl.org/net/chembox/Tris%25281,3-dichloro-2-propyl%2529phosphate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Cinchonain-Ib :: http://purl.org/net/chembox/Cinchonain-Ib -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Arachidonic_acid_5-hydroperoxide :: http://purl.org/net/chembox/Arachidonic_acid_5-hydroperoxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Ruthenium%28III%29_acetylacetonate :: http://purl.org/net/chembox/Ruthenium%2528III%2529_acetylacetonate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tetrakis%28triphenylphosphine%29palladium%280%29 :: http://purl.org/net/chembox/Tetrakis%2528triphenylphosphine%2529palladium%25280%2529 -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Sinapyl_alcohol :: http://purl.org/net/chembox/Sinapyl_alcohol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2,4-Bis%284-hydroxybenzyl%29_phenol :: http://purl.org/net/chembox/2,4-Bis%25284-hydroxybenzyl%2529_phenol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Ascaridole :: http://purl.org/net/chembox/Ascaridole -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Kekulene :: http://purl.org/net/chembox/Kekulene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/L-chiro-Inositol :: http://purl.org/net/chembox/L-chiro-Inositol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Nitroethane :: http://purl.org/net/chembox/Nitroethane -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Iron%28II%29_fumarate :: http://purl.org/net/chembox/Iron%2528II%2529_fumarate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Meprylcaine :: http://purl.org/net/chembox/Meprylcaine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Vulpinic_acid :: http://purl.org/net/chembox/Vulpinic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Petunidin :: http://purl.org/net/chembox/Petunidin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Dodecahydroxycyclohexane :: http://purl.org/net/chembox/Dodecahydroxycyclohexane -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2-sec-Butyl-4,5-dihydrothiazole :: http://purl.org/net/chembox/2-sec-Butyl-4,5-dihydrothiazole -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Calmagite :: http://purl.org/net/chembox/Calmagite -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Eucalyptol :: http://purl.org/net/chembox/Eucalyptol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Urocanic_acid :: http://purl.org/net/chembox/Urocanic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Benzocyclobutene :: http://purl.org/net/chembox/Benzocyclobutene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Oxazole :: http://purl.org/net/chembox/Oxazole -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    Total pass: 65, fail: 35 out of 100
    (romenv)conina:chemin-box graham$ 

## Results from 20-May run used as basis for paper submission

    (romenv)zoo-dhcp06:minim-evaluation graham$ ./chembox_evaluate.sh
    Using local evaluation of file:///usr/workspace/wf4ever-ro-catalogue/v0.1
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Altechromone_A :: http://purl.org/net/chembox/Altechromone_A -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tralomethrin :: http://purl.org/net/chembox/Tralomethrin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Carbendazim :: http://purl.org/net/chembox/Carbendazim -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/N-Methylformamide :: http://purl.org/net/chembox/N-Methylformamide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Diphenylketene :: http://purl.org/net/chembox/Diphenylketene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Yohimban :: http://purl.org/net/chembox/Yohimban -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Merocyanine :: http://purl.org/net/chembox/Merocyanine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Potassium_propanoate :: http://purl.org/net/chembox/Potassium_propanoate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Butanethiol :: http://purl.org/net/chembox/Butanethiol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Triformin :: http://purl.org/net/chembox/Triformin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Adipic_acid_dihydrazide :: http://purl.org/net/chembox/Adipic_acid_dihydrazide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Glutaconaldehyde :: http://purl.org/net/chembox/Glutaconaldehyde -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Geranic_acid :: http://purl.org/net/chembox/Geranic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Sudan_Yellow_3G :: http://purl.org/net/chembox/Sudan_Yellow_3G -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Levothyroxine :: http://purl.org/net/chembox/Levothyroxine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2-Nonenal :: http://purl.org/net/chembox/2-Nonenal -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Polylactic_acid :: http://purl.org/net/chembox/Polylactic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Botrydial :: http://purl.org/net/chembox/Botrydial -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Diucifon :: http://purl.org/net/chembox/Diucifon -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Boron_monoxide :: http://purl.org/net/chembox/Boron_monoxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Potassium_superoxide :: http://purl.org/net/chembox/Potassium_superoxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tryptoline :: http://purl.org/net/chembox/Tryptoline -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2,4,6-Tribromophenol :: http://purl.org/net/chembox/2,4,6-Tribromophenol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Orthoformic_acid :: http://purl.org/net/chembox/Orthoformic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Dihydrofolic_acid :: http://purl.org/net/chembox/Dihydrofolic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Calcium_peroxide :: http://purl.org/net/chembox/Calcium_peroxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Retinal :: http://purl.org/net/chembox/Retinal -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Retene :: http://purl.org/net/chembox/Retene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Chromium%28III%29_sulfate :: http://purl.org/net/chembox/Chromium%2528III%2529_sulfate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Alkannin :: http://purl.org/net/chembox/Alkannin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Uridine_triphosphate :: http://purl.org/net/chembox/Uridine_triphosphate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Pyruvic_acid :: http://purl.org/net/chembox/Pyruvic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Morphine-6-glucuronide :: http://purl.org/net/chembox/Morphine-6-glucuronide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Astatine_monoiodide :: http://purl.org/net/chembox/Astatine_monoiodide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, minimally satisfies
      No ChemSpider identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Cyfluthrin :: http://purl.org/net/chembox/Cyfluthrin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Monoammonium_glutamate :: http://purl.org/net/chembox/Monoammonium_glutamate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Dichloroisocyanuric_acid :: http://purl.org/net/chembox/Dichloroisocyanuric_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Calusterone :: http://purl.org/net/chembox/Calusterone -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Diptoindonesin_A :: http://purl.org/net/chembox/Diptoindonesin_A -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Gemopatrilat :: http://purl.org/net/chembox/Gemopatrilat -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Piperine :: http://purl.org/net/chembox/Piperine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Wedelolactone :: http://purl.org/net/chembox/Wedelolactone -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/%28Benzylideneacetone%29iron_tricarbonyl :: http://purl.org/net/chembox/%2528Benzylideneacetone%2529iron_tricarbonyl -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Potassium_citrate :: http://purl.org/net/chembox/Potassium_citrate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Thallium%28III%29_nitrate :: http://purl.org/net/chembox/Thallium%2528III%2529_nitrate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Deuterated_DMF :: http://purl.org/net/chembox/Deuterated_DMF -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/N-Oxalylglycine :: http://purl.org/net/chembox/N-Oxalylglycine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/6-Phosphogluconic_acid :: http://purl.org/net/chembox/6-Phosphogluconic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Cyclohexylamine :: http://purl.org/net/chembox/Cyclohexylamine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/6-Ketoprogesterone :: http://purl.org/net/chembox/6-Ketoprogesterone -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, minimally satisfies
      No ChemSpider identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Hydroxypyruvic_acid :: http://purl.org/net/chembox/Hydroxypyruvic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Ethyl_acetate :: http://purl.org/net/chembox/Ethyl_acetate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Manganese%28II%29_phthalocyanine :: http://purl.org/net/chembox/Manganese%2528II%2529_phthalocyanine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tetrabutylammonium_hydroxide :: http://purl.org/net/chembox/Tetrabutylammonium_hydroxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Glycin :: http://purl.org/net/chembox/Glycin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Salicylaldehyde :: http://purl.org/net/chembox/Salicylaldehyde -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Pentagalloyl_glucose :: http://purl.org/net/chembox/Pentagalloyl_glucose -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Iscotrizinol :: http://purl.org/net/chembox/Iscotrizinol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Neo-Inositol :: http://purl.org/net/chembox/Neo-Inositol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2-Ethoxyethanol :: http://purl.org/net/chembox/2-Ethoxyethanol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Hematein :: http://purl.org/net/chembox/Hematein -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Phenol_red :: http://purl.org/net/chembox/Phenol_red -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Oenanthotoxin :: http://purl.org/net/chembox/Oenanthotoxin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Hexanitrohexaazaisowurtzitane :: http://purl.org/net/chembox/Hexanitrohexaazaisowurtzitane -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tunicamycin :: http://purl.org/net/chembox/Tunicamycin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Phytanoyl-CoA :: http://purl.org/net/chembox/Phytanoyl-CoA -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Deoxyepinephrine :: http://purl.org/net/chembox/Deoxyepinephrine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Swainsonine :: http://purl.org/net/chembox/Swainsonine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Linoelaidic_acid :: http://purl.org/net/chembox/Linoelaidic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Hexafluoroethane :: http://purl.org/net/chembox/Hexafluoroethane -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2-Chloro-9,10-bis%28phenylethynyl%29anthracene :: http://purl.org/net/chembox/2-Chloro-9,10-bis%2528phenylethynyl%2529anthracene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Uridine_diphosphate_glucose :: http://purl.org/net/chembox/Uridine_diphosphate_glucose -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Propiophenone :: http://purl.org/net/chembox/Propiophenone -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Titanium%28III%29_fluoride :: http://purl.org/net/chembox/Titanium%2528III%2529_fluoride -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/SCH_23390 :: http://purl.org/net/chembox/SCH_23390 -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Gold%28III%29_fluoride :: http://purl.org/net/chembox/Gold%2528III%2529_fluoride -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/DABCO :: http://purl.org/net/chembox/DABCO -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Leukotriene_C4 :: http://purl.org/net/chembox/Leukotriene_C4 -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tris%281,3-dichloro-2-propyl%29phosphate :: http://purl.org/net/chembox/Tris%25281,3-dichloro-2-propyl%2529phosphate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Cinchonain-Ib :: http://purl.org/net/chembox/Cinchonain-Ib -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Arachidonic_acid_5-hydroperoxide :: http://purl.org/net/chembox/Arachidonic_acid_5-hydroperoxide -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Ruthenium%28III%29_acetylacetonate :: http://purl.org/net/chembox/Ruthenium%2528III%2529_acetylacetonate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Tetrakis%28triphenylphosphine%29palladium%280%29 :: http://purl.org/net/chembox/Tetrakis%2528triphenylphosphine%2529palladium%25280%2529 -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Sinapyl_alcohol :: http://purl.org/net/chembox/Sinapyl_alcohol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2,4-Bis%284-hydroxybenzyl%29_phenol :: http://purl.org/net/chembox/2,4-Bis%25284-hydroxybenzyl%2529_phenol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Ascaridole :: http://purl.org/net/chembox/Ascaridole -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Kekulene :: http://purl.org/net/chembox/Kekulene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/L-chiro-Inositol :: http://purl.org/net/chembox/L-chiro-Inositol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Nitroethane :: http://purl.org/net/chembox/Nitroethane -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, nominally satisfies
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Iron%28II%29_fumarate :: http://purl.org/net/chembox/Iron%2528II%2529_fumarate -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Meprylcaine :: http://purl.org/net/chembox/Meprylcaine -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Vulpinic_acid :: http://purl.org/net/chembox/Vulpinic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Petunidin :: http://purl.org/net/chembox/Petunidin -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Dodecahydroxycyclohexane :: http://purl.org/net/chembox/Dodecahydroxycyclohexane -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/2-sec-Butyl-4,5-dihydrothiazole :: http://purl.org/net/chembox/2-sec-Butyl-4,5-dihydrothiazole -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Calmagite :: http://purl.org/net/chembox/Calmagite -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Eucalyptol :: http://purl.org/net/chembox/Eucalyptol -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, fully satisfies
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Urocanic_acid :: http://purl.org/net/chembox/Urocanic_acid -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Benzocyclobutene :: http://purl.org/net/chembox/Benzocyclobutene -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
    ----- file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation :: http://purl.org/net/chembox/Oxazole :: http://purl.org/net/chembox/Oxazole -----
    file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation, does not satisfy
      No ChemSpider identifier is present
      No InChI identifier is present
      No synomym is present
    ./chembox_evaluate.sh: line 49: embox-uris-test1.txt: command not found
    ./chembox_evaluate.sh: line 50: syntax error near unexpected token `done'
    ./chembox_evaluate.sh: line 50: `  done <chembox-uris-100.txt'
    (romenv)zoo-dhcp06:minim-evaluation graham$
