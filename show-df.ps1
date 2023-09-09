#REQUIRES -Version 2


function Show-df
{
    Write-Output "========================="
    Write-Output "    $args 容量空間"
    Write-Output "========================="
    Write-Output ""
    ssh $args 'df -h'
    Write-Output ""
    sleep 2
}

Show-df np
Show-df zt
Show-df agh
Show-df up
Show-df wp
Show-df rd
Show-df n1
Show-df n2
Show-df n3
Show-df n4

# Done
if ($Return -eq 0) {
    Write-Output "讀取空間出現錯誤" }
else {
    Write-Output "讀取空間資料完成" }
Exit
