Task Default -Depends Test
Task Test {
    $testResults = Invoke-Pester -Path "$PSScriptRoot\default.tests.ps1" -PassThru
    if ($testResults.FailedCount -gt 0) {
        $testResults | Format-List
        Write-Error -Message 'One or more Pester tests failed. Build cannot continue!'
    }
}
