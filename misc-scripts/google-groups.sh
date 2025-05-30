#!/bin/bash


echo -n "Which gam do you want to use? [al - AppLovin]: "
read alls

read -p "Enter the name of the group for creation: " group_name
read -p "Enter users you want to add in group (space separated): " user_name
case $alls in
        [al] | [aA][lL])
                echo "AppLovin Selected"
                $HOME/src/al-gam/gam create group ${group_name} ; 
                $HOME/src/al-gam/gam  update group ${group_name} whoCanContactOwner ALL_IN_DOMAIN_CAN_CONTACT whoCanJoin INVITED_CAN_JOIN whoCanViewGroup ALL_MEMBERS_CAN_VIEW whoCanPostMessage ALL_MEMBERS_CAN_POST whoCanViewMembership ALL_MEMBERS_CAN_VIEW whoCanModerateMembers OWNERS_AND_MANAGERS

                for i in $user_name
                do
                  $HOME/src/al-gam/gam update group ${group_name} add member $i
                done
                ;;


        *) echo "Invalid input. Please select appropriate GAM to use"
            ;;
esac
