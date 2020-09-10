function fish_prompt
	if [ $NNNLVL=1 ]
		echo '(nnn)=> '
	else
		echo ' => '
	end
end
