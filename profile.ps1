# Powershell User Profile


# start pester sessions in a new process each time they are executed to the first 
# module that loads a class doesn't hijack it.
# - https://github.com/pester/Pester/issues/797#issuecomment-314495326
# - https://pester.dev/docs/usage/mocking#mocking-a-function-that-is-called-by-a-method-in-a-powershell-class
function Invoke-PesterJob
{
[CmdletBinding(DefaultParameterSetName='LegacyOutputXml')]
    param(
        [Parameter(Position=0)]
        [Alias('Path','relative_path')]
        [System.Object[]]
        ${Script},

        [Parameter(Position=1)]
        [Alias('Name')]
        [string[]]
        ${TestName},

        [Parameter(Position=2)]
        [switch]
        ${EnableExit},

        [Parameter(ParameterSetName='LegacyOutputXml', Position=3)]
        [string]
        ${OutputXml},

        [Parameter(Position=4)]
        [Alias('Tags')]
        [string[]]
        ${Tag},

        [string[]]
        ${ExcludeTag},

        [switch]
        ${PassThru},

        [System.Object[]]
        ${CodeCoverage},

        [switch]
        ${Strict},

        [Parameter(ParameterSetName='NewOutputSet', Mandatory=$true)]
        [string]
        ${OutputFile},

        [Parameter(ParameterSetName='NewOutputSet', Mandatory=$true)]
        [ValidateSet('LegacyNUnitXml','NUnitXml')]
        [string]
        ${OutputFormat},

        [switch]
        ${Quiet}
    )

    $params = $PSBoundParameters

    Start-Job -ScriptBlock { Set-Location $using:pwd; Invoke-Pester @using:params } |
    Receive-Job -Wait -AutoRemoveJob
}

Set-Alias ipj Invoke-PesterJob