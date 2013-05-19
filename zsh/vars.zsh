# Populate shortened pwd after each cd
function tsp_init() {
	emulate -L zsh
	# Tilde-shortened-path
	export TSP=$(print -P %~)
}
chpwd_functions=( tsp_init $chpwd_functions )

# Initialize TSP now
cd .
