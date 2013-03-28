# Summary of chemmim requirements

Note: to convert to HTML with ToC, use:

        pandoc --table-of-contents --toc-depth=3 -c pandoc-html.css \
               --from=markdown --to=html \
               -o chemmim-summary.html chemmim-summary.md


## Preliminaries (grouped requirements)

Requirements are grouped roughly into identifiers, properties, and other requirements.

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
                    mim:type xsd:string ] .

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
                    mim:type xsd:string ] .

This has almost identical construction to the :InChI requirement.


### ChemSpider

    :ChemSpider
          rdf:type mim:DataRequirement ;
          mim:hasRestriction
                  [ mim:onSelf "true"^^xsd:boolean ;
                    mim:type xsd:integer ] .

The construction here is similar to :InChI, except that the ChemSpider identifier is required to be an integer.

    CONSTRUCT
        { ?x mim:containsDataReport _:b0 .
         _:b0 mim:reports chembox-mim:ChemSpider .
         _:b0 mim:withValue ?value . }
    WHERE 
        { ?x chembox:ChemSpiderID ?c .
          BIND (xsd:integer(?c) AS ?cd) .
          BIND (IF(bound(?cd), ?cd, ?c) AS ?value) . }


### PubChem

    :PubChem
          rdf:type mim:DataRequirement ;
          mim:hasRestriction
                  [ mim:onSelf "true"^^xsd:boolean ;
                    mim:type xsd:integer ] .

This has almost identifcal construction to the :ChemSpider requirement.

    CONSTRUCT
        { ?x mim:containsDataReport _:b0 .
          _:b0 mim:reports chembox-mim:PubChem .
          _:b0 mim:withValue ?value . }
    WHERE
        { ?x chembox:PubChem ?c .
          BIND (xsd:integer(?c) AS ?cd) .
          BIND (IF(bound(?cd), ?cd, ?c) AS ?value) . }


## Properties

### MolecularFormula

    :MolecularFormula
          rdf:type mim:DataRequirement ;
          mim:hasRestriction
                  [ mim:onSelf "true"^^xsd:boolean ;
                    mim:type xsd:string
                  ] .

There's a very simple form for this requirement which simply looks for a chembox:Formula statement in the data.  Minim can handle this easily enough.

    CONSTRUCT
        { ?x mim:containsDataReport _:b0 .
          _:b0 mim:reports chembox-mim:MolecularFormula .
          _:b0 mim:withValue ?value . }
    WHERE
        { ?x chembox:Formula ?value . }

There's also a more complex form that defeats me, which seems to expect a chemical formula in which the constituent chemical elements are described in some RDF structure:  

* the SPIN converter service isn't capable of fully converting the query used: I think it's returning the SELECT subquery, but not the surrounding CONSTRUCT query
* the query itself seems to be attempting to perform a complex string manipulation function that, frankly, I think is unreasonable to attempt using SPARQL.  It seems to be trying to parse and/or assemble a chemical formula.

