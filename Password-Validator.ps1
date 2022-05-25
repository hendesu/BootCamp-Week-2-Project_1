function Green     # color message in green
{
    process { Write-host $_ -ForegroundColor Green} 
    
}

function Red      # color message in red
{
    process { Write-host $_ -ForegroundColor Red} 
    
}

$isdigit=$false
$isupper=$false
$islower=$false
$min=10
$Inputstring =$args[0] 
$CharArray =$InputString.ToCharArray()

  
if ( $CharArray.Length -lt $min ){
    Write-Output "length must be 10" | Red
    Write-Output "exit code 1"
    $tries += 1
    exit 1      
}

foreach($char in $CharArray ){

    if ( $char -match "\d" ){
        $isdigit=$true
        
        
    }
    elseif ($char -cmatch "^[A-Z]*$" ) {
        $isupper=$true
    
    }
    elseif ( $char -cmatch "^[a-z]*$" ) {
        $islower=$true

    }
}


if ($isdigit -eq $false) {

    Write-Output "must contains numbers" "exit code 1" | Red
    $tries += 1 
    exit 1
    
}elseif($isupper -eq $false){

    Write-Output "must contains Upper Case"  "exit code 1" | Red
    $tries += 1
    exit 1

}elseif($islower -eq $false){

    Write-Output "must contains Lower Case" "exit code 1" | Red
    $tries += 1
    exit 1

}else {
    Write-Output "validation succeed!" "exit code 0" | Green
    Start-Sleep -Seconds 2
    exit 0
    
}
$tries
