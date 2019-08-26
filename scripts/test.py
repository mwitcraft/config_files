flag=0

while true
do
if [[ "$flag" -eq '0' ]]
then
	echo "Hello"
	$flag=1
else
	echo "Goodbye"
	$flag=0
fi
done

