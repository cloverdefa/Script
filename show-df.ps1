# Windows Terminal Script run git pull


function Show-df {
echo "========================="
echo "$args 容量空間"
echo "========================="
echo ""
ssh $args 'df -h'
echo ""
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
    echo "讀取空間出現錯誤"
    }
else {
    echo "讀取空間資料完成"
    }
Exit
