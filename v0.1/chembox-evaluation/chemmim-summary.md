# Summary of chemmim requirements

## Preliminaries (grouped requirements)

Requirements are grouped roughly into identifiers (I include synonyms as an identifier), properties, and other requirements.

    :MIM  rdf:type mim:MIM ;
          mim:hasMustRequirement      :Properties, :Identifiers ;
          mim:hasShouldRequirement    :IUPACName, :Image .
          mim:hasOptionalRequirement  :Synonym ;
          mim:hasRestriction
            [ mim:exactCardinality 1 ;
              mim:onRequirement       :Properties, :Identifiers ] ;
    
    :Identifiers
          rdf:type mim:RequirementSet ;
          mim:hasMustRequirement      :InChI , :SMILES ;
          mim:hasShouldRequirement    :ChemSpider, :PubChem .
    
    :Properties
          rdf:type mim:RequirementSet ;
          mim:hasMustRequirement      :MolecularFormula ;
          mim:hasShouldRequirement    :MeltingPoint , :MolarMass .
          mim:hasOptionalRequirement  :Solubility ;
          mim:hasRestriction
            [ mim:exactCardinality 1 ;
              mim:onRequirement       :MolecularFormula ] ;


## Identifiers

### InChI

    :InChI
          rdf:type mim:DataRequirement ;
          mim:hasRestriction
                  [ mim:onSelf "true"^^xsd:boolean ;
                    mim:type xsd:string
                  ] .

An InChI identifier must be present, defined by way of a chembox:StdInChI property on some target resource and its value must be a string.  The SPIN rules in chembox-spin.ttl define this mapping from source data to the :InChI requirement; e.g. here's the core of the SPIN rule converted to SPARQL:

    CONSTRUCT 
        { ?x mim:containsDataReport _:b0 .
          _:b0 mim:reports chembox-mim:InChI .
          _:b0 mim:withValue ?value . }
    WHERE { ?x chembox:StdInChI ?value . }

I think the mim:hasRestriction is asserting that the value of the chembox:StdInChI value must be a string for the report to satisfy the requirement.


### SMILES

    :SMILES
          rdf:type mim:DataRequirement ;
          mim:hasRestriction
                  [ mim:onSelf "true"^^xsd:boolean ;
                    mim:type xsd:string
                  ] .

This has almost identical construction to the :InChI requirement.

### ChemSpider

@@TODO

      rdf:type mim:DataRequirement ;
      mim:hasRestriction
              [ mim:onSelf "true"^^xsd:boolean ;
                mim:type xsd:integer
              ] .

### PubChem

@@TODO

      rdf:type mim:DataRequirement ;
      mim:hasRestriction
              [ mim:onSelf "true"^^xsd:boolean ;
                mim:type xsd:integer
              ] .


## Properties

:MolecularFormula
      rdf:type mim:DataRequirement ;
      mim:hasRestriction
              [ mim:onSelf "true"^^xsd:boolean ;
                mim:type xsd:string
              ] .

:Solubility
      rdf:type mim:DataRequirement .

:MeltingPoint
      rdf:type mim:RequirementSet ;
      mim:hasMustRequirement
              :MeltingPointUnits , :MeltingPointValue ;
      mim:hasRestriction
              [ mim:exactCardinality
                        1 ;
                mim:onRequirement :MeltingPointUnits , :MeltingPointValue
              ] .

:MolarMass
      rdf:type mim:DataRequirement .

:MeltingPointUnits
	rdf:type mim:DataRequirement . 

:MeltingPointValue
	rdf:type mim:DataRequirement .


## Other requirements


:Synonym
      rdf:type mim:DataRequirement .

:Image 
	rdf:type mim:DataRequirement . 

:IUPACName
	rdf:type mim:DataRequirement . 
