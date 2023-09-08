# Windows Terminal Script run git pull


function Show-df {
echo "========================="
echo "$args 容量空間"
echo "========================="
echo ""
ssh $args 'df -h'
echo ""
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
if [ @? -ne 0 ]; then
    echo "======顯示全部容量完成======"
    exit
fi