To handle this in Minim, I would consider introducing a specialized web service to manipulate the formula and return the desired result.  This will require a minim extension to use external services, but one that would be available to address many of these domain-specific considerations.  (Using a functional language to handle the domain specific service implementation could retain a level of logical tractability, but that's a separate issue.  Or simply associate some primitive assertions with the service which can be associated with the result.)

Here is part of the query used for :MolecularFormula:

    PREFIX chembox: <http://dbpedia.org/resource/Template:Chembox:>
    PREFIX fn: <http://www.w3.org/2005/xpath-functions#>
    SELECT *
    WHERE
        { OPTIONAL { ?x chembox:C ?C . } .
          OPTIONAL { ?x chembox:H ?H . } .
          OPTIONAL { ?x chembox:Ac ?Ac . } .
          OPTIONAL { ?x chembox:Ag ?Ag . } .
          OPTIONAL { ?x chembox:Al ?Al . } .
          OPTIONAL { ?x chembox:Am ?Am . } .
          OPTIONAL { ?x chembox:Ar ?Ar . } .
          OPTIONAL { ?x chembox:As ?As . } .
          OPTIONAL { ?x chembox:At ?At . } .
          OPTIONAL { ?x chembox:Au ?Au . } .
          OPTIONAL { ?x chembox:B ?B . } .
          OPTIONAL { ?x chembox:Ba ?Ba . } .
          OPTIONAL { ?x chembox:Be ?Be . } .
          OPTIONAL { ?x chembox:Bh ?Bh . } .
          OPTIONAL { ?x chembox:Bi ?Bi . } .
          OPTIONAL { ?x chembox:Bk ?Bk . } .
          OPTIONAL { ?x chembox:Br ?Br . } .
          OPTIONAL { ?x chembox:Ca ?Ca . } .
          OPTIONAL { ?x chembox:Cd ?Cd . } .
          OPTIONAL { ?x chembox:Ce ?Ce . } .
          OPTIONAL { ?x chembox:Cf ?Cf . } .
          OPTIONAL { ?x chembox:Cl ?Cl . } .
          OPTIONAL { ?x chembox:Cm ?Cm . } .
          OPTIONAL { ?x chembox:Co ?Co . } .
          OPTIONAL { ?x chembox:Cr ?Cr . } .
          OPTIONAL { ?x chembox:Cs ?Cs . } .
          OPTIONAL { ?x chembox:Cu ?Cu . } .
          OPTIONAL { ?x chembox:Db ?Db . } .
          OPTIONAL { ?x chembox:Ds ?Ds . } .
          OPTIONAL { ?x chembox:Dy ?Dy . } .
          OPTIONAL { ?x chembox:Er ?Er . } .
          OPTIONAL { ?x chembox:Es ?Es . } .
          OPTIONAL { ?x chembox:Eu ?Eu . } .
          OPTIONAL { ?x chembox:F ?F . } .
          OPTIONAL { ?x chembox:Fe ?Fe . } .
          OPTIONAL { ?x chembox:Fm ?Fm . } .
          OPTIONAL { ?x chembox:Fr ?Fr . } .
          OPTIONAL { ?x chembox:Ga ?Ga . } .
          OPTIONAL { ?x chembox:Gd ?Gd . } .
          OPTIONAL { ?x chembox:Ge ?Ge . } .
          OPTIONAL { ?x chembox:He ?He . } .
          OPTIONAL { ?x chembox:Hf ?Hf . } .
          OPTIONAL { ?x chembox:Hg ?Hg . } .
          OPTIONAL { ?x chembox:Ho ?Ho . } .
          OPTIONAL { ?x chembox:Hs ?Hs . } .
          OPTIONAL { ?x chembox:I ?I . } .
          OPTIONAL { ?x chembox:In ?In . } .
          OPTIONAL { ?x chembox:Ir ?Ir . } .
          OPTIONAL { ?x chembox:K ?K . } .
          OPTIONAL { ?x chembox:Kr ?Kr . } .
          OPTIONAL { ?x chembox:La ?La . } .
          OPTIONAL { ?x chembox:Li ?Li . } .
          OPTIONAL { ?x chembox:Lr ?Lr . } .
          OPTIONAL { ?x chembox:Lu ?Lu . } .
          OPTIONAL { ?x chembox:Md ?Md . } .
          OPTIONAL { ?x chembox:Mg ?Mg . } .
          OPTIONAL { ?x chembox:Mn ?Mn . } .
          OPTIONAL { ?x chembox:Mo ?Mo . } .
          OPTIONAL { ?x chembox:Mt ?Mt . } .
          OPTIONAL { ?x chembox:N ?N . } .
          OPTIONAL { ?x chembox:Na ?Na . } .
          OPTIONAL { ?x chembox:Nb ?Nb . } .
          OPTIONAL { ?x chembox:Nd ?Nd . } .
          OPTIONAL { ?x chembox:Ne ?Ne . } .
          OPTIONAL { ?x chembox:Ni ?Ni . } .
          OPTIONAL { ?x chembox:No ?No . } .
          OPTIONAL { ?x chembox:Np ?Np . } .
          OPTIONAL { ?x chembox:O ?O . } .
          OPTIONAL { ?x chembox:Os ?Os . } .
          OPTIONAL { ?x chembox:P ?P . } .
          OPTIONAL { ?x chembox:Pa ?Pa . } .
          OPTIONAL { ?x chembox:Pb ?Pb . } .
          OPTIONAL { ?x chembox:Pd ?Pd . } .
          OPTIONAL { ?x chembox:Pm ?Pm . } .
          OPTIONAL { ?x chembox:Po ?Po . } .
          OPTIONAL { ?x chembox:Pr ?Pr . } .
          OPTIONAL { ?x chembox:Pt ?Pt . } .
          OPTIONAL { ?x chembox:Pu ?Pu . } .
          OPTIONAL { ?x chembox:Ra ?Ra . } .
          OPTIONAL { ?x chembox:Rb ?Rb . } .
          OPTIONAL { ?x chembox:Re ?Re . } .
          OPTIONAL { ?x chembox:Rf ?Rf . } .
          OPTIONAL { ?x chembox:Rg ?Rg . } .
          OPTIONAL { ?x chembox:Rh ?Rh . } .
          OPTIONAL { ?x chembox:Rn ?Rn . } .
          OPTIONAL { ?x chembox:Ru ?Ru . } .
          OPTIONAL { ?x chembox:S ?S . } .
          OPTIONAL { ?x chembox:Sb ?Sb . } .
          OPTIONAL { ?x chembox:Sc ?Sc . } .
          OPTIONAL { ?x chembox:Se ?Se . } .
          OPTIONAL { ?x chembox:Sg ?Sg . } .
          OPTIONAL { ?x chembox:Si ?Si . } .
          OPTIONAL { ?x chembox:Sm ?Sm . } .
          OPTIONAL { ?x chembox:Sn ?Sn . } .
          OPTIONAL { ?x chembox:Sr ?Sr . } .
          OPTIONAL { ?x chembox:Ta ?Ta . } .
          OPTIONAL { ?x chembox:Tb ?Tb . } .
          OPTIONAL { ?x chembox:Tc ?Tc . } .
          OPTIONAL { ?x chembox:Te ?Te . } .
          OPTIONAL { ?x chembox:Th ?Th . } .
          OPTIONAL { ?x chembox:Ti ?Ti . } .
          OPTIONAL { ?x chembox:Tl ?Tl . } .
          OPTIONAL { ?x chembox:Tm ?Tm . } .
          OPTIONAL { ?x chembox:U ?U . } .
          OPTIONAL { ?x chembox:Uub ?Uub . } .
          OPTIONAL { ?x chembox:Uuh ?Uuh . } .
          OPTIONAL { ?x chembox:Uuo ?Uuo . } .
          OPTIONAL { ?x chembox:Uup ?Uup . } .
          OPTIONAL { ?x chembox:Uuq ?Uuq . } .
          OPTIONAL { ?x chembox:Uus ?Uus . } .
          OPTIONAL { ?x chembox:Uut ?Uut . } .
          OPTIONAL { ?x chembox:V ?V . } .
          OPTIONAL { ?x chembox:W ?W . } .
          OPTIONAL { ?x chembox:Xe ?Xe . } .
          OPTIONAL { ?x chembox:Y ?Y . } .
          OPTIONAL { ?x chembox:Yb ?Yb . } .
          OPTIONAL { ?x chembox:Zn ?Zn . } .
          OPTIONAL { ?x chembox:Zr ?Zr . } .
          BIND (IF(bound(?C), fn:concat("C", ?C), "") AS ?C1) .
          BIND (IF(bound(?H), fn:concat("H", ?H), "") AS ?H1) .
          BIND (IF(bound(?Ac), fn:concat("Ac", ?Ac), "") AS ?Ac1) .
          BIND (IF(bound(?Ag), fn:concat("Ag", ?Ag), "") AS ?Ag1) .
          BIND (IF(bound(?Al), fn:concat("Al", ?Al), "") AS ?Al1) .
          BIND (IF(bound(?Am), fn:concat("Am", ?Am), "") AS ?Am1) .
          BIND (IF(bound(?Ar), fn:concat("Ar", ?Ar), "") AS ?Ar1) .
          BIND (IF(bound(?As), fn:concat("As", ?As), "") AS ?As1) .
          BIND (IF(bound(?At), fn:concat("At", ?At), "") AS ?At1) .
          BIND (IF(bound(?Au), fn:concat("Au", ?Au), "") AS ?Au1) .
          BIND (IF(bound(?B), fn:concat("B", ?B), "") AS ?B1) .
          BIND (IF(bound(?Ba), fn:concat("Ba", ?Ba), "") AS ?Ba1) .
          BIND (IF(bound(?Be), fn:concat("Be", ?Be), "") AS ?Be1) .
          BIND (IF(bound(?Bh), fn:concat("Bh", ?Bh), "") AS ?Bh1) .
          BIND (IF(bound(?Bi), fn:concat("Bi", ?Bi), "") AS ?Bi1) .
          BIND (IF(bound(?Bk), fn:concat("Bk", ?Bk), "") AS ?Bk1) .
          BIND (IF(bound(?Br), fn:concat("Br", ?Br), "") AS ?Br1) .
          BIND (IF(bound(?Ca), fn:concat("Ca", ?Ca), "") AS ?Ca1) .
          BIND (IF(bound(?Cd), fn:concat("Cd", ?Cd), "") AS ?Cd1) .
          BIND (IF(bound(?Ce), fn:concat("Ce", ?Ce), "") AS ?Ce1) .
          BIND (IF(bound(?Cf), fn:concat("Cf", ?Cf), "") AS ?Cf1) .
          BIND (IF(bound(?Cl), fn:concat("Cl", ?Cl), "") AS ?Cl1) .
          BIND (IF(bound(?Cm), fn:concat("Cm", ?Cm), "") AS ?Cm1) .
          BIND (IF(bound(?Co), fn:concat("Co", ?Co), "") AS ?Co1) .
          BIND (IF(bound(?Cr), fn:concat("Cr", ?Cr), "") AS ?Cr1) .
          BIND (IF(bound(?Cs), fn:concat("Cs", ?Cs), "") AS ?Cs1) .
          BIND (IF(bound(?Cu), fn:concat("Cu", ?Cu), "") AS ?Cu1) .
          BIND (IF(bound(?Db), fn:concat("Db", ?Db), "") AS ?Db1) .
          BIND (IF(bound(?Ds), fn:concat("Ds", ?Ds), "") AS ?Ds1) .
          BIND (IF(bound(?Dy), fn:concat("Dy", ?Dy), "") AS ?Dy1) .
          BIND (IF(bound(?Er), fn:concat("Er", ?Er), "") AS ?Er1) .
          BIND (IF(bound(?Es), fn:concat("Es", ?Es), "") AS ?Es1) .
          BIND (IF(bound(?Eu), fn:concat("Eu", ?Eu), "") AS ?Eu1) .
          BIND (IF(bound(?F), fn:concat("F", ?F), "") AS ?F1) .
          BIND (IF(bound(?Fe), fn:concat("Fe", ?Fe), "") AS ?Fe1) .
          BIND (IF(bound(?Fm), fn:concat("Fm", ?Fm), "") AS ?Fm1) .
          BIND (IF(bound(?Fr), fn:concat("Fr", ?Fr), "") AS ?Fr1) .
          BIND (IF(bound(?Ga), fn:concat("Ga", ?Ga), "") AS ?Ga1) .
          BIND (IF(bound(?Gd), fn:concat("Gd", ?Gd), "") AS ?Gd1) .
          BIND (IF(bound(?Ge), fn:concat("Ge", ?Ge), "") AS ?Ge1) .
          BIND (IF(bound(?He), fn:concat("He", ?He), "") AS ?He1) .
          BIND (IF(bound(?Hf), fn:concat("Hf", ?Hf), "") AS ?Hf1) .
          BIND (IF(bound(?Hg), fn:concat("Hg", ?Hg), "") AS ?Hg1) .
          BIND (IF(bound(?Ho), fn:concat("Ho", ?Ho), "") AS ?Ho1) .
          BIND (IF(bound(?Hs), fn:concat("Hs", ?Hs), "") AS ?Hs1) .
          BIND (IF(bound(?I), fn:concat("I", ?I), "") AS ?I1) .
          BIND (IF(bound(?In), fn:concat("In", ?In), "") AS ?In1) .
          BIND (IF(bound(?Ir), fn:concat("Ir", ?Ir), "") AS ?Ir1) .
          BIND (IF(bound(?K), fn:concat("K", ?K), "") AS ?K1) .
          BIND (IF(bound(?Kr), fn:concat("Kr", ?Kr), "") AS ?Kr1) .
          BIND (IF(bound(?La), fn:concat("La", ?La), "") AS ?La1) .
          BIND (IF(bound(?Li), fn:concat("Li", ?Li), "") AS ?Li1) .
          BIND (IF(bound(?Lr), fn:concat("Lr", ?Lr), "") AS ?Lr1) .
          BIND (IF(bound(?Lu), fn:concat("Lu", ?Lu), "") AS ?Lu1) .
          BIND (IF(bound(?Md), fn:concat("Md", ?Md), "") AS ?Md1) .
          BIND (IF(bound(?Mg), fn:concat("Mg", ?Mg), "") AS ?Mg1) .
          BIND (IF(bound(?Mn), fn:concat("Mn", ?Mn), "") AS ?Mn1) .
          BIND (IF(bound(?Mo), fn:concat("Mo", ?Mo), "") AS ?Mo1) .
          BIND (IF(bound(?Mt), fn:concat("Mt", ?Mt), "") AS ?Mt1) .
          BIND (IF(bound(?N), fn:concat("N", ?N), "") AS ?N1) .
          BIND (IF(bound(?Na), fn:concat("Na", ?Na), "") AS ?Na1) .
          BIND (IF(bound(?Nb), fn:concat("Nb", ?Nb), "") AS ?Nb1) .
          BIND (IF(bound(?Nd), fn:concat("Nd", ?Nd), "") AS ?Nd1) .
          BIND (IF(bound(?Ne), fn:concat("Ne", ?Ne), "") AS ?Ne1) .
          BIND (IF(bound(?Ni), fn:concat("Ni", ?Ni), "") AS ?Ni1) .
          BIND (IF(bound(?No), fn:concat("No", ?No), "") AS ?No1) .
          BIND (IF(bound(?Np), fn:concat("Np", ?Np), "") AS ?Np1) .
          BIND (IF(bound(?O), fn:concat("O", ?O), "") AS ?O1) .
          BIND (IF(bound(?Os), fn:concat("Os", ?Os), "") AS ?Os1) .
          BIND (IF(bound(?P), fn:concat("P", ?P), "") AS ?P1) .
          BIND (IF(bound(?Pa), fn:concat("Pa", ?Pa), "") AS ?Pa1) .
          BIND (IF(bound(?Pb), fn:concat("Pb", ?Pb), "") AS ?Pb1) .
          BIND (IF(bound(?Pd), fn:concat("Pd", ?Pd), "") AS ?Pd1) .
          BIND (IF(bound(?Pm), fn:concat("Pm", ?Pm), "") AS ?Pm1) .
          BIND (IF(bound(?Po), fn:concat("Po", ?Po), "") AS ?Po1) .
          BIND (IF(bound(?Pr), fn:concat("Pr", ?Pr), "") AS ?Pr1) .
          BIND (IF(bound(?Pt), fn:concat("Pt", ?Pt), "") AS ?Pt1) .
          BIND (IF(bound(?Pu), fn:concat("Pu", ?Pu), "") AS ?Pu1) .
          BIND (IF(bound(?Ra), fn:concat("Ra", ?Ra), "") AS ?Ra1) .
          BIND (IF(bound(?Rb), fn:concat("Rb", ?Rb), "") AS ?Rb1) .
          BIND (IF(bound(?Re), fn:concat("Re", ?Re), "") AS ?Re1) .
          BIND (IF(bound(?Rf), fn:concat("Rf", ?Rf), "") AS ?Rf1) .
          BIND (IF(bound(?Rg), fn:concat("Rg", ?Rg), "") AS ?Rg1) .
          BIND (IF(bound(?Rh), fn:concat("Rh", ?Rh), "") AS ?Rh1) .
          BIND (IF(bound(?Rn), fn:concat("Rn", ?Rn), "") AS ?Rn1) .
          BIND (IF(bound(?Ru), fn:concat("Ru", ?Ru), "") AS ?Ru1) .
          BIND (IF(bound(?S), fn:concat("S", ?S), "") AS ?S1) .
          BIND (IF(bound(?Sb), fn:concat("Sb", ?Sb), "") AS ?Sb1) .
          BIND (IF(bound(?Sc), fn:concat("Sc", ?Sc), "") AS ?Sc1) .
          BIND (IF(bound(?Se), fn:concat("Se", ?Se), "") AS ?Se1) .
          BIND (IF(bound(?Sg), fn:concat("Sg", ?Sg), "") AS ?Sg1) .
          BIND (IF(bound(?Si), fn:concat("Si", ?Si), "") AS ?Si1) .
          BIND (IF(bound(?Sm), fn:concat("Sm", ?Sm), "") AS ?Sm1) .
          BIND (IF(bound(?Sn), fn:concat("Sn", ?Sn), "") AS ?Sn1) .
          BIND (IF(bound(?Sr), fn:concat("Sr", ?Sr), "") AS ?Sr1) .
          BIND (IF(bound(?Ta), fn:concat("Ta", ?Ta), "") AS ?Ta1) .
          BIND (IF(bound(?Tb), fn:concat("Tb", ?Tb), "") AS ?Tb1) .
          BIND (IF(bound(?Tc), fn:concat("Tc", ?Tc), "") AS ?Tc1) .
          BIND (IF(bound(?Te), fn:concat("Te", ?Te), "") AS ?Te1) .
          BIND (IF(bound(?Th), fn:concat("Th", ?Th), "") AS ?Th1) .
          BIND (IF(bound(?Ti), fn:concat("Ti", ?Ti), "") AS ?Ti1) .
          BIND (IF(bound(?Tl), fn:concat("Tl", ?Tl), "") AS ?Tl1) .
          BIND (IF(bound(?Tm), fn:concat("Tm", ?Tm), "") AS ?Tm1) .
          BIND (IF(bound(?U), fn:concat("U", ?U), "") AS ?U1) .
          BIND (IF(bound(?Uub), fn:concat("Uub", ?Uub), "") AS ?Uub1) .
          BIND (IF(bound(?Uuh), fn:concat("Uuh", ?Uuh), "") AS ?Uuh1) .
          BIND (IF(bound(?Uuo), fn:concat("Uuo", ?Uuo), "") AS ?Uuo1) .
          BIND (IF(bound(?Uup), fn:concat("Uup", ?Uup), "") AS ?Uup1) .
          BIND (IF(bound(?Uuq), fn:concat("Uuq", ?Uuq), "") AS ?Uuq1) .
          BIND (IF(bound(?Uus), fn:concat("Uus", ?Uus), "") AS ?Uus1) .
          BIND (IF(bound(?Uut), fn:concat("Uut", ?Uut), "") AS ?Uut1) .
          BIND (IF(bound(?V), fn:concat("V", ?V), "") AS ?V1) .
          BIND (IF(bound(?W), fn:concat("W", ?W), "") AS ?W1) .
          BIND (IF(bound(?Xe), fn:concat("Xe", ?Xe), "") AS ?Xe1) .
          BIND (IF(bound(?Y), fn:concat("Y", ?Y), "") AS ?Y1) .
          BIND (IF(bound(?Yb), fn:concat("Yb", ?Yb), "") AS ?Yb1) .
          BIND (IF(bound(?Zn), fn:concat("Zn", ?Zn), "") AS ?Zn1) .
          BIND (IF(bound(?Zr), fn:concat("Zr", ?Zr), "") AS ?Zr1) . }


### Solubility

    :Solubility
          rdf:type mim:DataRequirement .

A solubility description is an optional (MAY) requirement, which is indicated simply by a chembox:Solubility statement.

    CONSTRUCT 
        { ?x mim:containsDataReport _:b0 .
          _:b0 mim:reports chembox-mim:Solubility .
          _:b0 mim:withValue ?value . }
    WHERE
        { ?x chembox:Solubility ?value . }



### MeltingPoint

    :MeltingPoint
        rdf:type mim:RequirementSet ;
        mim:hasMustRequirement :MeltingPointUnits , :MeltingPointValue ;
        mim:hasRestriction
          [ mim:exactCardinality 1 ;
            mim:onRequirement :MeltingPointUnits , :MeltingPointValue ] .

    :MeltingPointUnits
        rdf:type mim:DataRequirement . 

    :MeltingPointValue
        rdf:type mim:DataRequirement .

This involves a relatively complex query that generates three separate reports as required: a :MeltingPoint report, and :MeltingPointUnits and :MeltingPointValue reports, of which there must be exactly one of each.  (Here, we see a mim:RequirementSet value is generated directly by the SPIN rule, which is a little surprising.)

    CONSTRUCT
      { ?x mim:containsReportSet _:b0 .
        _:b0 mim:containsDataReport _:b1 .
        _:b0 mim:containsDataReport _:b2 .
        _:b0 mim:reports chembox-mim:MeltingPoint .
        _:b1 mim:reports chembox-mim:MeltingPointValue .
        _:b1 mim:withValue ?value .
        _:b2 mim:reports chembox-mim:MeltingPointUnits .
        _:b2 mim:withValue ?units . }
    WHERE
      { OPTIONAL
          { ?x (chembox:MeltingPtK|chembox:MeltingPtKL)|chembox:MeltingPtKH ?value .
            BIND ("K" AS ?units) . } .
        OPTIONAL
          { ?x (chembox:MeltingPtC|chembox:MeltingPtCL)|chembox:MeltingPtCH ?value .
            BIND ("C" AS ?units) . } .
      }

There are also some related rules that appear to require melting points separately in C or K units:

    CONSTRUCT 
      { ?x mim:containsReportSet _:b0 .
        _:b0 mim:containsDataReport _:b1 .
        _:b0 mim:containsDataReport _:b2 .
        _:b0 mim:reports chembox-mim:MeltingPoint .
        _:b1 mim:reports chembox-mim:MeltingPointValue .
        _:b1 mim:withValue ?value .
        _:b2 mim:reports chembox-mim:MeltingPointUnits .
        _:b2 mim:withValue ?units . }
    WHERE
      { ?x chembox:MeltingPt ?value .
        BIND (regex(?value, "K$", "i") AS ?k) .
        BIND (IF(?k, "K", "") AS ?units) .
        FILTER (?units != "") . }

and

    CONSTRUCT
      { ?x mim:containsReportSet _:b0 .
        _:b0 mim:containsDataReport _:b1 .
        _:b0 mim:containsDataReport _:b2 .
        _:b0 mim:reports chembox-mim:MeltingPoint .
        _:b1 mim:reports chembox-mim:MeltingPointValue .
        _:b1 mim:withValue ?value .
        _:b2 mim:reports chembox-mim:MeltingPointUnits .
        _:b2 mim:withValue ?units . }
    WHERE
      { ?x chembox:MeltingPt ?value .
        BIND (regex(?value, "C$", "i") AS ?c) .
        BIND (IF(?c, "C", "") AS ?units) .
        FILTER (?units != "") . }


### MolarMass

    :MolarMass
          rdf:type mim:DataRequirement .

The molar mass description is a SHOULD requirement that simply looks for the presence of a chembox:MolarMass value:

    CONSTRUCT
      { ?x mim:containsDataReport _:b0 .
        _:b0 mim:reports chembox-mim:MolarMass .
        _:b0 mim:withValue ?value . }
    WHERE
      { ?x chembox:MolarMass ?value . }


## Other requirements

### Synonym

    :Synonym
          rdf:type mim:DataRequirement .

A synonym is an optional; (MAY) requirement that simply looks for the presence of a chembox:OtherNames value:

    CONSTRUCT
      { ?x mim:containsDataReport _:b0 .
        _:b0 mim:reports chembox-mim:Synonym .
        _:b0 mim:withValue ?value . }
    WHERE
      { ?x chembox:OtherNames ?value . }


### IUPACName

    :IUPACName
    	rdf:type mim:DataRequirement . 

A simple test for available information:

    CONSTRUCT
      { ?x mim:containsDataReport _:b0 .
        _:b0 mim:reports chembox-mim:IUPACName .
        _:b0 mim:withValue ?value . }
    WHERE
      { ?x chembox:IUPACName ?value . }


### Image

    :Image 
    	rdf:type mim:DataRequirement . 

Looks for statements using one of three properties, and manipulates the result to construct a URI for the image resource.  In this respect (constructing the URI) it goes beyond the requirements of simple metadata checking, but the resulting URI might be useful for liveness testing.

    CONSTRUCT {
        ?x mim:containsDataReport _:b0 .
        _:b0 mim:reports chembox-mim:Image .
        _:b0 mim:withValue ?value .
        ?value a <http://xmlns.com/foaf/0.1/Image> .
    }
    WHERE {
        ?x (chembox:ImageFile|chembox:ImageFileL1)|chembox:ImageFileR1 ?f .
        BIND (IRI(fn:concat("http://en.wikipedia.org/File:", ?f)) AS ?value) .
    }

