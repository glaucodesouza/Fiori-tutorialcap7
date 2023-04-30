namespace sap.ui.riskmanagement;
using { managed } from '@sap/cds/common';
//Abourt the Cardinality
//1 Risk = N Mitigations
//A Risk has a Mitigation and, therefore, the property miti has an association to exactly one Mitigation. 
//A Mitigation in turn can be used for many Risks, so it has a “to many” association.
//About the ID Keys
//The key is automatically filled by the CAP server, which is exposed to the user of the service with the annotation @(Core.Computed : true)
  entity Risks : managed {
    key ID      : UUID  @(Core.Computed : true);
    title       : String(100);
    prio        : String(5);
    descr       : String;
    miti        : Association to Mitigations;
    impact      : Integer;
    criticality : Integer;
  }

  entity Mitigations : managed {
    key ID       : UUID  @(Core.Computed : true);
    description  : String;
    owner        : String;
    timeline     : String;
    risks        : Association to many Risks on risks.miti = $self;
  }
