#!/bin/sh

# ------------------------------
# DavDot v0
# a custom dotfile package? manager
# Arguments:
# -f Path to DOTS file
# -i automatically install dependencies
# -D uninstall build dependencies after finishing
# ------------------------------

# [Status and error exits]
# --------------------------
# Thanks to demure for the color snippet
# Sauce: https://stackoverflow.com/questions/16843382/colored-shell-script-output-library
RCol='\e[0m'    # Text Reset

# Regular           Bold                Underline           High Intensity      BoldHigh Intens     Background          High Intensity Backgrounds
Bla='\e[0;30m';     BBla='\e[1;30m';    UBla='\e[4;30m';    IBla='\e[0;90m';    BIBla='\e[1;90m';   On_Bla='\e[40m';    On_IBla='\e[0;100m';
Red='\e[0;31m';     BRed='\e[1;31m';    URed='\e[4;31m';    IRed='\e[0;91m';    BIRed='\e[1;91m';   On_Red='\e[41m';    On_IRed='\e[0;101m';
Gre='\e[0;32m';     BGre='\e[1;32m';    UGre='\e[4;32m';    IGre='\e[0;92m';    BIGre='\e[1;92m';   On_Gre='\e[42m';    On_IGre='\e[0;102m';
Yel='\e[0;33m';     BYel='\e[1;33m';    UYel='\e[4;33m';    IYel='\e[0;93m';    BIYel='\e[1;93m';   On_Yel='\e[43m';    On_IYel='\e[0;103m';
Blu='\e[0;34m';     BBlu='\e[1;34m';    UBlu='\e[4;34m';    IBlu='\e[0;94m';    BIBlu='\e[1;94m';   On_Blu='\e[44m';    On_IBlu='\e[0;104m';
Pur='\e[0;35m';     BPur='\e[1;35m';    UPur='\e[4;35m';    IPur='\e[0;95m';    BIPur='\e[1;95m';   On_Pur='\e[45m';    On_IPur='\e[0;105m';
Cya='\e[0;36m';     BCya='\e[1;36m';    UCya='\e[4;36m';    ICya='\e[0;96m';    BICya='\e[1;96m';   On_Cya='\e[46m';    On_ICya='\e[0;106m';
Whi='\e[0;37m';     BWhi='\e[1;37m';    UWhi='\e[4;37m';    IWhi='\e[0;97m';    BIWhi='\e[1;97m';   On_Whi='\e[47m';    On_IWhi='\e[0;107m';

error()
{
    echo -e "${Red}$@${RCol}"
    exit 1
}

done_with()
{
    echo -e "${Gre}$@${RCol}"
}

done_success()
{
    echo -e "${UGre}$@${RCol}"
}


# [Parse Arguments]
# --------------------------
while getops f:i: flag
do
	case "${flag}" in
		f) PATH_FILE_DOTS=${OPTARG} ;;
		i) AUTO_INSTALL=true ;;
	esac

# [Installation]
# --------------------------

# 1. Open the specified DOTS (text) file and execute it to get its variables
if [ -x ${PATH_FILE_DOTS} ] 
then
	source ${PATH_FILE_DOTS}
fi

# 2. Apply user specified arguments and override default ones (also those in the DOTS file)
# [TODO]

# 3. Check dependencies and install them (if flag is given, otherwise terminate and print missing
# dependencies)
# [TODO]

# 4. Run pre-link hooks
run_pre_hook(){
	echo -e "Running pre-link hook: $1"
	source $1
	echo -e "Done running pre-link hook: $1"
}

for hook_file in $HOOKS_PRE_LINK
do
	run_pre_hook $hook_file
done

# 5. Link the directories and files

# 6. Run post-link hooks
run_post_hook(){
	echo -e "Running post-link hook: $1"
	source $1
	echo -e "Done running post-link hook: $1"
}

for hook_file in $HOOKS_POST_LINK
do
	run_post_hook $hook_file
done


# 7. Uninstall build dependencies (if requested)

# 8. Cleanup temporary files (if any)

# 9. Profit :)
