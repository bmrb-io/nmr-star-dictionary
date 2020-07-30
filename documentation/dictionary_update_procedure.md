NMR-STAR Dictionary Development Plan and BMRB Entry Remediation (2020-07-20)

Goals:
* Establish a regular process for updating and release of new NMR-STAR dictionary versions
  * Define methods for ensuring that a new dictionary version can be put into production without breaking anything from deposition to the database
  * Establish plans for regular remediation of BMRB entries to conform with the most recent production
    * NMR-STAR dictionary
    * When there is a change that requires remediation of existing entries, we'd want to somehow do it 	without needing to manually check 15,000 NMR-STAR files
  * Long-term goal of meeting NIH requirements for database certification 

Plan (not yet a real plan, laying out issues and what needs to be carried out, next step will be to define action items, prioritize items, and organize as a plan with an approximate time-line):
* Define pre-production dictionary version to be finalized
 * No tag renaming will be carried out with this version - causes too many downstream issues with relational database and validation tools
 * Implement pre-production NMR-STAR dictionary branch
 * Dictionary dependent processes to update with pre-production dictionary
   * BMRBdep 
   * Entry validation pipeline
   * Relational database
   * Format conversion tools
   * Template generation tools
   * Remediation of BMRB entry format (15K+ released and on-hold)
 * Remediate 15K+ released and on-hold BMRB entries to the pre-production dictionary defined format
   * This may involve triaging the entries and updating in batches
   * Need to eliminate all of the >200 issues that Dimitri finds when loading the database
   * All T1/R1 and similar relaxation data needs to be mapped from unique
   * Big issue is how to validate that data has not been lost or corrupted in carrying out the remediation?
    * File diffs do not work for sure
    * Can an effective data value comparison can be written?
    * Would remediation be carried out on released entry files or pre-release files that contain contact   person information?
 * Difficulties found during the process upgrades and entry remediation may require that the pre-production dictionary be modified
 * A final release of all BMRB entries along with the final production dictionary
 * Complete BioSTAR DDL
 * Complete software to generate NMR-STAR dictionary using BioSTAR DDL specification
 * Make completed production dictionary branch publicly available
 * Make development dictionary branch publicly available
 * Create history file documenting changes between versions of the dictionary (should this be included in 	dictionary or made a separate file?)
   * Questions to discuss before deciding on path forward
     * Who are the stakeholders in need of a dictionary 'history' (CCPN and wwPDB partners and BMRB)?
     * What are the stakeholder's needs (historical comments, documentation of updates for maintaining their software, parsable format to aid programmatic analysis and use in updating software)?
     * What format/style should be used for history document (NMR-STAR, other)?
     * Is the mmCIF/pdbx format/style sufficient?
     * How can the various forms of the past dictionary versions be used to generate a 'history'?
     * How best to append the 'history' going forward?
   * Current forms of past versions of the dictionary that are available
     * Oldest versions of dictionary that are available are probably versions of the Excel spreadsheet stored in directories on Eldon's laptop(s)
     * At some point the dictionary was being committed to a cvs repository
     * Later a svn repository was being used. I believe but am not sure if the cvs repository was loaded into the svn repository
     * Recently (starting in 2019) the dictionary versions have been committed to a GitHub repository
   * Eldon votes for separate file
   * Jon leans towards a separate file?
   * Michael leans towards a separate file?
   * 
 * Establish a process and plans for regular dictionary releases and entry remediation
   * Release official new version every 3-6 months
   * Issues to address with dictionary updates that might be required between major updates
     * Discovery of significant dictionary issues
       * BMRBdep problems that require immediate update
       * Entry validation problem solutions
       * Relational database construction and/or loading problem solutions
     * Accommodating depositors with new kinds of data that needs ‘immediate’ release
 * Publish NMR-STAR dictionary paper
   * Focus only on NMR-STAR?
   * Include description of BioSTAR DDL or put this into a separate paper?

Future dictionary development (future major releases):
* Dictionary development issues
  * Chemical shift perturbation
  * Screening
  * Tensors 
  * Relaxation
  * Techniques other than NMR
* Adding tag/category examples
* Improve tag definitions (make more verbose, clearer to those not familiar with NMR-STAR, STAR, and mmCIF/pdbx)
* Obtain from RCSB or write code to validate relational model/parent-child relationships
