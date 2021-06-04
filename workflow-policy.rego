package workflowResult

default unitTestPass = false
default codeCoveragePass = false
default complexityPass = false
default staticCodeAnalysisPass = false
default passAll = false

unitTestPass = true {
    input.workflow.unitTest.attestations.testQuantity == input.workflow.unitTest.attestations.passQuantity
}

codeCoveragePass = true {
    input.workflow.staticCodeAnalysis.attestations.codeCoverage >= 80
}

complexityPass = true {
    input.workflow.staticCodeAnalysis.attestations.cyclomaticComplexity < 40
}

staticCodeAnalysisPass = true {
    codeCoveragePass
    complexityPass
}

passAll = true {
	unitTestPass
	staticCodeAnalysisPass
}
