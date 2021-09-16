#!/bin/bash
#Script to run module list on each cluster and assemble the results into markdown files

#Requires that the user have aliases/forwarding set up for each cluster and the following in util/strip_user_modules.sh to remove any user-specific paths from MODULEPATH before running
# #!/bin/bash
# export MODULEPATH=`echo ${MODULEPATH} | awk -v RS=: -v ORS=: -v user=$USER '$0~user {next} {print}' | sed 's/:*$//'`


function list_sw() {
  sys=$1
  sysid=$2
  syslong=$3
  file="${sysid}.md"
  
  #run module avail
  ssh tc "source util/strip_user_modules.sh && module avail" > $file 2>&1

  #insert header
  sed -i '1s/^/\n```\n/' $file
  sed -i '1s/^/\nWe realize this list is long, but we provide it here for users who want to peruse and\/or search for what they need.\n/' $file
  sed -i "1s/^/\n# List of Software Modules on ${syslong}\n/" $file
  sed -i "1s/^/(sw_${sysid})=\n/" $file

  #insert footer
  echo '```' >> $file
}

list_sw "tc" "tc_rome" "TinkerCliffs AMD Rome Nodes"
list_sw "tc-gpu001" "tc_a100" "TinkerCliffs A100 Nodes"
list_sw "tc-intel001" "tc_intel" "TinkerCliffs Intel AP Nodes"
list_sw "in" "in_t4" "Infer T4 Nodes"
list_sw "inf021" "in_p100" "Infer P100 Nodes"
list_sw "inf061" "in_v100" "Infer V100 Nodes"
