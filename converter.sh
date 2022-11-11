function DecimaltoBinary()
{
        decimal=$1
        rev_binary=()
        while [ $decimal -ne 0 ]; do
                remainder=`expr $decimal % 2`
                rev_binary+=( $remainder )
                decimal=`expr $decimal / 2`
        done
        echo "Bin : "
        bin=`echo ${rev_binary[@]}|rev`
        echo $bin|tr -d '[:space:]'
}

function BinarytoDecimal()
{
        binary=$1
        idx=0
        decimal=0
        while [ $binary -ne 0 ]; do
                remainder=`expr $binary % 10`
                if [ $remainder -eq 1 ]; then
                        decimal=$(( decimal + 2**idx ))
          fi
                idx=`expr $idx + 1`
                binary=`expr $binary / 10`
        done
        echo "Dec : "
        echo $decimal
}

: '
echo -n Enter the Decimal Number:
read num
DecimaltoBinary $num
'
echo -n Enter the Binary Number:
read num
BinarytoDecimal $num