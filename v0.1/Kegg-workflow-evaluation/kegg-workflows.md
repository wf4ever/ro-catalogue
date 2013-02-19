# Goal

Using workflows described in myExperiment, provide accurate prediction of workflow failures due to KEGG service decay, with meaningful explanation of failure and suggestions/justifications for repair option(s).

The initial focus will be on runnability of the workflows, and may later extend to other criterial


# Plan

## Phase 1: accurate prediction of failures

1. Find all KEGG workflows in myExperiment
   * **Done**: See [KEGG workflow survey](https://docs.google.com/spreadsheet/ccc?key=0Ahxrga9AQHb_dFBQYnNKb25oMmN3Q1VpNjJKS296WGc&usp=sharing "Link to Google docs spreadsheet with survey of KEGG-using workflows in myExperiment")
2. Separate out KEGG workflows that were runnable prior to shutdown of KEGG services
   * **Done**
3. Select a typical simple KEGG workflow for development
4. If necessary, fix up provenance trace and other metadata by hand
5. Create checklist to detect and report decay - identify any additional information that may be required
6. If necessary, fix up metadata associated with all workflows (preferably automated), based on experience with selected workflow.
7. Run checklist against all identified KEGG workflows:  failure should be predicted for all of these


## Phase 2: @@TBD

# Notes

## List of runnable KEGG workflows

This list of of KEGG workflows that were previously determined to be runnable, prior to deprecation of the KEGG web services.  It has been distilled from the [KEGG workflow survey](https://docs.google.com/spreadsheet/ccc?key=0Ahxrga9AQHb_dFBQYnNKb25oMmN3Q1VpNjJKS296WGc&usp=sharing "Link to Google docs spreadsheet with survey of KEGG-using workflows in myExperiment")

* [http://www.myexperiment.org/workflows/3258](http://www.myexperiment.org/workflows/3258/versions/1)
* [http://www.myexperiment.org/workflows/3108](http://www.myexperiment.org/workflows/3108/versions/1)
* [http://www.myexperiment.org/workflows/3107](http://www.myexperiment.org/workflows/3107/versions/1)
* [http://www.myexperiment.org/workflows/3086](http://www.myexperiment.org/workflows/3086/versions/1)
* [http://www.myexperiment.org/workflows/3062](http://www.myexperiment.org/workflows/3062/versions/1)
* [http://www.myexperiment.org/workflows/3001](http://www.myexperiment.org/workflows/3001/versions/1)
* [http://www.myexperiment.org/workflows/2805](http://www.myexperiment.org/workflows/2805/versions/4)
* [http://www.myexperiment.org/workflows/2843](http://www.myexperiment.org/workflows/2843/versions/2)
* [http://www.myexperiment.org/workflows/2673](http://www.myexperiment.org/workflows/2673/versions/2)
* [http://www.myexperiment.org/workflows/2658](http://www.myexperiment.org/workflows/2658/versions/2)
* [http://www.myexperiment.org/workflows/2659](http://www.myexperiment.org/workflows/2659/versions/2)
* [http://www.myexperiment.org/workflows/2021](http://www.myexperiment.org/workflows/2021/versions/1)
* [http://www.myexperiment.org/workflows/1990](http://www.myexperiment.org/workflows/1990/versions/1)
* [http://www.myexperiment.org/workflows/1237](http://www.myexperiment.org/workflows/1237/versions/1)
* [http://www.myexperiment.org/workflows/1189](http://www.myexperiment.org/workflows/1189/versions/1)
* [http://www.myexperiment.org/workflows/1120](http://www.myexperiment.org/workflows/1120/versions/3)
* [http://www.myexperiment.org/workflows/1118](http://www.myexperiment.org/workflows/1118/versions/1)
* [http://www.myexperiment.org/workflows/1099](http://www.myexperiment.org/workflows/1099/versions/1)
* [http://www.myexperiment.org/workflows/987](http://www.myexperiment.org/workflows/987/versions/1)
* [http://www.myexperiment.org/workflows/980](http://www.myexperiment.org/workflows/980/versions/3)
* [http://www.myexperiment.org/workflows/977](http://www.myexperiment.org/workflows/977/versions/3)
* [http://www.myexperiment.org/workflows/967](http://www.myexperiment.org/workflows/967/versions/2)
* [http://www.myexperiment.org/workflows/936](http://www.myexperiment.org/workflows/936/versions/2)
* [http://www.myexperiment.org/workflows/786](http://www.myexperiment.org/workflows/786/versions/1)
* [http://www.myexperiment.org/workflows/778](http://www.myexperiment.org/workflows/778/versions/1)
* [http://www.myexperiment.org/workflows/738](http://www.myexperiment.org/workflows/738/versions/1)
* [http://www.myexperiment.org/workflows/730](http://www.myexperiment.org/workflows/730/versions/1)
* [http://www.myexperiment.org/workflows/611](http://www.myexperiment.org/workflows/611/versions/2)
* [http://www.myexperiment.org/workflows/525](http://www.myexperiment.org/workflows/525/versions/1)
* [http://www.myexperiment.org/workflows/524](http://www.myexperiment.org/workflows/524/versions/1)
* [http://www.myexperiment.org/workflows/523](http://www.myexperiment.org/workflows/523/versions/1)
* [http://www.myexperiment.org/workflows/522](http://www.myexperiment.org/workflows/522/versions/1)
* [http://www.myexperiment.org/workflows/520](http://www.myexperiment.org/workflows/520/versions/1)
* [http://www.myexperiment.org/workflows/519](http://www.myexperiment.org/workflows/519/versions/1)
* [http://www.myexperiment.org/workflows/518](http://www.myexperiment.org/workflows/518/versions/1)
* [http://www.myexperiment.org/workflows/511](http://www.myexperiment.org/workflows/511/versions/1)
* [http://www.myexperiment.org/workflows/510](http://www.myexperiment.org/workflows/510/versions/1)
* [http://www.myexperiment.org/workflows/503](http://www.myexperiment.org/workflows/503/versions/2)
* [http://www.myexperiment.org/workflows/502](http://www.myexperiment.org/workflows/502/versions/1)
* [http://www.myexperiment.org/workflows/501](http://www.myexperiment.org/workflows/501/versions/1)
* [http://www.myexperiment.org/workflows/499](http://www.myexperiment.org/workflows/499/versions/1)
* [http://www.myexperiment.org/workflows/494](http://www.myexperiment.org/workflows/494/versions/1)
* [http://www.myexperiment.org/workflows/493](http://www.myexperiment.org/workflows/493/versions/1)
* [http://www.myexperiment.org/workflows/98](http://www.myexperiment.org/workflows/98/versions/1)
* [http://www.myexperiment.org/workflows/3300](http://www.myexperiment.org/workflows/3300/versions/1)


# Links

* [KEGG workflow survey](https://docs.google.com/spreadsheet/ccc?key=0Ahxrga9AQHb_dFBQYnNKb25oMmN3Q1VpNjJKS296WGc&usp=sharing "Link to Google docs spreadsheet with survey of KEGG-using workflows in myExperiment")

