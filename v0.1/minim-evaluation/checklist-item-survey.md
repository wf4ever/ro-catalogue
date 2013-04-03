# Checklist item survey

Given some collection of resources and annotations about those resources...

# Simple-requirements RO

## Existence of specified descriptive metadata

## Resources matching some probe have associated descriptive metadata 

## Tools installed in software environment

# Workflow ROs

## Existence of specified descriptive metadata

Items: 
`RO_has_hypothesys`, 
`RO_has_sketch`, 
`RO_has_workflow`, 
`RO_has_inputdata`, 
`RO_has_result_presentation`,
`RO_has_conclusion`,
`RO_has_annotations`

e.g. `RO_has_hypothesys`:

      <minim:ContentMatchRequirementRule>
        <minim:exists>
          ?hypothesis rdf:type roterms:Hypothesis .
        </minim:exists>
      </minim:ContentMatchRequirementRule>

## Resources matching some probe have associated descriptive metadata 

Items:
`WF_has_label`, 
`WF_has_title`, 
`WF_has_description`, 
`WF_has_definition`, 
`WF_has_input`, 
`WF_has_input_label`, 
`WF_has_output`, 
`WF_has_output_label`

e.g. `WF_has_label`:

      <minim:ContentMatchRequirementRule>
        <minim:forall>
          ?wf rdf:type wfdesc:Workflow ;
              wfdesc:hasWorkflowDefinition ?wfdef .
        </minim:forall>
        <minim:exists>
          ?wf rdfs:label ?wflab .
        </minim:exists>
      </minim:ContentMatchRequirementRule>

## Resources matching some probe are accessible

Items: `WF_accessible`, `WF_services_accessible`, `WF_inputs_accessible`, `WF_outputs_accessible`, `RO_live_annotations`

e.g. `WF_accessible`:

      <minim:ContentMatchRequirementRule>
        <minim:forall>
          ?pr rdf:type wfdesc:Process ;
              rdfs:label ?prlab .
            {
            ?pr wf4ever:serviceURI ?pruri .
            }
          UNION
            {
            ?pr wf4ever:wsdlURI ?pruri .
            }
        </minim:forall>
        <minim:orderby>ORDER BY ?prlab</minim:orderby>
        <minim:isLiveTemplate>
          {+pruri}
        </minim:isLiveTemplate>
      </minim:ContentMatchRequirementRule>

The ordering here is used for consistency of generated reports, and is otherwise not central to the fundamental aspect of performing quality evaluation.

## Resources matching some probe are part of the given collection

Items: `WF_inputs_agregated`, `WF_outputs_agregated`

e.g. `WF_inputs_agregated`:

      <minim:ContentMatchRequirementRule>
        <minim:forall>
          ?wf rdf:type wfdesc:Workflow ;
              rdfs:label ?wflab ;
              wfdesc:hasInput ?ifdesc .
          ?ifdesc rdfs:label ?iflab ;
              wfdesc:hasArtifact ?if .
        </minim:forall>
        <minim:aggregatesTemplate>
          {+if}
        </minim:aggregatesTemplate>
      </minim:ContentMatchRequirementRule>


# Chembox evaluation

## Existence of specified descriptive metadata

Items: `SMILES`, `PubChem`, `Synonym`, `IUPACName`, `Image`, `Solubility`, `MeltingPoint`, `MolarMass`, 

e.g. `Synonym`:

    CONSTRUCT
      { ?x mim:containsDataReport
        [ mim:reports chembox-mim:Synonym ;
          mim:withValue ?value ] }
    WHERE
      { ?x chembox:OtherNames ?value }


## Existence of specified descriptive metadata with cardinality constraint

Items: `InChI`, `ChemSpider`, `MolecularFormula`

Note: may be combined with other constraints; e.g. data type


## Existence of specified descriptive metadata with data type constraint

Items: `InChI`, `ChemSpider`, _etc_.

e.g. `ChemSpider`:

    :ChemSpider
          rdf:type mim:DataRequirement ;
          mim:hasRestriction
                  [ mim:onSelf "true"^^xsd:boolean ;
                    mim:type xsd:integer ] .

    CONSTRUCT
        { ?x mim:containsDataReport _:b0 .
         _:b0 mim:reports chembox-mim:ChemSpider .
         _:b0 mim:withValue ?value . }
    WHERE 
        { ?x chembox:ChemSpiderID ?c .
          BIND (xsd:integer(?c) AS ?cd) .
          BIND (IF(bound(?cd), ?cd, ?c) AS ?value) . }

Note: may be combined with other constraints; e.g. cardinality


## Existence of complex value with defined structure

Items: `MeltingPoint`, `MolecularFormula`

e.g. `MeltingPoint`:

    CONSTRUCT
      { ?x mim:containsReportSet
          [ mim:containsDataReport
              [ mim:reports chembox-mim:MeltingPointValue ;
                mim:withValue ?value ] ;
            mim:containsDataReport 
              [ mim:reports chembox-mim:MeltingPointUnits ;
                mim:withValue ?units ] ;
            mim:reports chembox-mim:MeltingPoint ]
      }
    WHERE
      { OPTIONAL
          { ?x (chembox:MeltingPtK|chembox:MeltingPtKL)|chembox:MeltingPtKH ?value .
            BIND ("K" AS ?units) . } .
        OPTIONAL
          { ?x (chembox:MeltingPtC|chembox:MeltingPtCL)|chembox:MeltingPtCH ?value .
            BIND ("C" AS ?units) . } .
      }

Note: may be combined with other constraints; e.g. cardinality.


# qSKOS evaluation

## Existence of specified descriptive metadata (for resources matching a given probe)

Items:
Undocumented Concepts,
Orphan Concepts,
Valueless Associative Relations,
Solely Transitively Related Concepts,
Omitted Top Concepts,
Top Concept Having Broader Concepts

## Existence of consistent metadata for a range of resources

Items:
Incomplete Language Coverage

## Existence of unique metadata value

Items:
Label Conflicts

## Liveness

Items:
Broken Links

## Query external resource

Items:
Omitted or Invalid Language Tags,
Missing In-Links,
Undefined SKOS Resources

## Special cases

Items:
Weakly Connected Components,
Cyclic Hierarchical Relations,
Missing Out-Links


# Distillation

The majority of items involve probing the metadata environment and checking for the existence or nonexistence of certain patterns of values.  The complexity of the patterns typically falls into one of thew following cases:

* Simple existence (or non-existence) check (EXISTS)
* For all occurrences of some pattern, check for existence (or non-existence) of associated metadata (FORALL:EXISTS)
* Data type constraints associated with the above
* Cardinality constraints associated with the above
* Comparing the result sets from various queries (e.g. same or subset) (@@interesting: OWL probably well suited, but with subsumption defined in terms of instance data not class expressions?)
* Evaluating graph patterns in result sets from various queries
* Liveness (accessibility) tests of resources matching some pattern
* Testing matched values for membership of a designated collection of resources (e.g. RO aggregation test)
* Software environment testing

A few cases include queries to external resources as well as those under evaluation.

In some cases, queries need to test data types and/or namespaces associated with matching values.

